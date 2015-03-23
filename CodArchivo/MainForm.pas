unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TfrmMain = class(TForm)
    OpenDialog1: TOpenDialog;
    ToolBar1: TToolBar;
    btnAbrir: TButton;
    btnGuardar: TButton;
    UTF16: TRadioButton;
    UTF8: TRadioButton;
    ANSI: TRadioButton;
    BOM: TCheckBox;
    Memo1: TMemo;
    procedure btnAbrirClick(Sender: TObject);
    procedure ANSIChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fileName: TFileName;
    codActual: TEncoding;
    function getEncoding: TEncoding;

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

function TfrmMain.getEncoding;
begin
  if UTF16.IsChecked then
    result := TEncoding.Unicode
  else if UTF8.IsChecked then
       result := TEncoding.UTF8
       else result := TEncoding.ANSI;
end;

procedure TfrmMain.ANSIChange(Sender: TObject);
var
  codNueva: TEncoding;
begin
  codNueva := getEncoding;

  if codActual <> codNueva then
  begin
    Memo1.Text := codNueva.GetString(
      TEncoding.Convert(codActual, codNueva,
        codActual.GetBytes(Memo1.Text)));

  codActual := codNueva;
  end;
end;

procedure TfrmMain.btnAbrirClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    fileName := OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(fileName, getEncoding);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  codActual := getEncoding;
end;

end.