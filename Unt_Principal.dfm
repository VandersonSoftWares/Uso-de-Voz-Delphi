object Frm_Principal: TFrm_Principal
  Left = 0
  Top = 0
  Caption = 'Ouvir Dados'
  ClientHeight = 276
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_Veloc: TLabel
    Left = 368
    Top = 198
    Width = 133
    Height = 18
    Caption = 'Velocidade da Voz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_Voz: TLabel
    Left = 387
    Top = 148
    Width = 114
    Height = 18
    Caption = 'Selecione a Voz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_Pos: TLabel
    Left = 512
    Top = 225
    Width = 18
    Height = 18
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Btn_Ouvir: TButton
    Left = 280
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ouvir'
    TabOrder = 0
    OnClick = Btn_OuvirClick
  end
  object Rch_Obs: TRichEdit
    Left = 8
    Top = 161
    Width = 192
    Height = 107
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Vanderson Cavalcante de Freitas,'
      'Desenvolvedor de Softwares.'
      'Telefone: (11)8184-6862'
      'E-Mail: vanderson.freitas@ig.com.br')
    ParentFont = False
    TabOrder = 1
  end
  object Dbg_Cadastro: TDBGrid
    Left = 8
    Top = 8
    Width = 521
    Height = 120
    DataSource = Ds_Cadastro
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Nvg_Cadastro: TDBNavigator
    Left = 8
    Top = 130
    Width = 240
    Height = 25
    DataSource = Ds_Cadastro
    TabOrder = 3
  end
  object TbRate: TTrackBar
    Left = 255
    Top = 223
    Width = 251
    Height = 45
    Max = 5
    Min = -4
    TabOrder = 4
    OnChange = TbRateChange
  end
  object Cbx_Voz: TComboBox
    Left = 261
    Top = 171
    Width = 240
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'Cbx_Voz'
    OnChange = Cbx_VozChange
  end
  object SpVoice: TSpVoice
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    Left = 397
    Top = 72
  end
  object Ds_Cadastro: TDataSource
    DataSet = Cds_Cadastro
    Left = 331
    Top = 73
  end
  object Cds_Cadastro: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 462
    Top = 73
    Data = {
      800000009619E0BD0100000018000000040000000000030000008000044E4F4D
      45010049000000010005574944544802000200140008454E44455245434F0100
      4900000001000557494454480200020028000854454C45464F4E450100490000
      0001000557494454480200020014000A4454434144415354524F040006000000
      00000000}
    object Cds_CadastroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 27
      FieldName = 'NOME'
    end
    object Cds_CadastroENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 38
      FieldName = 'ENDERECO'
      Size = 40
    end
    object Cds_CadastroTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 17
      FieldName = 'TELEFONE'
    end
    object Cds_CadastroDTCADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 19
      FieldName = 'DTCADASTRO'
    end
  end
end
