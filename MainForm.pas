unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DateUtils;

type
  TformMain = class(TForm)
    dtpTimeStart: TDateTimePicker;
    lbTimeStart: TLabel;
    cbMinutesAdd: TComboBox;
    dtpTimeEnd: TDateTimePicker;
    lbMinutesAdd: TLabel;
    lbTimeEnd: TLabel;
    btnRun: TButton;
    stbBar: TStatusBar;
    procedure btnRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation
  uses AlertThreadUnit;

{$R *.dfm}


procedure TformMain.FormCreate(Sender: TObject);
begin
  dtpTimeStart.Time := Now();
  dtpTimeEnd.Time := Now();
end;

procedure TformMain.btnRunClick(Sender: TObject);
var AlertThread: TAlertThread;
begin
  dtpTimeEnd.Time := IncMinute(dtpTimeStart.Time, StrToInt(cbMinutesAdd.Text));

  AlertThread := TAlertThread.Create(True);
  with AlertThread do
    begin
      stb := Self.stbBar;
      time_end := dtpTimeEnd.Time;
      FreeOnTerminate := true;
      Priority := tpLowest;
      Resume;
    end;

end;

end.
