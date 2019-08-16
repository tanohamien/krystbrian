unit AddSJSoinsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, DBTables,
  ExtCtrls, DBCtrls, Datasnap.Provider, Datasnap.DBClient, Vcl.Mask,
  Vcl.ToolWin, Vcl.Menus, AdvMenus, System.ImageList, Vcl.ImgList;

type
  TAddSJSoins = class(TForm)
    Heure_Med: TEdit;
    N_Entree: TEdit;
    Date_Med: TEdit;
    Edit3: TEdit;
    ListView1: TListView;
    Ajouter: TBitBtn;
    Suprimer: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn3: TBitBtn;
    Label11: TLabel;
    DataSource2: TDataSource;
    refp: TDBEdit;
    med: TDBLookupComboBox;
    UnitesDemesure: TDBLookupComboBox;
    DataSource4: TDataSource;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    ImageList1: TImageList;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure AjouterClick(Sender: TObject);
    procedure SuprimerClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddSJSoins: TAddSJSoins;
  liste :TListItem;
  i:integer;
implementation



{$R *.dfm}

uses DossierU, RechercheDonneesU, ClientModuleUnit1;

procedure TAddSJSoins.FormShow(Sender: TObject);
begin
with RechercheDonnees   do
SJsoins.Open;
with ClientModule1 do
Medicaments.Open;

N_Entree.Text:= Dossier.N_Entree.Text;
date_Med.Text:=datetostr(now);
Heure_Med.Text:=timetostr(now);
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

procedure TAddSJSoins.AjouterClick(Sender: TObject);
begin
if(Med.Text<>'')and(UnitesDemesure.Text<>'')and(Edit3.Text<>'')then begin
liste := ListView1.Items.Insert(1);
liste.Caption :='-';
liste.SubItems.Add(med.Text);
liste.SubItems.Add(UnitesDemesure.Text);
liste.SubItems.Add(Edit3.Text);

//UnitesDemesure.Clear;
Edit3.Clear;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddSJSoins.SuprimerClick(Sender: TObject);
begin
listview1.DeleteSelected;
end;

procedure TAddSJSoins.BitBtn2Click(Sender: TObject);
var m,u,q : string;
begin
if(date_med.Text<>'')and(heure_med.Text<>'')and(ListView1.Items.Count<>0)then begin
with ClientModule1   do begin
for i:=0 to (ListView1.Items.Count-1) do begin
                                         m:= ListView1.Items[i].SubItems.Strings[0] ;
                                         u:= ListView1.Items[i].SubItems.Strings[1] ;
                                         q:= ListView1.Items[i].SubItems.Strings[2] ;
                                         SJsoins.OPEN;
                                         SJsoins.Last;
                                         SJsoins.Insert;
                                         SJsoins.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
                                         SJsoins.fieldbyName('Date_Med').AsDateTime:=StrTodatetime(Date_Med.Text);
                                         SJsoins.fieldbyName('Heure_Med').AsDateTime:=StrTodatetime(Heure_Med.Text);
                                         SJsoins.fieldbyName('Nom_Med').AsString:=m;
                                         SJsoins.fieldbyName('Unite_Med').AsString:=u;
                                         SJsoins.fieldbyName('Qtt_Med').AsString:=q;
                                         ClientModule1.vSJsoins;
                                         end;
AddSJSoins.Close;
end;
end
 else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddSJSoins.BitBtn3Click(Sender: TObject);
begin
AddSJSoins.Close;
end;

procedure TAddSJSoins.BitBtn1Click(Sender: TObject);
begin
listview1.Clear;
end;

end.
