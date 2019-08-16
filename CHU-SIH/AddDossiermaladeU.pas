unit AddDossiermaladeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Grids, Vcl.DBGrids, DBCtrlsEh,
  Vcl.Mask, Vcl.ToolWin, Vcl.AppEvnts, AdvMenus, System.ImageList, Vcl.ImgList,
  Vcl.Menus, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, DBLookupEh;

type
  TAddDossiermalade = class(TForm)
    Image1: TImage;
    Bevel2: TBevel;
    Label11: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    Label6: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Nom_Gar: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBComboBoxEh1: TDBComboBoxEh;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ImageList1: TImageList;
    AdvMenuStyler1: TAdvMenuStyler;
    ApplicationEvents1: TApplicationEvents;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DBEditEh1: TDBEditEh;
    G_analyse: TDBGridEh;
    DataSource2: TDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure G_analyseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddDossiermalade: TAddDossiermalade;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, RechercheDonneesU,
 Addentreeu, Dossieru, Constantes;
type
  AlternGrid = class(TCustomDBGrideh);

procedure TAddDossiermalade.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  ToolButton1.Enabled:= (ClientModule1.DossierPatient.State in [dsedit,dsinsert]) ;
  ToolButton3.Enabled:= (ClientModule1.DossierPatient.State in [dsedit,dsinsert]) ;
  ToolButton2.Enabled:= NOT (ClientModule1.DossierPatient.State in [dsedit,dsinsert]);

end;

procedure TAddDossiermalade.BitBtn1Click(Sender: TObject);
begin
TRY
   ClientModule1.VDossierParPatient;

if ClientModule1.Malades.FindKey([RechercheDonnees.TMalades.FieldByName('n_malade').AsString]) then
  BEGIN
   ClientModule1.Malades.Edit;
   ClientModule1.Malades.fieldbyName('numDos').AsString:=  ClientModule1.DossierPatientnumdos.AsString;
   ClientModule1.Vmalade;
  END;

FINALLY
  ClientModule1.GETRecherchesTrouveParDossier( Dossier.N_Malade.Text);
  if MessageDlg('Voulez-vous enregistrer la prise en Charge du Dossier Patient?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     Addentree.Show ;
  AddDossiermalade.Close;
END;
end;

procedure TAddDossiermalade.FormShow(Sender: TObject);
begin
ClientModule1. DossierPatient.Open;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
Nom_Gar.SetFocus;
end;

procedure TAddDossiermalade.G_analyseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    with AlternGrid(Sender) do begin
                               Case Odd(DataSource.Dataset.Recno) of
                                    true : Canvas.Brush.Color := couleurA;
                                    False :Canvas.Brush.Color := couleurB;
                               end;
                               if  DataLink.ActiveRecord = Row -1 then
                               begin
                               Canvas.Font.Color:=couleur2A ;
                               Canvas.Brush.Color:=couleur2B;
                               end;
                               end;
(Sender as tdbgridEH).DefaultDrawColumnCell(Rect,DataCol,Column, State);

end;

procedure TAddDossiermalade.BitBtn3Click(Sender: TObject);
begin
Close;
end;

end.
