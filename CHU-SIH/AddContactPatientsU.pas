unit AddContactPatientsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, dxGDIPlusClasses, Vcl.ComCtrls, Vcl.ToolWin, AdvMenus,
  System.ImageList, Vcl.ImgList;

type
  TAddContactPatients = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    BitBtn2: TBitBtn;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Pnom_Contact: TDBEditEh;
    Adresse_Contact: TDBEditEh;
    Tel_contact: TDBEditEh;
    type_contact: TDBEditEh;
    Nom_Contact: TDBEditEh;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddContactPatients: TAddContactPatients;

implementation

{$R *.dfm}

uses Sourcedb, ClientClassesUnit1, ClientModuleUnit1, DossierU,
  RechercheDonneesU, AddInfoSocialesu;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddContactPatients.BitBtn1Click(Sender: TObject);
begin
if(Nom_Contact.Text<>'')and(Pnom_Contact.Text<>'')
   and(type_contact.Text<>'')then begin
  RechercheDonnees.ContactsPatients.Insert;
               RechercheDonnees.ContactsPatients.fieldbyName('idpersonne').asinteger:=StrToInt(dossier.N_malade.Text) ;
               RechercheDonnees.ContactsPatients.fieldbyName('nomContact').AsString:=Nom_Contact.Text ;
               RechercheDonnees.ContactsPatients.fieldbyName('prenomContact').AsString:=Pnom_Contact.Text;
               RechercheDonnees.ContactsPatients.fieldbyName('adresseContact').AsString:=Adresse_Contact.Text ;
               RechercheDonnees.ContactsPatients.fieldbyName('TelContact').AsString:=Tel_contact.Text;
               RechercheDonnees.ContactsPatients.fieldbyName('TypeContact').AsString:=type_contact.Text;
with ClientModule1 do
    VContactsPatients;
  Nom_Contact.Clear;
  Pnom_Contact.Clear;
  Adresse_Contact.Clear;
  Tel_contact.Clear;
  type_contact.Clear;

  end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');

end;

procedure TAddContactPatients.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddContactPatients.M1Click(Sender: TObject);
begin
//with ClientModule1 do begin
    Nom_Contact.Text :=    RechercheDonnees.ContactsPatients.fieldbyName('nomContact').AsString;
    Pnom_Contact.Text:=    RechercheDonnees.ContactsPatients.fieldbyName('prenomContact').AsString;
    Adresse_Contact.Text:=      RechercheDonnees.ContactsPatients.fieldbyName('adresseContact').AsString;
    Tel_contact.Text   :=          RechercheDonnees.ContactsPatients.fieldbyName('TelContact').AsString;
    type_contact.Text:=    RechercheDonnees.ContactsPatients.fieldbyName('TypeContact').AsString;
//end;

end;

procedure TAddContactPatients.S1Click(Sender: TObject);
begin
   with ClientModule1 do begin
     RechercheDonnees.ContactsPatients.delete;
     VContactsPatients;
   end;
end;

procedure TAddContactPatients.ToolButton1Click(Sender: TObject);
begin
  with ClientModule1 do
  try
      VContactsPatients;
  finally
   if MessageDlg('Informations Sociales a enregistrer?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     AddInfoSociales.Show;
     AddContactPatients.Close;
  end;


end;

procedure TAddContactPatients.BitBtn2Click(Sender: TObject);
begin
  AddContactPatients.Close;
end;



procedure TAddContactPatients.ComboBox1Change(Sender: TObject);
begin
//
Type_Contact.Text:= ComboBox1.Text;
end;

procedure TAddContactPatients.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    with AlternGrid(Sender) do begin
                               Case Odd(DataSource.Dataset.Recno) of
                                    true : Canvas.Brush.Color := $00E1D3CE;
                                    False :Canvas.Brush.Color := $00D5E3EE;
                               end;
                               if  DataLink.ActiveRecord = Row -1 then
                               begin
                               Canvas.Font.Color:=clwhite ;
                               Canvas.Brush.Color:=$C56A31;
                               end;
                               end;
(Sender as tdbgrid).DefaultDrawColumnCell(Rect,DataCol,Column, State);
end;

procedure TAddContactPatients.Edit1Change(Sender: TObject);
begin
   //
   // ClientModule1.Medecins.locate('NOM_med',edit1.Text,[lopartialkey])
end;

end.
