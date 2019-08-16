unit AddFermeCaisseJourU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh, dxGDIPlusClasses, Vcl.ComCtrls, Vcl.AppEvnts;

type
  TAddFermeCaisseJour = class(TForm)
    Image1: TImage;
    Label11: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    DBEditEh7: TDBEditEh;
    Label10: TLabel;
    Detail_FCaisse_s: TDataSource;
    tr_saisie_caisse_s: TDataSource;
    CoupureDevise_s: TDataSource;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBGrid2: TDBGrid;
    DBEditEh3: TDBEditEh;
    DBEditEh6: TDBEditEh;
    BitBtn4: TBitBtn;
    DBCheckBox2: TDBCheckBox;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEditEh10: TDBEditEh;
    DBNavigator2: TDBNavigator;
    DBEditEh11: TDBEditEh;
    Label1: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    DBText1: TDBText;
    ApplicationEvents1: TApplicationEvents;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddFermeCaisseJour: TAddFermeCaisseJour;

implementation

{$R *.dfm}

uses  ClientModuleUnit1, AddUserU, RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddFermeCaisseJour.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  BitBtn4.Enabled:= DBCheckBox2.Checked;
  //
  BitBtn1.Enabled:=(DBCheckBox2.Checked = TRUE)and (DBEditEh4.GetTextLen>0)and (DBEditEh5.GetTextLen>0);
end;

procedure TAddFermeCaisseJour.BitBtn1Click(Sender: TObject);
begin
  TRY
    ClientModule1.VCaisseDuJour;
  FINALLY
    ClientModule1.GetRecherchesCaisseencours(RechercheDonnees.tr_saisie_caisseNUMSCAISSE.asstring);
    ClientModule1.GETRecherchesCaisseParOperateur(CLIENTMODULE1.NUTIL);
  END;
  Close;
end;

procedure TAddFermeCaisseJour.BitBtn3Click(Sender: TObject);
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

procedure TAddFermeCaisseJour.BitBtn4Click(Sender: TObject);
begin
    RechercheDonnees.CalculTotalFCaisse;

end;

procedure TAddFermeCaisseJour.BitBtn2Click(Sender: TObject);
begin
AddUser.Close;
end;

procedure TAddFermeCaisseJour.DBCheckBox2Click(Sender: TObject);
begin
//
//if RechercheDonnees.tr_saisie_caisseHEUREFERMETURE.asstring ='' then
// raise exception.Create('La date de fermeture est obligatoire');
  BitBtn4.Enabled:= NOT DBCheckBox2.Checked;

end;

procedure TAddFermeCaisseJour.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddFermeCaisseJour.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =1 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

end.
