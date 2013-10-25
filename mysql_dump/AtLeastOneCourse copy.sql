delimiter //
create procedure AtLeastOneCourse(in FID int)
begin
	declare msg varchar(255);
	declare count int;
	set count = (select count(*)from Instruct where Instruct.FID = FID);
	IF count < 2
	THEN
		Set msg = concat('Constraint trigger AtLeastOneCourse: 
							A faculty must at least instruct one course, count:', 
							cast(count as char),', FID:', cast(FID as char));
		signal sqlstate '45000' set message_text = msg;
	end if;
end//
delimiter ;

delimiter //
create trigger DatLeastOne_Course before Delete on Instruct
for each row
begin
	CALL AtLeastOneCourse(OLD.FID);
end//
delimiter ;

/* Note: there still have a problem that if the faculty retires, the faculty
must be deleted both in talbe "Faculty" and table "Instruct". In that time, 
will the trigger do a false constraint*/