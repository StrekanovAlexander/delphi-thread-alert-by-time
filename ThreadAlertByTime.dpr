program ThreadAlertByTime;

uses
  Forms,
  MainForm in 'MainForm.pas' {formMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
