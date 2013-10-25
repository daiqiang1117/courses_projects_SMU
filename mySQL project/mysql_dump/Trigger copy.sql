delimiter //
create procedure CheckGrade(in grade varchar(1))
begin
	declare msg varchar(255);
	if grade != 'A' && grade !='B' && grade != 'C' && grade != 'D' && grade != 'F'
	then 
		Set msg = concat('Constraint check_grade violated: 
							grade must not be in (A, B, C, D, F) '
							, cast(grade as char));
		signal sqlstate '45000' set message_text = msg;
	end if;
end
//
delimiter ;

delimiter //
create procedure CheckMaxEnroll(in CID int, in Year int, in Section varchar(4))
begin
	declare msg varchar(255);
	declare maxEnroll int;
	declare count int;
	Set maxEnroll = (select offering.MaxEnroll from offering 
				  where offering.CID = CID and 
				  offering.Year = Year and 
				  offering.Section = Section);
	Set count = (select count(*) from Register 
				  where Register.CID = CID and 
				  Register.Year = Year and 
				  Register.Section = Section);
	if count = maxEnroll
	then
		Set msg = concat('The offering of the course has been full. MaxEnroll: '
							, cast(maxEnroll as char), ', curCount: ', cast(count as char),
							'CID: ', cast(CID as char),
							'Year: ', cast(Year as char),
							'Section: ', cast(Section as char));
		signal sqlstate '45000' set message_text = msg;
	end if;
end
//
delimiter ;

delimiter //
create procedure CheckRepeatRegister(in SID int, in CID int, in Year int, in Section varchar(4))
begin
	declare msg varchar(255);
	declare count int;
	Set count  = (select count(*) from register where register.SID = SID and 
				   register.CID = CID and register.Year = Year and register.Section = Section);
	if count = 1
	then
		Set msg = concat('A student can not register the same offering: ',', curCount: ', cast(count as char));
		signal sqlstate '45000' set message_text = msg;
	end if;
end//


delimiter //
create procedure IsthereGrade(in CID int, in Year int, in Section varchar(4))
begin
	declare msg varchar(255);
	declare count int;
	Set count  = (select count(*) from register where
				   register.CID = CID and register.Year = Year 
                 and register.Section = Section and register.FinalGrade is not null);
	if count >= 0
	then
		Set msg = concat('A student can not drop an offering which already has a grade: ',', curCount: ', cast(count as char));
		signal sqlstate '45000' set message_text = msg;
	end if;
end//

delimiter //
create procedure PrerequisitesCheck(in CID int, in SID int)
begin
	declare msg varchar(255);
	declare grade varchar(1);
	declare prerequisites1 int;
	declare prerequisites2 int;
	declare prerequisites3 int;
	Set prerequisites1 = (select courses.Prerequisite1 from courses where courses.CID = CID);
	Set prerequisites2 = (select courses.Prerequisite2 from courses where courses.CID = CID);
	Set prerequisites3 = (select courses.Prerequisite3 from courses where courses.CID = CID);
	Set grade = (select max(Register.FinalGrade) from Register where Register.CID = prerequisites1 
                and Register.SID = SID);
    if (grade = null) || (grade = 'D' && grade = 'F')
	then
		Set msg = concat('To register course: ',cast(CID as char),
                        ', the student: ', cast(SID as char), 
		                 ', has to finish course: ', cast(prerequisites1 as char),
                         ', grade: ', cast(grade as char));
		signal sqlstate '45000' set message_text = msg;
	else Set grade = (select max(Register.FinalGrade) from Register where Register.CID = prerequisites2
                and Register.SID = SID);
	end if;
	if (grade = null) || (grade = 'D' && grade = 'F')
	then
		Set msg = concat('To register course: ',cast(CID as char),
                        ', the student: ', cast(SID as char), 
		                 ', has to finish course: ', cast(prerequisites2 as char),
						   ', grade: ', cast(grade as char));
		signal sqlstate '45000' set message_text = msg;
	/*Note: A has the min value in ASCII code comparing whit B,C,D,F*/
	else Set grade = (select min(Register.FinalGrade) from Register where Register.CID = prerequisites3
                and Register.SID = SID );
	end if;
	if (grade = null) || (grade = 'D' && grade = 'F')
	then
		Set msg = concat('To register course: ',cast(CID as char),
                        ', the student: ', cast(SID as char), 
		                 ', has to finish course: ', cast(prerequisites3 as char),
						   ', grade: ', cast(grade as char));
		signal sqlstate '45000' set message_text = msg;
	end if;
end//

create trigger iRegisterCheck before insert on register
for each row
begin
	call CheckGrade(new.FinalGrade);
	call CheckMaxEnroll(new.CID, new.Year, new.Section);
	call CheckRepeatRegister(new.SID, new.CID, new.Year, new.Section);
	call PrerequisitesCheck(new.CID, new.SID);
end//

create trigger uRegisterCheck before update on register
for each row
begin
	call CheckGrade(new.FinalGrade);
	call CheckMaxEnroll(new.CID, new.Year, new.Section);
	call CheckRepeatRegister(new.SID, new.CID, new.Year, new.Section);
	call PrerequisitesCheck(new.CID, new.SID);
end//


create trigger DRegisterCheck before delete on register
for each row
begin
	call IsthereGrade(old.CID, old.Year, old.Section);
end//
delimiter ;