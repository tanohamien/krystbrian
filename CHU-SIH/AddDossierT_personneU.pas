unit AddDossierT_personneU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Grids, Vcl.DBGrids, DBCtrlsEh,
  Vcl.Mask, DBGridEh, DBLookupEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, Vcl.AppEvnts,
  Vcl.Menus, System.ImageList, Vcl.ImgList;

type
  TAddDossierT_personne = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
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
    DBEditEh1: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    G_ana: TDBGridEh;
    Pop_TN: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    ImageList1: TImageList;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure MenuItem1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddDossierT_personne: TAddDossierT_personne;

implementation

{$R *.dfm}

uses  ClientModuleUnit1, RechercheDonneesU;

procedure TAddDossierT_personne.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
   MenuItem1.visible := Not (G_ana.SelectedRows.CurrentRowSelected = True);
   MenuItem2.visible := (G_ana.SelectedRows.CurrentRowSelected = True)

end;

procedure TAddDossierT_personne.BitBtn1Click(Sender: TObject);
begin
TRY
     ClientModule1.VDossierParPatient;

//if ClientModule1.T_Personne.FindKey([RechercheDonnees.TMalades.FieldByName('n_malade').AsString]) then
  BEGIN
   ClientModule1.T_Personne.Edit;
   ClientModule1.T_Personne.fieldbyName('NumDos').AsString:=  ClientModule1.DossierPatientnumdos.AsString;
   ClientModule1.VT_Personne;
  END;

FINALLY
  Close;
END;
end;

procedure TAddDossierT_personne.FormShow(Sender: TObject);
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

procedure TAddDossierT_personne.MenuItem1Click(Sender: TObject);
begin
  activecontrol:=Nom_Gar;
  ClientModule1.DossierPatient.Append;
end;

procedure TAddDossierT_personne.BitBtn3Click(Sender: TObject);
begin
Close;
end;

end.
