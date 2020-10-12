PROGRAM program0
  VAR
    Sensor AT %IX100.0 : BOOL;
    PusherFront AT %IX100.1 : BOOL;
    Reset AT %IX100.7 : BOOL;
    Pusher AT %QX100.1 : BOOL := 0;
    InConveyor AT %QX100.0 : BOOL := 1;
    OutConveyor AT %QX100.2 : BOOL := 1;
  END_VAR
  VAR
    T1 : TON;
    Temp : BOOL := 0;
  END_VAR

  T1(IN:=Temp, PT:= T#2000ms);



  IF Reset THEN 

    Pusher:= 0;
    Temp:= 0;

  END_IF; 

  IF Sensor THEN 

    Temp:= 1;

  END_IF;


  IF T1.Q THEN 

    Pusher:= 1;
    Temp:=0;

  END_IF;

  IF PusherFront THEN 

    Pusher:= 0;

  END_IF;



END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
