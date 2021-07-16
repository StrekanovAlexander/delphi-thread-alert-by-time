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
    btnTimeLeft: TButton;
    procedure btnRunClick(Sender: TObject);
    function lPad(n: integer): string;
    function getTimeLeft(t: TDateTime): string;
    procedure FormCreate(Sender: TObject);
    procedure btnTimeLeftClick(Sender: TObject);
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

function TformMain.lPad(n: integer): string;
begin
  if n < 10 then
    Result := '0' + IntToStr(n)
  else
    Result := IntToStr(n);
end;

function TformMain.getTimeLeft(t: TDateTime): string;
var h, m: integer;
begin
  m := MinutesBetween(Now(), t) + 1;

  if m < 60 then
    h := 0
  else
    begin
      h := m div 60;
      m := m mod 60;
    end;

  Result := IntToStr(h) + ':' + lPad(m);

end;

procedure TformMain.FormCreate(Sender: TObject);
begin
  dtpTimeStart.Time := Now();
  dtpTimeEnd.Time := Now();
end;

procedure TformMain.btnRunClick(Sender: TObject);
var AlertThread: TAlertThread;
begin
  dtpTimeEnd.Time := IncMinute(dtpTimeStart.Time, StrToInt(cbMinutesAdd.Text));

  AlertThread := TAlertThread.Create(False);
  with AlertThread do
    begin
      FreeOnTerminate := true;
      Priority := tpLowest;
      Resume;
    end;

end;

procedure TformMain.btnTimeLeftClick(Sender: TObject);
begin
  stbBar.SimpleText := getTimeLeft(dtpTimeEnd.Time);
end;

end.
