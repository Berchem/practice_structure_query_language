create TRIGGER trig_seats 
ON    playlist
AFTER INSERT
AS
BEGIN
  DECLARE   @v_ptime   varchar(20); 
  DECLARE   @v_movie   int;
  DECLARE   @v_roomid  varchar(10);

  SELECT @v_ptime = ptime, @v_movie = movie, @v_roomid =roomid
  FROM   inserted;

  EXEC gen_seats @v_ptime, @v_movie, @v_roomid;

  select * from seats;
END;