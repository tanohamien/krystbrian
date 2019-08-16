unit AddMedicamentU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
   Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBVertGridsEh;

type
  TAddMedicament = class(TForm)
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    Image2: TImage;
    BitBtn3: TBitBtn;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    M1: TMenuItem;
    S1: TMenuItem;
    N_Medicament: TEdit;
    DBVertGridEh1: TDBVertGridEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddMedicament: TAddMedicament;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, DiversesListesu;
type
  AlternGrid = class(TCustomDBGrid);

procedure TAddMedicament.BitBtn1Click(Sender: TObject);
begin
 with ClientModule1 do begin
    Medicaments.Insert;
 end;
end;


procedure TAddMedicament.FormShow(Sender: TObject);
begin
with ClientModule1 do begin
Medicaments.open;
Medicaments.Last;
if (Medicaments.FieldValues['N_Medicament']<>null)then N_Medicament.Text:=inttostr(Medicaments.FieldValues['N_Medicament']+1)else N_Medicament.Text:='1';
end;

{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

procedure TAddMedicament.SpeedButton1Click(Sender: TObject);
begin
  ClientModule1.DiversListes.Close;
  ClientModule1.GetDiversListes(20);
  DiversesListes.NT1.PageIndex:=20;
  ClientModule1.DiversListes.Open;

  if DiversesListes.showmodal =  mrok then begin
   ClientModule1.Medicaments.EDIT;
  end;

end;

procedure TAddMedicament.BitBtn2Click(Sender: TObject);
begin
AddMedicament.Close;
end;

procedure TAddMedicament.BitBtn3Click(Sender: TObject);
begin
//if(Nom_Med.Text<>'')and(Type_Med.Text<>'')then begin
//
//  ClientModule1.Medicaments.EDIT;       //codepresentation
//  ClientModule1.Medicaments.fieldbyName('Refmedicament').AsString:=refmedicament.Text;
//  ClientModule1.Medicaments.fieldbyName('Nom_Med').AsString:=Nom_Med.Text ;
//  ClientModule1.Medicaments.fieldbyName('Type_Med').AsString:=Type_Med.Text;
//  ClientModule1.Medicaments.fieldbyName('PrixDeVente').AsFloat:=strtofloat(PrixDeVente.Text);
//  ClientModule1.Medicaments.fieldbyName('Dosage').AsString:=dosage.Text;
//  ClientModule1.Medicaments.fieldbyName('nomutilisateur').asstring:='TANO';
//  ClientModule1.Medicaments.fieldbyName('Familles').AsString:='MEDICAMENTS';
//  //mouvementer
//  ClientModule1.Medicaments.fieldbyName('mouvementer').Asboolean:=Mouvementer.Checked;
//
//   refmedicament.Clear;
//   Nom_Med.Text :='';
//   Type_Med.Text:='';
//   PrixDeVente.Text :='0';
//   Dosage.Text:='';
   ClientModule1.VMedicaments;
//end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddMedicament.DBGrid1CellClick(Column: TColumn);
begin
  M1.Click;
end;

end.
