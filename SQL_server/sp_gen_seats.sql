create procedure gen_seats ( @v_ptime  varchar(20), 
                               @v_movie  int, 
                               @v_roomid varchar(10) )

  AS
  delete  from dbo.seats;
delete  from dbo.playlist;

  BEGIN
    DECLARE   @v_row     int;
    DECLARE   @v_col     int;
    DECLARE   @x_row     int;
    DECLARE   @x_col     int;


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
