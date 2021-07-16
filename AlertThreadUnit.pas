unit AlertThreadUnit;

interface

  uses Classes, ComCtrls, DateUtils, Dialogs, SysUtils;

type
  TAlertThread = class(TThread)
  private
    procedure sendAlert();
    function lPad(n: integer): string;
    function getStrTimeLeft(t: TDateTime): string;
  protected
    procedure Execute; override;
  public
    stb: TStatusBar;
    time_end: TDateTime;
  end;

var
  m: integer;

const
  TIME_DELAY = 60000;

implementation

function TAlertThread.lPad(n: integer): string;
begin
  if n < 10 then
    Result := '0' + IntToStr(n)
  else
    Result := IntToStr(n);
end;

function TAlertThread.getStrTimeLeft(t: TDateTime): string;
var h, m: integer;
begin
  m := MinutesBetween(Now(), t);

  if m < 60 then
    h := 0
  else
    begin
      h := m div 60;
      m := m mod 60;
    end;

  Result := IntToStr(h) + ':' + lPad(m);

end;

procedure TAlertThread.Execute;
begin
  while not Terminated do
    begin
      sleep(TIME_DELAY);
      Synchronize(sendAlert);
    end;
end;

procedure TAlertThread.sendAlert();
begin
  if Now() > time_end then
    begin
      ShowMessage('Out of time!');
      stb.SimpleText := 'Out of time!';
      Terminate;
    end
  else
    begin
      m := MinutesBetween(Now(), time_end);
      if m = 3 then
        ShowMessage('Left 3 minutes');
      stb.SimpleText := 'Time left: ' + getStrTimeLeft(time_end);

    end;
end;

end.
