--insert or update procedure

create procedure ContactCreateOrUpdate

@ContactID int,
@Name varchar(50),
@Mobile varchar(50),
@Address varchar(250)

AS
Begin

if(@ContactID = 0)
Begin
insert into contact(Name,Mobile,Address) VALUES (@Name,@Mobile,@Address)
End

ELSE
UPDATE contact set
Name = @Name,
Mobile = @Mobile,
Address = @Address
WHERE ContactID = @ContactID

End

--Procdure for view all contact information

create procedure ContactView
as
begin
select * from contact
end


-- procedure for delete

create procedure ContactdeletebyId
@ContactID int
as
Begin
delete from contact where ContactID = @ContactID
End

--procedure to view contact by id
create procedure ContactviewbyId
@ContactID int
as
begin
select * from contact where ContactID = @ContactID
end

-- procedure for searching
create procedure SearchById
@ContactID int
as 
begin
Select * FROM contact WHERE ContactID=@ContactID
end