unit Unt_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, OleServer, SpeechLib_TLB, DB, ExtCtrls, DBCtrls,
  Grids, DBGrids, DBClient, Midas;

type
  TFrm_Principal = class(TForm)
    SpVoice: TSpVoice;
    Btn_Ouvir: TButton;
    Rch_Obs: TRichEdit;
    Dbg_Cadastro: TDBGrid;
    Nvg_Cadastro: TDBNavigator;
    Ds_Cadastro: TDataSource;
    Cds_Cadastro: TClientDataSet;
    Cds_CadastroNOME: TStringField;
    Cds_CadastroENDERECO: TStringField;
    Cds_CadastroTELEFONE: TStringField;
    Cds_CadastroDTCADASTRO: TDateField;
    TbRate: TTrackBar;
    Lbl_Veloc: TLabel;
    Cbx_Voz: TComboBox;
    Lbl_Voz: TLabel;
    Lbl_Pos: TLabel;
    procedure Btn_OuvirClick(Sender: TObject);
    procedure TbRateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cbx_VozChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure InserirDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

procedure TFrm_Principal.Btn_OuvirClick(Sender: TObject);
begin
  SpVoice.Speak('Nome', SVSFlagsAsync);
  Sleep(1000);
  SpVoice.Speak(Cds_CadastroNOME.AsString, SVSFlagsAsync);
  Sleep(2200);

  SpVoice.Speak('Endereço', SVSFlagsAsync);
  Sleep(1800);
  SpVoice.Speak(Cds_CadastroENDERECO.AsString, SVSFlagsAsync);
  Sleep(2200);

  SpVoice.Speak('Telefone', SVSFlagsAsync);
  Sleep(1800);
  SpVoice.Speak(Cds_CadastroTELEFONE.AsString, SVSFlagsAsync);
  Sleep(2200);

  SpVoice.Speak('Cadastrado', SVSFlagsAsync);
  Sleep(1800);
  SpVoice.Speak(Cds_CadastroDTCADASTRO.AsString, SVSFlagsAsync);
  Sleep(2600);

  SpVoice.Speak(Rch_Obs.Text, SVSFlagsAsync);
end;

procedure TFrm_Principal.Cbx_VozChange(Sender: TObject);
var
  SOToken: ISpeechObjectToken;
begin
  SOToken := ISpeechObjectToken(Pointer(
    Cbx_Voz.Items.Objects[Cbx_Voz.ItemIndex]));

  SpVoice.Voice := SOToken;
end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
var
  I: Integer;
  SOToken: ISpeechObjectToken;
  SOTokens: ISpeechObjectTokens;
begin
  SpVoice.EventInterests := SVEAllEvents;
  SOTokens               := SpVoice.GetVoices('', '');

  for I := 0 to SOTokens.Count - 1 do
  begin
    SOToken := SOTokens.Item(I);
    Cbx_Voz.Items.AddObject(SOToken.GetDescription(0), TObject(SOToken));
    SOToken._AddRef;
  end;

  if Cbx_Voz.Items.Count > 0 then
  begin
    Cbx_Voz.ItemIndex := 0;
    Cbx_Voz.OnChange(Cbx_Voz);
  end;

  TbRate.Position := SpVoice.Rate;
  Lbl_Pos.Caption := IntToStr(TbRate.Position);
  InserirDados;
end;

procedure TFrm_Principal.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Cbx_Voz.Items.Count - 1 do
    ISpeechObjectToken(Pointer(Cbx_Voz.Items.Objects[I]))._Release;
end;

procedure TFrm_Principal.InserirDados;
begin
  with Cds_Cadastro do
  begin
    Insert;
    FieldByName('NOME').AsString     := 'Angelina Jolie';
    FieldByName('ENDERECO').AsString := 'Rua Gomes da Silva, Nº520';
    FieldByName('TELEFONE').AsString := '(99)7218-3542';
    FieldByName('DTCADASTRO').AsDateTime := Now;//StrToDate('16/12/1982');
    Post;
  end;
end;

procedure TFrm_Principal.TbRateChange(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt);
  SpVoice.Rate := TbRate.Position;
  Lbl_Pos.Caption := IntToStr(TbRate.Position);
end;

end.
