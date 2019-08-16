unit AddPersonneU;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, OKCANCL1, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.DBClientActns, Vcl.ActnList, Vcl.DBActns,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Grids, Vcl.DBGrids,
  JvDBControls, Vcl.ComCtrls, Datasnap.DBClient, DBGridEh, DBCtrlsEh, DBLookupEh,
  JvExStdCtrls, JvBehaviorLabel;

type
  TAddPersonne = class(TOKBottomDlg)
    Timer1: TTimer;
    Image1: TImage;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    Label29: TLabel;
    un: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit16: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    DBEdit1: TDBEdit;
    Homme: TRadioButton;
    Femme: TRadioButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    RadioButton1: TRadioButton;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label6: TLabel;
    Label24: TLabel;
    Label8: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label25: TLabel;
    neuf: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit14: TDBEdit;
    ABO_Mal: TComboBox;
    DBCheckBoxEh1: TDBCheckBoxEh;
    GroupBox4: TGroupBox;
    Label36: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    ComboBox1: TComboBox;
    Label37: TLabel;
    Label39: TLabel;
    DBEdit24: TDBEdit;
    Label40: TLabel;
    DBEdit25: TDBEdit;
    Label41: TLabel;
    DBEdit26: TDBEdit;
    GroupBox5: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    quatre: TDBLookupComboboxEh;
    Label16: TLabel;
    six: TDBLookupComboboxEh;
    Label15: TLabel;
    onze: TDBLookupComboboxEh;
    Label10: TLabel;
    huit: TDBLookupComboboxEh;
    Label17: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    dix: TDBLookupComboboxEh;
    Label2: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    cinq: TDBLookupComboboxEh;
    trois: TDBLookupComboboxEh;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    Label19: TLabel;
    zero: TDBEdit;
    Image2: TImage;
    procedure HelpBtnClick(Sender: TObject);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddPersonne: TAddPersonne;

implementation

{$R *.dfm}

uses ClientModuleUnit1, InfoPersonneU;  //ClientModule1
 type
  AlternGrid = class(TCustomDBGrid);


procedure TAddPersonne.BitBtn1Click(Sender: TObject);
begin
  inherited;
  TRY
    ClientModule1.T_PERSONNE.edit;
    ClientModule1.VT_PERSONNE;
  FINALLY
    ClientModule1.TPERSONNEPARTYPE.Open;
    InfoPersonne.Parent:=GroupBox6;
    InfoPersonne.show;
  END;

end;

procedure TAddPersonne.CancelBtnClick(Sender: TObject);
begin
  inherited;
  ClientModule1.T_PERSONNE.CANCEL;
end;

procedure TAddPersonne.DBGrid2EditButtonClick(Sender: TObject);
begin
  inherited;
//  RSousClientfm.showmodal;
end;

procedure TAddPersonne.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
    with AlternGrid(Sender) do begin
                               Case Odd(DataSource.Dataset.Recno) of
                                    true : Canvas.Brush.Color := $00E1D3CE;
                                    False :Canvas.Brush.Color := $00D5E3EE;
                               end;
                               if  DataLink.ActiveRecord = Row -1 then
                               begin
                               Canvas.Font.Color:=clwhite ;
                               Canvas.Brush.Color:=$C56A31;
                               end;
                               end;
(Sender as tdbgrid).DefaultDrawColumnCell(Rect,DataCol,Column, State);

end;

procedure TAddPersonne.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TAddPersonne.OKBtnClick(Sender: TObject);
begin
  inherited;
   ClientModule1.VT_personne;
   //AddPersonne.Release;
end;

procedure TAddPersonne.Timer1Timer(Sender: TObject);
begin
  inherited;
//okbtn.Enabled:=
//
//   ( (un.GetTextLen >0)
//
// AND (trois.GetTextLen > 0 )
// AND (quatre.GetTextLen > 0 )
// AND (cinq.GetTextLen > 0 )
// AND (six.GetTextLen > 0 )
// AND (huit.GetTextLen > 0 )
// AND (onze.GetTextLen > 0 )
// AND (dix.GetTextLen > 0 )  )  ;
//
//Attrib.Enabled:=
//
//   ( (un.GetTextLen >0)
//
// AND (trois.GetTextLen > 0 )
// AND (quatre.GetTextLen > 0 )
// AND (cinq.GetTextLen > 0 )
// AND (six.GetTextLen > 0 )
// AND (huit.GetTextLen > 0 )
// AND (onze.GetTextLen > 0 )
// AND (dix.GetTextLen > 0 ) ) ;

end;

end.
