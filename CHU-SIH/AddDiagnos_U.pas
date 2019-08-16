unit AddDiagnos_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, Buttons,
  ComCtrls, Mask, DBCtrls, Datasnap.DBClient, Datasnap.Provider;

type
  TAddDiagnos_ = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    N_Dia: TEdit;
    N_Entree: TEdit;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit3: TEdit;
    ListView1: TListView;
    Ajouter: TBitBtn;
    Suprimer: TBitBtn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    Stock: TCheckBox;
    Produits: TDBLookupComboBox;
    nm: TDBEdit;
    DataSource2: TDataSource;
    refp: TDBEdit;
    DataSource4: TDataSource;
    UnitesDemesure: TDBLookupComboBox;
    Resultat: TMemo;
    DateTimePicker1: TDateTimePicker;
    Date_Dia: TEdit;


    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AjouterClick(Sender: TObject);
    procedure SuprimerClick(Sender: TObject);

    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddDiagnos_: TAddDiagnos_;
  liste :TListItem;
  i:integer;
implementation

uses  Sourcedb, DelMedicamentU, ClientModuleUnit1;        //ClientModule1

{$R *.dfm}

procedure TAddDiagnos_.Button1Click(Sender: TObject);
var m,u,q : string;
begin

WITH ClientModule1 DO BEGIN
{if(obs.Text<>'')then begin
                      Observations.Last;
                      Observations.Insert;
                      Observations.fieldbyName('N_Malade').AsInteger:=StrToInt(N_Malade.Text) ;
                      Observations.fieldbyName('N_Medecin').AsInteger:=StrToInt('1');
                      Observations.fieldbyName('Observation').AsString:=obs.Text;
                      Observations.fieldbyName('Date_heure').AsDateTime:=now;
                      Observations.Post;
                     end; }
for i:=0 to (ListView1.Items.Count-1) do begin
                                         m:= ListView1.Items[i].SubItems.Strings[0] ;
                                         u:= ListView1.Items[i].SubItems.Strings[1] ;
                                         q:= ListView1.Items[i].SubItems.Strings[2] ;
                                         soins.Last;
                                         soins.Insert;
                                         soins.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
                                         soins.fieldbyName('N_Dia').AsInteger:=StrToInt(N_Dia.Text);
                                         soins.fieldbyName('Nom_Med').AsString:=m;
                                         soins.fieldbyName('Unite_Med').AsString:=u;
                                         soins.fieldbyName('Qtt_Med').AsString:=q;
                                         soins.Post;

                                         end;
//ListView1.Items[i].SubItems.Strings[j] ;
if (Resultat.Text<>'')then begin
                             Diagnostiques.Last;
                             Diagnostiques.Insert;
                             Diagnostiques.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
                             Diagnostiques.fieldbyName('N_Dia').AsInteger:=StrToInt(N_Dia.Text);
                             Diagnostiques.fieldbyName('Date_Dia').AsDateTime:=StrToDate(Date_Dia.Text);
                             Diagnostiques.fieldbyName('Resultat_dia').AsString:=Resultat.Text;
                             Diagnostiques.Post;
                             end;
showmessage('les informations ont etait bien enregistrées');
adddiagnos.Close;
END;

end;

procedure TAddDiagnos_.DateTimePicker1Change(Sender: TObject);
begin
 date_dia.Text:=  datetostr(DateTimePicker1.DateTime);
end;

procedure TAddDiagnos_.FormShow(Sender: TObject);
begin
WITH ClientModule1 DO BEGIN

Diagnostiques.Open;
//soins.Open;
//Medicaments.Open;;

Diagnostiques.Last;
if (Diagnostiques.FieldValues['N_Dia']<>null)then N_Dia.Text:=inttostr(Diagnostiques.FieldValues['N_Dia']+1)else N_Dia.Text:='1';
Date_Dia.Text:= datetimetostr(date);
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
END;
end;

procedure TAddDiagnos_.AjouterClick(Sender: TObject);
begin
if(produits.Text<>'')and(UnitesDemesure.Text<>'')and(Edit3.Text<>'')then begin
liste := ListView1.Items.Insert(1);
liste.Caption :='-';
liste.SubItems.Add(nm.Text);
//RefMedicament
liste.SubItems.Add(refp.Text);
liste.SubItems.Add(Produits.Text);
liste.SubItems.Add(UnitesDemesure.Text);
liste.SubItems.Add(Edit3.Text);
//UnitesDemesure.Clear;
Edit3.Clear;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddDiagnos_.SuprimerClick(Sender: TObject);
begin
  listview1.DeleteSelected;
end;

procedure TAddDiagnos_.BitBtn2Click(Sender: TObject);
var Ref,nom,uite,qte,n : string;
id:integer;
begin
if(Date_Dia.Text<>'')and(Resultat.Text<>'')then begin

 WITH ClientModule1 DO
   BEGIN
   id:=ID_DIAG+1;
     if (Resultat.Text<>'')then begin
                              Diagnostiques.open;
                              Diagnostiques.Last;
                              Diagnostiques.Insert;
                              Diagnostiques.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
                              Diagnostiques.fieldbyName('N_Dia').AsInteger:=id;//StrToInt(N_Dia.Text);
                              Diagnostiques.fieldbyName('Date_Dia').AsDateTime:=StrToDate(Date_Dia.Text);
                              Diagnostiques.fieldbyName('Resultat_dia').AsString:=Resultat.Text;
                              VDiagnostic;
    for i:=0 to (ListView1.Items.Count-1) do
          begin
                                 Ref:= ListView1.Items[i].SubItems.Strings[1] ;
                                 nom:= ListView1.Items[i].SubItems.Strings[2] ;
                                 uite:= ListView1.Items[i].SubItems.Strings[3] ;
                                 qte:= ListView1.Items[i].SubItems.Strings[4] ;
                                 soins.open;
                                 soins.Last;
                                 soins.Insert;
                                 soins.fieldbyName('N_Entree').AsInteger:=StrToInt(N_Entree.Text) ;
                                 soins.fieldbyName('N_Dia').AsInteger:=id; //StrToInt(N_Dia.Text);
                                 soins.fieldbyName('RefMedicament').AsString:=Ref;
                                 soins.fieldbyName('Nom_Med').AsString:=nom;
                                 //RefMedicament
                                 soins.fieldbyName('Unite_Med').AsString:=uite;
                                 soins.fieldbyName('Qtt_Med').AsString:=qte;
                                 vsoins;
                           end;

           end;
//ListView1.Items[i].SubItems.Strings[j] ;
    end;
showmessage('les informations ont eté bien enregistrées');


if (stock.Checked) then BEGIN
                        DelMedicament.Show;
                        DelMedicament.BitBtn1.Click;
                        for i:=0 to (ListView1.Items.Count-1) do begin
                                                               n:= ListView1.Items[i].SubItems.Strings[0] ;
                                                               nom:= ListView1.Items[i].SubItems.Strings[1] ;
                                                               qte:= ListView1.Items[i].SubItems.Strings[4] ;
                                                               DelMedicament.DBLookupComboBox2.KeyValue:=nom;
                                                               DelMedicament.Edit1.Text :=uite;
                                                               DelMedicament.Ajouter.Click;
                                                               end;
                        END;
addDiagnos.Close;

end
 else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');

end;

procedure TAddDiagnos_.BitBtn3Click(Sender: TObject);
begin
addDiagnos.Close;
end;

procedure TAddDiagnos_.BitBtn1Click(Sender: TObject);
begin
listview1.Clear;
end;

end.

