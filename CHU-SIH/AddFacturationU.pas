unit AddFacturationU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, Buttons,
  ComCtrls, Mask, DBCtrls, Datasnap.DBClient, Datasnap.Provider,dateutils,
  DBCtrlsEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TAddFacturation = class(TForm)
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    qte: TEdit;
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
    Bevel4: TBevel;
    Pu: TEdit;
    Pt: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    N_Entree: TDBEdit;
    Label14: TLabel;
    Label2: TLabel;
    N_Dia: TEdit;
    n_dossier: TDBEdit;
    Label5: TLabel;
    resultat: TDBEditEh;
    DBEditEh1: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBGridEh1: TDBGridEh;


    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AjouterClick(Sender: TObject);
    procedure SuprimerClick(Sender: TObject);

    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure qteChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddFacturation: TAddFacturation;
  liste :TListItem;
  i:integer;
implementation

uses   DelMedicamentU, ClientModuleUnit1, AddDiagnosU, DossierU,
  RechercheDonneesU;        //ClientModule1

{$R *.dfm}

procedure TAddFacturation.Button1Click(Sender: TObject);
var m,u,q : string;
begin

end;

procedure TAddFacturation.DateTimePicker1Change(Sender: TObject);
begin
 //date_dia.Text:=  datetostr(DateTimePicker1.DateTime);
end;

procedure TAddFacturation.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddFacturation.qteChange(Sender: TObject);
begin
Pt.Text:=floattostr(strtofloat(Qte.Text)* strtofloat(pu.Text));

end;

procedure TAddFacturation.AjouterClick(Sender: TObject);
begin
if(produits.Text<>'')and(qte.Text<>'')then begin
liste := ListView1.Items.Insert(1);
liste.Caption :='-';
liste.SubItems.Add(nm.Text);
//RefMedicament
liste.SubItems.Add(refp.Text);
liste.SubItems.Add(Produits.Text);
liste.SubItems.Add(Qte.Text);
liste.SubItems.Add(Pu.Text);
liste.SubItems.Add(Pt.Text);
//UnitesDemesure.:='';
Qte.Text:='0';
Pu.Text:='0';
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddFacturation.SuprimerClick(Sender: TObject);
begin
  listview1.DeleteSelected;
end;

procedure TAddFacturation.BitBtn2Click(Sender: TObject);
var Ref,nom,uite,qtee,n, pue,pte : string;
id:integer;
begin
   id:=ClientModule1.ID_T_VENTE+1;
  //   if (Date_Dia.Text<>'')then begin
         with RechercheDonnees do begin
                              T_ventes.APPEND;
                              T_ventes.fieldbyName('IDCONTRAT').AsInteger:=RechercheDonnees.TMalades.FieldByName('N_entree').asinteger;//StrToInt(N_Entree.Text) ;
                              T_ventes.fieldbyName('code').AsInteger:=id;//StrToInt(N_Dia.Text);
                              T_ventes.fieldbyName('DATEENREG').AsDateTime:=Date;
                              T_ventes.fieldbyName('TYPE').AsString:='FACTURE';
                              T_ventes.fieldbyName('CODE_DEP').Asinteger:=1;
                              T_ventes.fieldbyName('CODE_CLI').Asinteger:=RechercheDonnees.TMalades.FieldByName('N_malade').asinteger;
                              //T_ventes.fieldbyName('REFVENTE').AsString:=refvente.Text;
                              T_ventes.fieldbyName('TOTAL_HT').Asfloat:=0;
                              T_ventes.fieldbyName('TOTAL_HT').Asfloat:=0;
                              T_ventes.fieldbyName('TOTAL_TAXE').Asfloat:=0;
                              T_ventes.fieldbyName('MT_REGLER').Asfloat:=0;
                              T_ventes.fieldbyName('REGLER').AsBoolean:=false;
                              T_ventes.fieldbyName('TMOIS').Asinteger:=monthof(date);
                              T_ventes.fieldbyName('CODEEXERCICE').Asinteger:=yearof(date);
                             // T_ventes.fieldbyName('INFO1').AsString:=resultat.Text;

                              ClientModule1.VT_Ventes;

                               // remplissage de l_ventes

//                               ClientModule1.GetTrouveL_Ventes(inttostr(id),'FACTURE');
//                                 for i:=0 to (ListView1.Items.Count-1) do
//                                begin
//                                 L_ventes.open;
//                                 Ref:= ListView1.Items[i].SubItems.Strings[1] ;
//                                 nom:= ListView1.Items[i].SubItems.Strings[2] ;
//                                 qtee:= ListView1.Items[i].SubItems.Strings[3] ;
//                                 PUe:= ListView1.Items[i].SubItems.Strings[4] ;
//                                 PTe:= ListView1.Items[i].SubItems.Strings[5] ;
//
//                                 L_ventes.APPEND;
//                                 L_ventes.fieldbyName('Type').AsString:='FACTURE' ;
//                                 L_ventes.fieldbyName('code').AsInteger:=id; //StrToInt(N_Dia.Text);
//                                 L_ventes.fieldbyName('reference').AsString:=Ref;
//                                 L_ventes.fieldbyName('DATEENREG').AsDateTime:=Date;
//                                 L_ventes.fieldbyName('CODE_DEP').Asinteger:=1;
//                                 L_ventes.fieldbyName('designation').AsString:=nom;
//                                 L_ventes.fieldbyName('qte').AsString:=qtee;
//                                 L_ventes.fieldbyName('PRIXHT').AsString:=pue;
//                                 L_ventes.fieldbyName('TOTALHT').AsString:=pte;
//                                 end;
//                              //  ClientModule1.vL_Ventes;

                               end;
AddFacturation.Close;


end;

procedure TAddFacturation.BitBtn3Click(Sender: TObject);
begin
addDiagnos.Close;
end;

procedure TAddFacturation.BitBtn1Click(Sender: TObject);
begin
listview1.Clear;
end;

end.

