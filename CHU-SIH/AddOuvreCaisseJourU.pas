unit AddOuvreCaisseJourU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh, dxGDIPlusClasses, Vcl.ComCtrls, Vcl.AppEvnts;

type
  TAddOuvreCaisseJour = class(TForm)
    Image1: TImage;
    Label11: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Panel1: TPanel;
    Bevel4: TBevel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    DBEditEh2: TDBEditEh;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    DBEditEh1: TDBEditEh;
    User: TDBEditEh;
    BitBtn3: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    tr_saisie_caisse_s: TDataSource;
    CoupureDevise_s: TDataSource;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    DBLookupComboBox1: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    Detail_OCaisse_s: TDataSource;
    DBText1: TDBText;
    ApplicationEvents1: TApplicationEvents;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddOuvreCaisseJour: TAddOuvreCaisseJour;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, AddUserU, RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddOuvreCaisseJour.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  BitBtn3.Enabled:= DBCheckBox1.Checked;
  BitBtn1.Enabled:=(DBCheckBox1.Checked = TRUE)and (user.GetTextLen>0)and (DBEditEh1.GetTextLen>0);

end;

procedure TAddOuvreCaisseJour.BitBtn1Click(Sender: TObject);
begin
  TRY
    ClientModule1.VCaisseDuJour;
  FINALLY
    ClientModule1.GetRecherchesCaisseencours(RechercheDonnees.tr_saisie_caisseNUMSCAISSE.asstring);
    ClientModule1.GETRecherchesCaisseParOperateur(CLIENTMODULE1.NUTIL);
  END;
  Close;
end;

procedure TAddOuvreCaisseJour.BitBtn3Click(Sender: TObject);
var
 id:integer;
begin
  TRY
    id:= ClientModule1.ID_tr_saisie_caisse+1;
    RechercheDonnees.tr_saisie_caisseNUMSCAISSE.VALUE:= id;
    RechercheDonnees.CalculTotalOCaisse;
  FINALLY
   // DBCheckBox1.Enabled:=false;
  END;
end;

procedure TAddOuvreCaisseJour.BitBtn4Click(Sender: TObject);
begin
    RechercheDonnees.CalculTotalFCaisse;

end;

procedure TAddOuvreCaisseJour.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TAddOuvreCaisseJour.DBCheckBox1Click(Sender: TObject);
begin
// if RechercheDonnees.tr_saisie_caisseHEUREOUVERTURE.asstring ='' then
// raise exception.Create('La date d''ouverture est obligatoire');

//  BitBtn3.Enabled:= not DBCheckBox1.Checked;
end;

procedure TAddOuvreCaisseJour.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddOuvreCaisseJour.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =1 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

end.
