program Ouvir;

uses
  Forms,
  Unt_Principal in 'Unt_Principal.pas' {Frm_Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ouvir Dados';
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
