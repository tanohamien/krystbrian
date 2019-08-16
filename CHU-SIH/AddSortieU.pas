unit AddSortieU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  dxGDIPlusClasses, System.ImageList, Vcl.ImgList, AdvMenus, Vcl.Menus,
  Vcl.ToolWin;

type
  TAddSortie = class(TForm)
    Sorties_s: TDataSource;
    N_Entree0: TEdit;
    Motif_Sor: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Malades_s: TDataSource;
    Label4: TLabel;
    N_Malade0: TEdit;
    Entrees_s: TDataSource;
    N_Ser_Act0: TEdit;
    Services_s: TDataSource;
    Label5: TLabel;
    Transferts_s: TDataSource;
    Label6: TLabel;
    Bevel3: TBevel;
    Label11: TLabel;
    Image2: TImage;
    Nom_Ser_Act: TEdit;
    N_Ser_Act: TDBEdit;
    N_Malade: TDBEdit;
    Date_Sor: TDateTimePicker;
    N_Entree: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N_Malade0Change(Sender: TObject);
    procedure N_MaladeChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddSortie: TAddSortie;

implementation

uses   DossierU, ClientModuleUnit1;

{$R *.dfm}

procedure TAddSortie.BitBtn1Click(Sender: TObject);
var
    id:integer;

begin
if(N_malade.Text<>'')and(motif_sor.Text<>'')then begin
 with ClientModule1 do begin
 //Sorties.Last;
   id:=ID_STIE+1;
   Sorties.Insert;
               Sorties.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
               Sorties.fieldbyName('Date_Sor').AsDateTime:=Date_Sor.Date ;
               Sorties.fieldbyName('Motif_Sor').AsString:=Motif_Sor.Text;
               Sorties.fieldbyName('dateenreg').value:=date;
               Sorties.fieldbyName('heureenreg').value:=Time;
               Sorties.fieldbyName('nomutilisateur').value:='TANO';
               Sorties.fieldbyName('nommachine').AsString:='INFORMATIK';


  if malades.FindKey([N_Malade.Text]) = true then
   begin  malades.Edit;
     Malades.FieldByName('Type_Mal').AsString:='E';
     malades.FieldByName('N_Sortie').Asinteger:=id;

   end;
  Services.Edit;
  Services.FieldByName('Places_Lib_Ser').AsInteger :=Services.FieldByName('Places_Lib_Ser').AsInteger+1;

  VSorties;

addsortie.Close;
AddSortie.N_Malade.Enabled :=false;
AddSortie.N_Malade.Color :=clBtnFace;
 end;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddSortie.FormShow(Sender: TObject);
begin

 with ClientModule1 do begin

   Transferts.Open;
   Entrees.Open;
   services.Open;
   Malades.Open;
   Sorties.Open;

Date_Sor.date:=now;
(*
Transferts.Last;
while((Transferts.FieldByName('N_Entree').AsString<>N_Entree.Text) and not(Transferts.Bof))do Transferts.Prior; //parcoure de la table de bas en haut
if (Transferts.FieldByName('N_Entree').AsString=N_Entree.Text) then begin //verifie si l'anregistrement en cours correspend  au n_entrée
                                                                    N_Ser_Act.Text := Transferts.FieldByName('N_Ser_Des').AsString
                                                                    end else begin //si non c-a-d qu'on n'a pas truver un transferts correspendant au n-enrée

                                                                              Entrees.FindKey([N_Entree.Text]);
//                                                                             Entrees.SetKey;
//                                                                             Entrees.FieldByName('N_Entree').AsString:=N_Entree.Text;
//                                                                             Entrees.GotoKey;
                                                                             N_Ser_Act.Text :=  Entrees.FieldByName('N_Service').AsString;
                                                                             end;    *) //tano

//services.Locate('N_Service',N_ser_Act.Text, [loCaseInsensitive]);

Nom_Ser_Act.Text:=services.FieldByName('Nom_Ser').AsString;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
 end;
end;

procedure TAddSortie.BitBtn2Click(Sender: TObject);
begin
addsortie.Close;
N_Malade.Enabled :=false;
N_Malade.Color :=clBtnFace;
end;

procedure TAddSortie.N_Malade0Change(Sender: TObject);
begin
{---------------------------------------------------------------}//recherche et affichage du numero de la derniere entrée
 with ClientModule1 do begin

Entrees.Last;
while(Entrees.FieldByName('N_Malade').AsString<>N_Malade.Text) and (not Entrees.Bof)do Entrees.Prior; //parcoure de la table de bas en haut
if   (Entrees.FieldByName('N_Malade').AsString= N_Malade.Text) then N_Entree.Text := Entrees.FieldByName('N_Entree').AsString ;


{---------------------------------------------------------------}//recherche et affichage du numero de la derniere entrée
end;
end;

procedure TAddSortie.N_MaladeChange(Sender: TObject);
begin
{---------------------------------------------------------------}//recherche et affichage du numero de la derniere entrée
// with ClientModule1 do begin
//
//Entrees.Last;
//while(Entrees.FieldByName('N_Malade').AsString<>N_Malade.Text) and (not Entrees.Bof)do Entrees.Prior; //parcoure de la table de bas en haut
//if   (Entrees.FieldByName('N_Malade').AsString= N_Malade.Text) then N_Entree.Text := Entrees.FieldByName('N_Entree').AsString ;
//

{---------------------------------------------------------------}//recherche et affichage du numero de la derniere entrée
//end;

end;

end.
