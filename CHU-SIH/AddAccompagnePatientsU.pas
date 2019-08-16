unit AddAccompagnePatientsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDDBBtn,
  DBCtrlsEh, dxGDIPlusClasses, AdvMenus, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TAddAccompagnePatients = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Nom_contact: TDBEditEh;
    Pnom_contact: TDBEditEh;
    Adresse_Contact: TDBEditEh;
    Tel_contact: TDBEditEh;
    Type_Contact: TDBEditEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    Image2: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddAccompagnePatients: TAddAccompagnePatients;

implementation

{$R *.dfm}

uses  ClientClassesUnit1, ClientModuleUnit1, DossierU,
  RechercheDonneesU,AddContactPatientsU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddAccompagnePatients.BitBtn1Click(Sender: TObject);
begin
if(Nom_Contact.Text<>'')and(Pnom_Contact.Text<>'')
and (Type_contact.Text<>'')then begin
with ClientModule1 do begin
               RechercheDonnees.AccompagnePatients.Append;
//               RechercheDonnees.AccompagnePatients.fieldbyName('idpersonne').asinteger:=StrToInt(dossier.N_malade.Text) ;
//               RechercheDonnees.AccompagnePatients.fieldbyName('nomaccompagne').AsString:=Nom_Contact.Text ;
//               RechercheDonnees.AccompagnePatients.fieldbyName('prenomaccompagne').AsString:=Pnom_Contact.Text;
//               RechercheDonnees.AccompagnePatients.fieldbyName('adresseaccompagne').AsString:=Adresse_Contact.Text ;
//               RechercheDonnees.AccompagnePatients.fieldbyName('Telaccompagne').AsString:=Tel_contact.Text;
//               RechercheDonnees.AccompagnePatients.fieldbyName('Typaccompagne').AsString:=type_contact.Text;
VAccompagnePatients;
 end;
//N_Medecin.Text :=inttostr(strtoint(N_Medecin.Text)+1);
Nom_Contact.Clear;
Pnom_Contact.Clear;
Adresse_Contact.Clear;
Tel_contact.Clear;
type_contact.Clear;

  end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');

end;

procedure TAddAccompagnePatients.ComboBox1Change(Sender: TObject);
begin
 Type_Contact.Text:= ComboBox1.Text;

end;

procedure TAddAccompagnePatients.FormShow(Sender: TObject);
begin
//Nom_Contact.Clear;
//Pnom_Contact.Clear;
//Adresse_Contact.Clear;
//Tel_contact.Clear;
//type_contact.Clear;

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddAccompagnePatients.M1Click(Sender: TObject);
begin
with ClientModule1 do begin
    Nom_Contact.Text :=    RechercheDonnees.AccompagnePatients.fieldbyName('nomaccompagne').AsString;
    Pnom_Contact.Text:=    RechercheDonnees.AccompagnePatients.fieldbyName('prenomaccompagne').AsString;
    Adresse_Contact.Text:=      RechercheDonnees.AccompagnePatients.fieldbyName('adresseaccompagne').AsString;
    Tel_contact.Text   :=          RechercheDonnees.AccompagnePatients.fieldbyName('Telaccompagne').AsString;
    type_contact.Text:=    RechercheDonnees.AccompagnePatients.fieldbyName('Typaccompagne').AsString;
end;

end;

procedure TAddAccompagnePatients.S1Click(Sender: TObject);
begin
  with ClientModule1 do
    RechercheDonnees.AccompagnePatients.delete;
end;

procedure TAddAccompagnePatients.ToolButton1Click(Sender: TObject);
begin
with ClientModule1 do begin
  TRY
   VAccompagnePatients;
  FINALLY
  if MessageDlg('Personnes a contacter en cas de besoin ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   RechercheDonnees.ContactSPatients.Append;
    AddContactPatients.Show;
    AddAccompagnePatients.Close;
  END;

end;
end;




procedure TAddAccompagnePatients.ToolButton2Click(Sender: TObject);
begin
with ClientModule1 do begin
  TRY
  if MessageDlg('Voulez-vous supprimer l''enregistrement en cours?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   RechercheDonnees.AccompagnePatients.delete;
   VAccompagnePatients;
  FINALLY
    AddAccompagnePatients.Close;
  END;

end;

end;

procedure TAddAccompagnePatients.ToolButton3Click(Sender: TObject);
begin
   AddAccompagnePatients.Close;
end;

end.
