FUNCTION_BLOCK base_path
  VAR_INPUT
    I1 : BOOL;
  END_VAR
  VAR_OUTPUT
    Out1 : BOOL;
  END_VAR

  (*Function Block*)
  I1:= True;
  Out1:=  True;

END_FUNCTION_BLOCK

PROGRAM root
  VAR
    func_block : base_path;
  END_VAR
  VAR
    O1 AT %QX1.0 : BOOL := False;
  END_VAR
  VAR
    O2 : BOOL;
  END_VAR

  (*Control Logic*)
  O1:= False;
  O2:= False;
  (*Function Call*)
  func_block(I1:=O2, Out1=> O1);


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : root;
  END_RESOURCE
END_CONFIGURATION