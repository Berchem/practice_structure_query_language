create procedure loop99 @FirstNumber int, @SecondNumber int

as
declare @i int
declare @j int
declare @str varchar(max)
select @i=1,@j=1,@str=''

while(@i<=@FirstNumber)
  begin
    while(@j<=@SecondNumber)
	begin
	  set @str=@str+format(@i,'00')+'*'+format(@j,'00')+'='+format(@i*@j,'00')+char(9)
	  set @j=@j+1
	end
	print @str
	set @i=@i+1
	set @j=1
	set @str=''
  end