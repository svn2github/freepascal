{ %fail }
{$ifdef fpc}
{$mode delphi}
{$endif fpc}

{$ifdef FPC_COMP_IS_INT64}
type 
  comp = double;
{$endif FPC_COMP_IS_INT64}
procedure test(var a); overload;
  begin
    writeln('formal called instead of longint');
    writeln('XXX')
  end;

procedure test(a: longint); overload;
  begin
    writeln('longint called instead of formal');
    writeln('YYY')
  end;

var
  v: variant;
  x: longint;
  y: longint;

begin
  try
    v := x;
    test(v);
  except
    on E : TObject do
      writeln('QQQ');
  end;

  try
    v := y;
    test(v);
  except
    on E : TObject do
      writeln('VVV');
  end;
end.
