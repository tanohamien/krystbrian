unit AddAprovisionementU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons,
  ComCtrls, Grids, DBGrids, Datasnap.DBClient, Datasnap.Provider;

type
  TAddAprovisionement = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Services_s: TDataSource;
    N_Service: TDBEdit;
    N_Apr: TEdit;
    Date_Apr: TEdit;
    Fournisseur: TEdit;
    Aprovisionnements_s: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    ListView1: TListView;
    Ajouter: TBitBtn;
    Suprimer: TBitBtn;
    BitBtn1: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    Medicaments_s: TDataSource;
    nm: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Detail1_s: TDataSource;
    Label6: TLabel;
    Stock_s: TDataSource;
    Image2: TImage;
    DatePicker: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure AjouterClick(Sender: TObject);
    procedure SuprimerClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure N_ServiceChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddAprovisionement: TAddAprovisionement;
  liste :TListItem;
  i:integer;
implementation


{$R *.dfm}

uses  StockMedicamentU, ClientModuleUnit1; //ClientModule1

procedure TAddAprovisionement.FormShow(Sender: TObject);
begin
//with  ClientModule1 do begin
//  ServerBureauEntreeDClient.DonnesDeBase;
//  GetRechercheStockBrServices(DOSSIER. ;
//  GetRechercheStockExp_stk
//  GetRechercheStockPer_stk
//  GetRechercheDetail1_stk
//  GETRechercheAprovisionnements_stk
//end;
//
//with StockMedicament do begin
//Aprovisionnements.OPEN;
//Detail1.OPEN;
//Services.OPEN;
//Stock.OPEN;
//Medicaments.OPEN;
//
//
//Aprovisionnements.Last;
//if (Aprovisionnements.FieldValues['N_Apr']<>null)then N_Apr.Text:=inttostr(Aprovisionnements.FieldValues['N_Apr']+1)else N_Apr.Text:='1';
//Date_Apr.Text:=datetostr(now);
//Aprovisionnements.Last;

{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
//end;
end;

procedure TAddAprovisionement.N_ServiceChange(Sender: TObject);
begin
with  ClientModule1 do begin
 // GetRechercheStockBrServices ;
//  GetRechercheStockExp_stk(N_Service.text);
//  GetRechercheStockPer_stk(N_Service.text);
//  GetRechercheDetail1_stk(N_Service.text);
// GETRechercheAprovisionnements_stk(N_Service.text) ;
end;
//
with StockMedicament do begin
// Aprovisionnements.OPEN;
//Detail1.OPEN;
//Services.OPEN;
//Stock.OPEN;
//Medicaments.OPEN;
end;

end;

procedure TAddAprovisionement.AjouterClick(Sender: TObject);
begin
if(DBLookupComboBox2.Text<>'')and(Edit1.Text<>'')and(Edit2.Text<>'')then begin
if (StockMedicament.detail1.Locate('N_Lot',strtoint(edit1.Text),[loCaseInsensitive])) then showmessage('le numero de lot que vous avez spécifier existe deja dans le stock , veillez choisire un autre numero .')
else begin
liste := ListView1.Items.Insert(1);
liste.Caption :='-';
liste.SubItems.Add(nm.Text);
liste.SubItems.Add(Edit1.Text);
liste.SubItems.Add(Edit2.Text);
liste.SubItems.Add(datetostr(DatePicker.Date));
Edit1.Text := inttostr(strtoint(Edit1.Text)+1);
Edit2.Clear;
end;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');

end;

procedure TAddAprovisionement.SuprimerClick(Sender: TObject);
begin
listview1.DeleteSelected;
end;

procedure TAddAprovisionement.BitBtn1Click(Sender: TObject);
begin
listview1.Clear;
end;

procedure TAddAprovisionement.BitBtn2Click(Sender: TObject);
var nm,nl,u,d : string;
begin
if(DBLookupComboBox1.Text<>'')and(Date_Apr.Text<>'')and(Fournisseur.Text<>'')and(ListView1.Items.Count<>0)then begin
with StockMedicament do begin
Aprovisionnements.Last;
Aprovisionnements.Insert;
//Aprovisionnements.fieldbyName('N_Apr').AsInteger:=StrToInt(N_Apr.Text) ;
Aprovisionnements.fieldbyName('N_Service').AsInteger:=StrToInt(N_service.Text);
Aprovisionnements.fieldbyName('Date_Apr').AsDateTime:=StrTodatetime(Date_Apr.Text);
Aprovisionnements.fieldbyName('Fournisseur').AsString:=Fournisseur.Text;
//ClientModule1.VAprovisionnements;
for i:=0 to (ListView1.Items.Count-1) do begin
                                         nm:= ListView1.Items[i].SubItems.Strings[0] ;
                                         nl:= ListView1.Items[i].SubItems.Strings[1] ;
                                         u:= ListView1.Items[i].SubItems.Strings[2] ;
                                         d:= ListView1.Items[i].SubItems.Strings[3] ;
                                         Detail1.Last;
                                         Stock.Last;
                                         Detail1.Insert;
                                         Stock.Insert;
                                         Detail1.fieldbyName('N_Medicament').AsInteger:=StrToInt(nm) ;
                                         Detail1.fieldbyName('N_Apr').AsInteger:=StrToInt(N_Apr.Text);
                                         Detail1.fieldbyName('N_Lot').AsInteger:=StrToInt(nl);

                                         Stock.fieldbyName('N_Lot').AsInteger:=StrToInt(nl);

                                         Detail1.fieldbyName('Date_Per').AsDateTime:=strtodate(d);
                                         Detail1.fieldbyName('Nbr_Uni').AsInteger:=StrToInt(u);

                                         Stock.fieldbyName('Nbr_Uni').AsInteger:=StrToInt(u);
//                                         Detail1.Post;
                                         ClientModule1.VOperationApprovisionnement;
                                         end;
AddAprovisionement.Close;
end;
end
 else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddAprovisionement.BitBtn3Click(Sender: TObject);
begin
AddAprovisionement.Close;
end;

procedure TAddAprovisionement.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then   Key := #0;
end;

procedure TAddAprovisionement.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then   Key := #0;
end;

end.
