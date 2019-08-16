unit AddToleranceU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  AdvMenus, System.ImageList, Vcl.ImgList;

type
  TAddTolerance = class(TForm)
    DataSource1: TDataSource;
    Produit: TEdit;
    Bevel1: TBevel;
    Image1: TImage;
    Bevel2: TBevel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    Label2: TLabel;
    P: TRadioButton;
    N: TRadioButton;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure PClick(Sender: TObject);
    procedure NClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddTolerance: TAddTolerance;
  Reaction : string;
implementation

uses   DossierU, ClientModuleUnit1, RechercheDonneesU,
  ListeMedicamentsU;

{$R *.dfm}

procedure TAddTolerance.BitBtn1Click(Sender: TObject);

begin
if(produit.Text<>'')and(Reaction<>'')then begin
with ClientModule1 do begin
Tolerances.Last;
Tolerances.Insert;
               Tolerances.fieldbyName('N_Malade').AsInteger:=StrToInt(Dossier.N_Malade.Text) ;
               Tolerances.fieldbyName('Produit').AsString:=Produit.Text ;
               Tolerances.fieldbyName('Reaction').AsString:=Reaction;
vTolerances;
Produit.Clear;
//AddTolerance.Close;
{--------------------------------------}//rafrichissement tolerances/alergies
//Dossier.TP.SQL.Clear; //Efface le contenu de la stringlist
//Dossier.TP.SQL.Add('SELECT Produit from Tolerances where Tolerances.Reaction=:Reaction and Tolerances.N_Malade=:N_Malade');
//Dossier.TP.ParamByName('Reaction').AsString:='P';
//Dossier.TP.ParamByName('N_Malade').Asinteger:=strtoint(Dossier.N_Malade.Text);
RechercheDonnees.TP.Open; //Active la requête
////
//Dossier.TN.SQL.Clear; //Efface le contenu de la stringlist
//Dossier.TN.SQL.Add('SELECT Produit from Tolerances where Tolerances.Reaction=:Reaction and Tolerances.N_Malade=:N_Malade');
//Dossier.TN.ParamByName('Reaction').AsString:='N';
//Dossier.TN.ParamByName('N_Malade').Asinteger:=strtoint(Dossier.N_Malade.Text);
RechercheDonnees.TN.Open; //Active la requête { }
end;
{--------------------------------------}//rafrichissement tolerances/alergies
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;


procedure TAddTolerance.PClick(Sender: TObject);
begin
if (p.Checked)then Reaction:='P';
end;

procedure TAddTolerance.SpeedButton1Click(Sender: TObject);
begin
  ListeMedicaments.show;
end;

procedure TAddTolerance.ToolButton3Click(Sender: TObject);
begin
addtolerance.Close;
end;

procedure TAddTolerance.NClick(Sender: TObject);
begin
if (n.Checked)then Reaction:='N';
end;

procedure TAddTolerance.FormShow(Sender: TObject);
begin
with ClientModule1 do
Tolerances.Open;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

end.
 