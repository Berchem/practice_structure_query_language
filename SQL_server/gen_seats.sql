	delete  from dbo.seats;
	delete  from dbo.playlist;

BEGIN
  DECLARE   @v_row     int;
  DECLARE   @v_col     int;
  DECLARE   @v_ptime   varchar(20); 
  DECLARE   @v_movie   int;
  DECLARE   @v_roomid  varchar(10);
  DECLARE   @x_row     int;
  DECLARE   @x_col     int;

  SET @v_ptime  = '2016-12-25 13:00';
  SET @v_movie  = 1;
  SET @v_roomid = 'AÆU';


  select @v_row = seat_row , @v_col = seat_col
  from   m_room
  where  roomid =  @v_roomid;


  SET @x_row = 1;       
    WHILE ( @x_row  <= @v_row )
      BEGIN
        SET @x_col = 1;     
        WHILE ( @x_col  <= @v_col )
          BEGIN
                 insert into seats values ( @v_ptime, @v_movie,  cast(format(@x_row,'00') as varchar(max) )+ '-' + cast(format(@x_col,'00') as varchar(max)), '0', NULL);
               SET @x_col = 1 +@x_col;
			   
          END; 
               SET @x_row = 1 + @x_row; 
			   SET @x_col = 1;
      END;
END;