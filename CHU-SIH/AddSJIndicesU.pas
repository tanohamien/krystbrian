unit AddSJIndicesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, DBTables, Grids, DBGrids, Buttons, XPMan,
  ComCtrls, ExtCtrls, Datasnap.DBClient, Datasnap.Provider;

type
  TAddSJIndices = class(TForm)
    DataSource2: TDataSource;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Heure_Ind: TEdit;
    N_Entree: TEdit;
    Date_Ind: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    ListView1: TListView;
    Ajouter: TBitBtn;
    Suprimer: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;



    procedure AjouterClick(Sender: TObject);
    procedure SuprimerClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddSJIndices: TAddSJIndices;
  liste :TListItem;
  i:integer;
implementation

uses   DossierU, ClientModuleUnit1, RechercheDonneesU;

{$R *.dfm}








procedure TAddSJIndices.AjouterClick(Sender: TObject);
begin
if(Edit1.Text<>'')and(Edit2.Text<>'')then begin
liste := ListView1.Items.Insert(1);
liste.Caption :='-';
liste.SubItems.Add(Edit1.Text);
liste.SubItems.Add(Edit2.Text);
Edit1.Clear;
Edit2.Clear;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddSJIndices.SuprimerClick(Sender: TObject);
begin
listview1.DeleteSelected;
end;

procedure TAddSJIndices.BitBtn2Click(Sender: TObject);
var n,o : string;
begin
if(date_ind.Text<>'')and(heure_ind.Text<>'')and(ListView1.Items.Count<>0)then begin
with  ClientModule1 do begin
for i:=0 to (ListView1.Items.Count-1) do begin
                                         n:= ListView1.Items[i].SubItems.Strings[0] ;
                                         o:= ListView1.Items[i].SubItems.Strings[1] ;
                                         SJIndices.Last;
                                         SJIndices.Insert;
                                         SJIndices.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
                                         SJIndices.fieldbyName('Date_Ind').AsDateTime:=StrTodatetime(Date_Ind.Text);
                                         SJIndices.fieldbyName('Heure_Ind').AsDateTime:=StrTodatetime(Heure_Ind.Text);
                                         SJIndices.fieldbyName('Nom_Ind').AsString:=n;
                                         SJIndices.fieldbyName('Observation_Ind').AsString:=O;
                                         ClientModule1.VSJIndices;
                                         end;
addsjindices.Close;
end;
end
else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddSJIndices.FormShow(Sender: TObject);
begin
RechercheDonnees.SJIndices.open;
N_Entree.Text:= Dossier.N_Entree.Text;
date_Ind.Text:=datetostr(now);
Heure_Ind.Text:=timetostr(now);
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

procedure TAddSJIndices.BitBtn3Click(Sender: TObject);
begin
addsjindices.Close;
end;

procedure TAddSJIndices.BitBtn1Click(Sender: TObject);
begin
listview1.Clear;
end;

end.
