unit AddMaladeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, DB, DBTables, Mask, Buttons,
  ExtCtrls, Datasnap.DBClient, Datasnap.Provider,FireDACJSONReflect, CompoMansEh,
  Vcl.DBCtrls, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.ToolWin, Vcl.Menus,
  AdvMenus, System.ImageList, Vcl.ImgList, Vcl.AppEvnts;

type
  TAddMalade = class(TForm)
    Pnom_Mal: TEdit;
    Femme: TRadioButton;
    Homme: TRadioButton;
    Nom_Mal: TEdit;
    Lieu_Nes_Mal: TEdit;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Image2: TImage;
    Date_Nes_Mal: TDateTimePicker;
    ABO_Mal: TComboBox;
    Bevel4: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Tel_Mal: TMaskEdit;
    Ville_Mal: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    telFixe: TMaskEdit;
    NumPiece: TEdit;
    Label19: TLabel;
    Rpays: TDBLookupComboboxEh;
    Label10: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    rre: TLabel;
    RtypePiece: TDBLookupComboboxEh;
    Rprofession: TDBLookupComboboxEh;
    RsitMat: TDBLookupComboboxEh;
    Rreligion: TDBLookupComboboxEh;
    Label14: TLabel;
    RRegion: TDBLookupComboboxEh;
    rpa: TEdit;
    rpr: TEdit;
    rsm: TEdit;
    rrgl: TEdit;
    rreg: TEdit;
    rtp: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Normal: TRadioButton;
    Inconnu: TRadioButton;
    Label29: TLabel;
    Label1: TLabel;
    N_Malade: TEdit;
    Rciv: TEdit;
    Civilite: TDBLookupComboboxEh;
    Age: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn4: TBitBtn;
    MaskEdit1: TMaskEdit;
    Adresse_Mal: TMemo;
    ApplicationEvents1: TApplicationEvents;
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
    ToolButton5: TToolButton;
    procedure ValiderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RpaysChange(Sender: TObject);
    procedure RprofessionChange(Sender: TObject);
    procedure RsitMatChange(Sender: TObject);
    procedure RreligionChange(Sender: TObject);
    procedure RRegionChange(Sender: TObject);
    procedure RtypePieceChange(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure InconnuClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CiviliteChange(Sender: TObject);
    procedure Date_Nes_MalChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Déclarations privées }
    procedure ouvreDonneeDuMalade;

  public
    { Déclarations publiques }
  end;

var
  AddMalade: TAddMalade;

implementation

uses   AddEntreeU, Assist_1U, ClientClassesUnit1, ClientModuleUnit1,
  DossierU, AddContactPatientsU, AddDossiermaladeU, MenuAdmissionU;

{$R *.dfm}

procedure TAddMalade.ValiderClick(Sender: TObject);
var Sexe_Mal : string;
begin
if (femme.Checked) then sexe_Mal:='F' ;
if (homme.Checked) then sexe_Mal:='H';
 with ClientModule1 do begin

 Malades.open;
 Malades.Insert;
              // Malades .fieldbyName('N_Malade').AsInteger:=StrToInt(N_Malade.Text) ;
               Malades.fieldbyName('Nom_Mal').AsString:=Nom_Mal.Text ;
               Malades.fieldbyName('Pnom_Mal').AsString:=Pnom_Mal.Text;
               Malades.fieldbyName('Sexe_Mal').AsString:=Sexe_Mal;
               Malades.fieldbyName('ABO_Mal').AsString:=ABO_Mal.Text;
               Malades.fieldbyName('Date_Nes_Mal').AsDateTime:=Date_Nes_Mal.Date;
               Malades.fieldbyName('Lieu_Nes_Mal').AsString:=Lieu_Nes_Mal.Text;
               Malades.fieldbyName('Adresse_Mal').AsString:=Adresse_Mal.Text;
               Malades.fieldbyName('Ville_Mal').AsString:=Ville_Mal.Text;
               Malades.fieldbyName('Tel_Mal').AsString:=Tel_Mal.Text;
               Malades.fieldbyName('Type_Mal').AsString:='E';
            //   Malades.fieldbyName('numDos').AsString:=numDos.Text;


end;
//  Malades.Post;
//  Showmessage('le malade a etait ajouté avec succé');
//  AddMalade.Close;

end;

procedure TAddMalade.FormShow(Sender: TObject);
begin
N_Malade.Clear;
Nom_Mal.Clear;
Pnom_Mal.Clear;
Lieu_Nes_Mal.Clear;
homme.Checked := false;
femme.Checked := false;
Ville_Mal.Clear;
Adresse_Mal.Clear;
//numdos.Clear;

Tel_Mal.Clear;
 with ClientModule1 do begin

Malades.Open;
Malades.Last;
if (Malades.FieldValues['N_Malade']<>null)then N_Malade.Text:=inttostr(Malades.FieldValues['N_Malade']+1)else N_Malade.Text:='1'; //calcule du n° du malade a ajouter
end;

{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddMalade.GroupBox1Click(Sender: TObject);
begin
if normal.Checked = true
  then
    begin

    end;


end;

procedure TAddMalade.InconnuClick(Sender: TObject);
begin
if inconnu.Checked = true
  then
    begin
               Nom_Mal.Text:='XX' ;
               Pnom_Mal.Text:='XX' ;
             //  Sexe_Mal;
               ABO_Mal.Text:='XX' ;
               Date_Nes_Mal.Date:=date ;
               Lieu_Nes_Mal.Text:='XX' ;
               Adresse_Mal.Text:='XX' ;
               Ville_Mal.Text:='XX' ;
               Tel_Mal.Text:='XX' ;
       //        Malades.fieldbyName('GenreDeMalade').AsString:=GenreDeMalade; // GenreDeMalade
               rreg.Text:='1' ;
               rpr.Text:='1' ;
               rtp.Text:='1' ;
               rsm.Text:='1' ;
               rrgl.Text:='1' ;
               rpa.Text:='1' ;
               numpiece.Text:='1' ;

    end;

end;

procedure TAddMalade.RpaysChange(Sender: TObject);
begin
  rpa.Text:=clientmodule1.pays.fieldbyName('codpays').asstring;
end;

procedure TAddMalade.RprofessionChange(Sender: TObject);
begin
 rpR.Text:=clientmodule1.profession.fieldbyName('codprofession').asstring;
end;

procedure TAddMalade.RRegionChange(Sender: TObject);
begin
rreg.Text:=clientmodule1.Region.fieldbyName('codreg').asstring;
end;

procedure TAddMalade.RreligionChange(Sender: TObject);
begin
  rrgl.Text:=clientmodule1.Religion.fieldbyName('codrelig').asstring;
end;

procedure TAddMalade.RsitMatChange(Sender: TObject);
begin
  rsm.Text:=clientmodule1.Situation.fieldbyName('codSituation').asstring;
end;

procedure TAddMalade.RtypePieceChange(Sender: TObject);
begin
rtp.Text:=clientmodule1.piece.fieldbyName('codpiece').asstring;

end;


procedure TAddMalade.SpeedButton1Click(Sender: TObject);
begin
  CHU.PaysNationalites1Click(Sender);
end;

procedure TAddMalade.SpeedButton2Click(Sender: TObject);
begin
  CHU.Professions1Click(Sender);
end;

procedure TAddMalade.SpeedButton3Click(Sender: TObject);
begin

CHU.SituationMatrimoniale1Click(Sender);
end;

procedure TAddMalade.SpeedButton4Click(Sender: TObject);
begin
 CHU.Religions1Click(Sender);
end;

procedure TAddMalade.ouvreDonneeDuMalade;
begin
     TRY
       ClientModule1.TypeDossierMedical.Open;
     except
       showmessage('Impossible de creer le dossier actuelemnent');
       abort
     END;
   ClientModule1.GetMaladeEnCours(Dossier.N_Malade.Text);  //fixe le patient choisit
   ClientModule1.MaladeEnCours.Open;    //ouvre toutes les info sur le patient en cours
   ClientModule1.GETRecherchesTrouveParDossier( Dossier.N_Malade.Text);
   ClientModule1.GETRechercheEntreAFacturer(Dossier.N_Malade.Text);
   ClientModule1.GetRechercheDocumentDuDossier(Dossier.n_dossier.Text);
   ClientModule1.GetRecherchesDossierParPatient(Dossier.N_Malade.Text);


end;


procedure TAddMalade.BitBtn1Click(Sender: TObject);
  var Sexe_Mal, GenreDeMalade : string;
  id:integer;
begin
if (normal.Checked) then GenreDeMalade:='NORMAL' ;
if (inconnu.Checked) then GenreDeMalade:='INCONNU';

if (femme.Checked) then sexe_Mal:='F' ;
if (homme.Checked) then sexe_Mal:='H';

if(Nom_Mal.Text<>'')and(Pnom_Mal.Text<>'')
and(Sexe_Mal<>'')
then begin
 with ClientModule1 do begin
 id:=ID_MAL+1;
 Malades.open;
 Malades.Insert;
               Malades.fieldbyName('N_Malade').AsInteger:=id;//StrToInt(N_Malade.Text) ;
               Malades.fieldbyName('idcivilite').AsString:=Rciv.Text ;//StrToInt(N_Malade.Text) ;
               Malades.fieldbyName('Nom_Mal').AsString:=Nom_Mal.Text ;
               Malades.fieldbyName('Pnom_Mal').AsString:=Pnom_Mal.Text;
               Malades.fieldbyName('Sexe_Mal').AsString:=Sexe_Mal;
               Malades.fieldbyName('ABO_Mal').AsString:=ABO_Mal.Text;
               Malades.fieldbyName('Date_Nes_Mal').asdatetime:=Date_Nes_Mal.Date;
               Malades.fieldbyName('Lieu_Nes_Mal').AsString:=Lieu_Nes_Mal.Text;
               Malades.fieldbyName('Adresse_Mal').AsString:=Adresse_Mal.Text;
               Malades.fieldbyName('Ville_Mal').AsString:=Ville_Mal.Text;
               Malades.fieldbyName('Tel_Mal').AsString:=Tel_Mal.Text;
               //telFixe
               Malades.fieldbyName('telFixe').AsString:=telFixe.Text;

               Malades.fieldbyName('Type_Mal').AsString:='E';
               Malades.fieldbyName('GenreDeMalade').AsString:=GenreDeMalade; // GenreDeMalade
               Malades.fieldbyName('CodReg').AsString:=rreg.Text;
               Malades.fieldbyName('Codprofession').AsString:=rpr.Text;
               Malades.fieldbyName('CodPiece').AsString:=rtp.Text;
               Malades.fieldbyName('codsituation').AsString:=rsm.Text;
               Malades.fieldbyName('codrelig').AsString:=rrgl.Text;
               Malades.fieldbyName('codpays').AsString:=rpa.Text;
               Malades.fieldbyName('numpiece').AsString:=numpiece.Text;
               //AgePat
               Malades.fieldbyName('AgePat').AsString:=age.Text;
  end;

ClientModule1.Vmalade;

addentree.N_Malade.Text:=inttostr(id);//N_Malade.Text;
Dossier.N_Malade.Text:=inttostr(id);
try
 Dossier.N_Malade.Text:=addentree.N_Malade.Text;
 ouvreDonneeDuMalade ;
finally
   BitBtn4.Click;
   AddMalade.Close;
end;
BitBtn2.Visible := false ;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddMalade.BitBtn2Click(Sender: TObject);
begin
  addmalade.Close;
  assist_1.Show;
end;

procedure TAddMalade.BitBtn3Click(Sender: TObject);
begin
  BitBtn2.Visible := false ;
  AddMalade.Close;

end;

procedure TAddMalade.BitBtn4Click(Sender: TObject);
begin
  TRY
//    BitBtn1.Click  ;
    ClientModule1.GetRecherchesDossierParPatient(ClientModule1.Malades.FieldByName('N_Malade').AsString);
    //ClientModule1.Vmalade;
  FINALLY
     ClientModule1.DossierPatient.Open;
     ClientModule1.DossierPatient.append;
     AddDossiermalade.show;
  END;

end;

procedure TAddMalade.CiviliteChange(Sender: TObject);
begin

Rciv.Text:=clientmodule1.Civilites.fieldbyName('idcivilite').asstring;

end ;

procedure TAddMalade.Date_Nes_MalChange(Sender: TObject);
var b0:Double;
begin
b0:=0 ;
Age.Text:='0' ;
b0:=Date()-Date_Nes_Mal.Date ;
b0:=b0/360;
b0:=Round(b0);
Age.Text:= floattostr(b0);
//showmessage(floattostr(b0));
end;

end.
