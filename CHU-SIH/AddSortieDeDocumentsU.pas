unit AddSortieDeDocumentsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.DBCtrls, DBCtrlsEh, Vcl.Mask,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, AdvMenus, Vcl.Menus,
  dxGDIPlusClasses;

type
  TAddSortieDeDocuments = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEditEh1: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    PersenneOri: TDBLookupComboBox;
    Nom_Gar: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEditEh3: TDBEditEh;
    Label2: TLabel;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Image2: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddSortieDeDocuments: TAddSortieDeDocuments;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, RechercheDonneesU;

procedure TAddSortieDeDocuments.BitBtn1Click(Sender: TObject);
begin
   ClientModule1.MAJserviceDossier(RechercheDonnees.mouvementdossiersNumDos.Value,RechercheDonnees.mouvementdossiersn_serviceDes.AsString);
   ClientModule1.CorrigeserviceDossier(RechercheDonnees.mouvementdossiersNumDos.Value, RechercheDonnees.mouvementdossiersservicedepart.AsString,RechercheDonnees.mouvementdossiersservicedestination.AsString);
   ClientModule1.VMouvementDossiers;
   Close;
  //CorrigeserviceDossier(numd, depart, destination
end;

procedure TAddSortieDeDocuments.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
 if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
 PersenneOri.SetFocus
end;

procedure TAddSortieDeDocuments.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
