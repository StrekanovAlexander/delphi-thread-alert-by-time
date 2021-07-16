unit AlertThreadUnit;

interface

  uses Classes, Dialogs, SysUtils;

type
  TAlertThread = class(TThread)
  private
    procedure sendAlert();
  protected
    procedure Execute; override;
  end;

const
  TIME_DELAY = 5000;

implementation

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
  ShowMessage('Some Alert');
end;

end.
