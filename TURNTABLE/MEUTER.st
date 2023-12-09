PROGRAM muterr
  VAR
    START AT %IX100.0 : BOOL;
    STOP AT %IX100.1 : BOOL;
    SEN1 AT %IX100.2 : BOOL;
    SEN2 AT %IX100.3 : BOOL;
    SEN3 AT %IX100.4 : BOOL;
    TFrontLimit AT %IX100.5 : BOOL;
    TFrontLimit90 AT %IX100.6 : BOOL;
    CON1 AT %QX100.0 : BOOL;
    CON2 AT %QX100.1 : BOOL;
    TurnRoll AT %QX100.2 : BOOL;
    TurnTable AT %QX100.3 : BOOL;
    SEN1VIR AT %QX0.0 : BOOL;
  END_VAR
  VAR
    TON0 : TON;
  END_VAR

  CON1 := NOT(SEN1VIR) AND (CON1 OR START) AND STOP;
  TON0(IN := SEN1, PT := T#2000ms);
  SEN1VIR := TON0.Q;
  TurnRoll := NOT(SEN2) AND (NOT(TFrontLimit) AND (SEN1 OR TurnRoll) OR TFrontLimit90);
  TurnTable := TFrontLimit;
  CON2 := NOT(SEN3) AND STOP AND (CON2 OR TFrontLimit90);
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : muterr;
  END_RESOURCE
END_CONFIGURATION
