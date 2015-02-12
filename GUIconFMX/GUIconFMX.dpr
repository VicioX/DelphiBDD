program GUIconFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form4},
  DataModule in 'DataModule.pas' {MyDataModule: TDataModule},
  DataNavigation in 'DataNavigation.pas' {frmNavegacion};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TMyDataModule, MyDataModule);
  Application.CreateForm(TfrmNavegacion, frmNavegacion);
  Application.Run;
end.
