inherited AddDiagnos: TAddDiagnos
  AutoSize = False
  Caption = 'AddDiagnos'
  ClientWidth = 791
  ExplicitWidth = 797
  PixelsPerInch = 96
  TextHeight = 13
  inherited Image1: TImage
    Width = 785
    ExplicitWidth = 785
  end
  inherited Bevel1: TBevel
    Width = 785
    ExplicitWidth = 785
  end
  inherited Bevel2: TBevel
    Top = 212
    Width = 778
    Height = 214
    ExplicitTop = 212
    ExplicitWidth = 778
    ExplicitHeight = 214
  end
  inherited Bevel3: TBevel
    Width = 537
    Height = 163
    ExplicitWidth = 537
    ExplicitHeight = 163
  end
  inherited Label5: TLabel
    Width = 333
    Caption = 'Ajouter un Diagnostic et les soins'
    ExplicitWidth = 333
  end
  inherited SpeedButton1: TSpeedButton
    Left = 513
    Top = 180
    ExplicitLeft = 513
    ExplicitTop = 180
  end
  inherited SpeedButton2: TSpeedButton
    Left = 690
    Top = 47
    Enabled = False
    Visible = False
    ExplicitLeft = 690
    ExplicitTop = 47
  end
  inherited SpeedButton3: TSpeedButton
    Left = 722
    Top = 47
    Enabled = False
    Visible = False
    ExplicitLeft = 722
    ExplicitTop = 47
  end
  inherited Label3: TLabel
    Left = 38
    Top = 186
    Width = 76
    Caption = 'Diagnostics'
    ExplicitLeft = 38
    ExplicitTop = 186
    ExplicitWidth = 76
  end
  inherited Label1: TLabel
    Left = 72
    ExplicitLeft = 72
  end
  inherited Label15: TLabel
    Left = 79
    ExplicitLeft = 79
  end
  inherited Label2: TLabel
    Left = 29
    Top = 86
    Width = 86
    Caption = 'N'#176'Diagnostic'
    ExplicitLeft = 29
    ExplicitTop = 86
    ExplicitWidth = 86
  end
  inherited Label14: TLabel
    Left = 49
    ExplicitLeft = 49
  end
  object Label4: TLabel [13]
    Left = 48
    Top = 215
    Width = 193
    Height = 16
    Caption = 'Description du medicament '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [14]
    Left = 349
    Top = 215
    Width = 236
    Height = 16
    Caption = 'Mesure------Qte---------------Dosage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton [15]
    Left = 285
    Top = 228
    Width = 23
    Height = 28
    Hint = 'Trouver un produit a prescrire'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  inherited Ajouter: TBitBtn
    Left = 692
    Top = 234
    ExplicitLeft = 692
    ExplicitTop = 234
  end
  inherited Suprimer: TBitBtn
    Left = 692
    Top = 274
    ExplicitLeft = 692
    ExplicitTop = 274
  end
  inherited ToolBar1: TToolBar
    Width = 791
    ExplicitWidth = 791
  end
  inherited N_Entree: TDBEditEh
    DataSource = Diagnostiques_S
  end
  inherited N_Ana: TDBEditEh
    DataField = 'n_dia'
    DataSource = Diagnostiques_S
  end
  inherited Date_Ind: TDBEditEh
    DataField = 'date_dia'
    DataSource = Diagnostiques_S
  end
  inherited Heure_Ind: TDBEditEh
    DataField = 'heureenreg'
    DataSource = Diagnostiques_S
  end
  inherited Nom_Ana: TDBEditEh
    DataField = 'resultat_dia'
    DataSource = Diagnostiques_S
  end
  inherited RemAnalyse: TDBMemoEh
    DataField = 'RemDiagnostic'
    DataSource = Diagnostiques_S
    TabOrder = 13
  end
  inherited G_ana: TDBGridEh
    Left = 16
    Top = 256
    Width = 670
    Height = 173
    DataSource = soins_S
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 14
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RefMedicament'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Reference'
        Title.Color = 8454143
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
        Width = 119
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'nom_med'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Designation'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 250
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'unite_med'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Unites'
        Title.Color = 8454143
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 112
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'qtt_med'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Qte'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Dosage'
        Footers = <>
        Width = 175
      end>
  end
  inherited DBEditEh1: TDBEditEh
    Left = 424
    Top = 230
    Width = 64
    ControlLabel.ExplicitLeft = 424
    ControlLabel.ExplicitTop = 214
    DataField = 'qtt_med'
    DataSource = soins_S
    ExplicitLeft = 424
    ExplicitTop = 230
    ExplicitWidth = 64
  end
  inherited DBEditEh2: TDBEditEh
    Left = 753
    Top = 49
    Width = 25
    ControlLabel.ExplicitLeft = 753
    ControlLabel.ExplicitTop = 33
    Enabled = False
    Visible = False
    ExplicitLeft = 753
    ExplicitTop = 49
    ExplicitWidth = 25
  end
  object UnitesDemesure: TDBLookupComboBox [28]
    Left = 307
    Top = 230
    Width = 111
    Height = 26
    DataField = 'unite_med'
    DataSource = soins_S
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    KeyField = 'designation'
    ListField = 'designation'
    ListSource = presentation_S
    ParentFont = False
    TabOrder = 10
  end
  object DBEditEh3: TDBEditEh [29]
    Left = 488
    Top = 230
    Width = 198
    Height = 26
    DataField = 'Dosage'
    DataSource = soins_S
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = True
  end
  object Produits: TDBEditEh [30]
    Left = 16
    Top = 229
    Width = 270
    Height = 26
    DataField = 'nom_med'
    DataSource = soins_S
    DynProps = <>
    EditButtons = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = True
  end
  inherited analyses_s: TDataSource
    Left = 678
    Top = 147
  end
  inherited analyses2: TDataSource
    Left = 733
    Top = 157
  end
  inherited AdvMenuStyler1: TAdvMenuStyler
    Left = 216
  end
  inherited AdvMainMenu1: TAdvMainMenu
    Left = 400
  end
  object Medicaments_S: TDataSource [36]
    DataSet = ClientModule1.Medicaments
    Left = 688
    Top = 96
  end
  object Diagnostiques_S: TDataSource [37]
    DataSet = ClientModule1.Diagnostiques
    Left = 584
    Top = 120
  end
  object soins_S: TDataSource [38]
    DataSet = ClientModule1.soins
    Left = 584
    Top = 16
  end
  object presentation_S: TDataSource [39]
    DataSet = ClientModule1.presentation
    Left = 587
    Top = 69
  end
  inherited ApplicationEvents1: TApplicationEvents
    Left = 376
    Top = 120
  end
end
