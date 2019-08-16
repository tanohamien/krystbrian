unit AddEntreeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Mask, Datasnap.DBClient, Datasnap.Provider, Vcl.ComCtrls, Vcl.Menus,
  dxGDIPlusClasses, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.ToolWin, AdvMenus,
  System.ImageList, Vcl.ImgList;

type
  TAddEntree = class(TForm)
    Entrees_s: TDataSource;
    N_Entree: TEdit;
    Motif_Ent: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    Malades_s: TDataSource;
    Image1: TImage;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    Bevel3: TBevel;
    Services_s: TDataSource;
    Nom_Ser2: TDBLookupComboBox;
    N_Service: TDBEdit;
    Label7: TLabel;
    Places_Lib_Ser: TDBEdit;
    Label9: TLabel;
    Bevel2: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    Medecins_s: TDataSource;
    N_Medecin: TDBEdit;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    Date_Ent: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    T1: TMenuItem;
    SpeedButton2: TSpeedButton;
    N_Malade: TEdit;
    Label11: TLabel;
    Civilite: TDBLookupComboboxEh;
    Label4: TLabel;
    Label8: TLabel;
    Image3: TImage;
    Image2: TImage;
    DataSource1: TDataSource;
    Nom_Ser: TDBEdit;
    ImageList1: TImageList;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    AdvMenuStyler1: TAdvMenuStyler;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Nom_SerSelect(Sender: TObject);
    procedure Places_Lib_SerChange(Sender: TObject);
    procedure N_MaladeChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddEntree: TAddEntree;

implementation

uses  DossierU, ClientModuleUnit1,
RechercheDonneesU, DiversesListesU,  MenuAdmissionU,
AddAccompagnePatientsU,AddContactPatientsU;

{$R *.dfm}

procedure TAddEntree.FormShow(Sender: TObject);

begin
 with ClientModule1 do begin

 Malades.Open;
 Entrees.Open;
 Services.Open;
 Medecins.Open;

Entrees.Last;
if (Entrees.FieldValues['N_Entree']<>null)then N_Entree.Text:=inttostr(Entrees.FieldValues['N_Entree']+1)else N_Entree.Text:='1';
Date_Ent.date:= date();

ClientModule1.services.FindKey([Chu.N_Service.caption]);

{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
 end;
end;



procedure TAddEntree.BitBtn1Click(Sender: TObject);
var
  x0:double;
  x1:integer;
  id:integer;

begin
if(Nom_Ser.Text<>'')and(DBLookupComboBox1.Text<>'')and(Date_Ent.date <> null)and(Motif_Ent.Text<>'')then begin
 with ClientModule1 do begin
   id:=ID_ENT+1;
  Entrees.Open;
  Entrees.Insert;
               Entrees.fieldbyName('N_Entree').AsInteger:=ID ;
               Entrees.fieldbyName('N_Malade').AsInteger:=StrToInt(N_Malade.Text) ;
               Entrees.fieldbyName('N_Medecin').AsInteger:=StrToInt(N_Medecin.Text);
               Entrees.fieldbyName('N_Service').AsInteger:=StrToInt(N_Service.Text);
               Entrees.fieldbyName('Date_Ent').value:=Date_Ent.date;
               Entrees.fieldbyName('Motif_Ent').AsString:=Motif_Ent.Text;
//               ClientModule1.GetRechercheMontantConsultationServive(N_Service.Text);
//               ClientModule1.MontantConsultationServive.Open;
//               x0:= ClientModule1.MontantConsultationServive.FieldByName('prixConsultation').AsFloat;
 //              x1:= ClientModule1.MontantConsultationServive.FieldByName('DureeConsultation').Asinteger;
               Entrees.fieldbyName('montantEntree').value:=0;//;//x0;
               Entrees.fieldbyName('dateecheance').value:=date;//date+x1;
               Entrees.fieldbyName('Mtpaye').value:=0;

            //   Entrees.fieldbyName('Numdos').value:=date;
               Entrees.fieldbyName('dateenreg').value:=date;
               Entrees.fieldbyName('heureenreg').value:=Time;
               Entrees.fieldbyName('nomutilisateur').value:='TANO';
               Entrees.fieldbyName('nommachine').AsString:='INFORMATIK';
  Services.Edit;
  Services.FieldByName('Places_Lib_Ser').AsInteger:=Services.FieldByName('Places_Lib_Ser').AsInteger-1;

  if malades.FindKey([N_Malade.Text]) = true then
   begin
    malades.Edit;
    malades.FieldByName('Type_Mal').AsString:='I';
    malades.FieldByName('N_Entree').Asinteger:=ID;
    malades.FieldByName('N_Sortie').Asinteger:=0;
    malades.FieldByName('N_service').Asinteger:=StrToInt(N_Service.Text);
    Entrees.fieldbyName('Numdos').asstring:=malades.FieldByName('NumDos').AsString;
   end;
   VEntrees;
Dossier.N_Malade.Text := N_Malade.Text;
Dossier.N_Malade.Modified:=true;
Dossier.Type_Mal.Text := 'I';
Dossier.N_Entree.Text := N_Entree.Text;
Dossier.N_Entree.Visible:=true;
Dossier.lentree.Visible:=true;
//Showmessage('l''enregistepent a eté effectué avec succès');
TRY
 if MessageDlg('Y a t-il une personne qui accompagne le Patient?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     AddAccompagnePatients.Show else
      if MessageDlg('Y a t-il une personne à contacter en cas de besoin?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       AddContactPatients.Show;

FINALLY
addentree.Close;

END;
end;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');

end;

procedure TAddEntree.BitBtn2Click(Sender: TObject);
begin
addentree.Close;
end;

procedure TAddEntree.Nom_SerSelect(Sender: TObject);
begin
//té la ?oui VIEN CHHEZ MOI jé trouvé wahed el 3afca fel delphi pour amélioré le ide de delphi
 with ClientModule1 do begin

Services.SetKey;
Services.FieldByName('Nom_Ser').AsString:=Nom_Ser.Text;
Services.GotoKey;
N_Service.Text:=inttostr(Services.FieldByName('N_Service').AsInteger);
// oki et ca ne marche pas ? oui  il reste toujours dans le dernier enregistrement de la table
//regard je te fait ce traitment que tu veu en changet les composant et je n'ecriré aucun code :p !!!
//regade tu me dis berk quelle est la table berk fel la form qui contion service
// oki regarde

 end;
end;

procedure TAddEntree.N_MaladeChange(Sender: TObject);
begin
  ClientModule1.GETRecherchesTrouveParDossier(N_Malade.Text);
  ClientModule1.GetRecherchesDossierParPatient(RechercheDonnees.TMalades.FieldByName('N_Malade').AsString);

//with RechercheDonnees do begin
//  TMalades.Open;
//  TEntrees.Open;
//  TG_malades.Open;
//  TN.Open;
//  TP.Open;
//  Entrees.Open;
//  SOINS.Open;
//  diagnostiques.Open;
//end;

end;

procedure TAddEntree.Places_Lib_SerChange(Sender: TObject);
begin
if Places_Lib_Ser.Text='0' then begin
                                Places_Lib_Ser.Color:=$007A7AEF;
                                BitBtn1.Enabled:=false;
                                end else begin
                                         Places_Lib_Ser.Color:=clMoneyGreen;
                                         BitBtn1.Enabled:=true;
                                         end;
end;

procedure TAddEntree.SpeedButton2Click(Sender: TObject);
begin
 TRY
    DiversesListes.NT1.Pageindex:=10;
    DiversesListes.Showmodal;
 FINALLY
    n_malade.Clear;
    n_malade.Text:=  inttostr(DiversesListes.i0);

 END;

   // showmessage(n_malade.Text);
end;

end.
