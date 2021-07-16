program ThreadAlertByTime;

uses
  Forms,
  MainForm in 'MainForm.pas' {formMain},
  AlertThreadUnit in 'AlertThreadUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
