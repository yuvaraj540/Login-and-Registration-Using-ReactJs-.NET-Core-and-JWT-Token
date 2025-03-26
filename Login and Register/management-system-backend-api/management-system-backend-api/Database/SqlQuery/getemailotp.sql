use ManagementSystem;

create procedure getemailotp
	@id varchar(255),
	@email varchar(255)

as
begin
	select *
	from ManagementUser
	where Id = @id and Email = @email
end