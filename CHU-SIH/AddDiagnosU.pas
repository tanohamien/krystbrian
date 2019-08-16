unit AddDiagnosU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AddAnalysesU, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.Menus, AdvMenus,
  System.ImageList, Vcl.ImgList, Data.DB, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, DBCtrlsEh, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.AppEvnts;

type
  TAddDiagnos = class(TAddAnalyses)
    Medicaments_S: TDataSource;
    Diagnostiques_S: TDataSource;
    soins_S: TDataSource;
    presentation_S: TDataSource;
    UnitesDemesure: TDBLookupComboBox;
    DBEditEh3: TDBEditEh;
    Label4: TLabel;
    Label6: TLabel;
    Produits: TDBEditEh;
    SpeedButton4: TSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AjouterClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ToolButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddDiagnos: TAddDiagnos;

implementation

{$R *.dfm}
uses   DossierU, ClientModuleUnit1, DiversesListesU; //with  ClientModule1 do begin

procedure TAddDiagnos.AjouterClick(Sender: TObject);
begin

 ClientModule1.Soins.APPEND;
end;

procedure TAddDiagnos.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin

  ToolButton1.Enabled:= (ClientModule1.Diagnostiques.State in [dsedit,dsinsert]) OR(ClientModule1.soins.State in [dsedit,dsinsert]);
  ToolButton3.Enabled:= (ClientModule1.Diagnostiques.State in [dsedit,dsinsert]) OR(ClientModule1.soins.State in [dsedit,dsinsert]);
  ToolButton2.Enabled:= NOT (ClientModule1.Diagnostiques.State in [dsedit,dsinsert])OR NOT (ClientModule1.soins.State in [dsedit,dsinsert]);

end;

procedure TAddDiagnos.BitBtn2Click(Sender: TObject);
begin

with  ClientModule1 do
  Vdiagnostic;

end;

procedure TAddDiagnos.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddDiagnos.SpeedButton4Click(Sender: TObject);
begin
//  DiversesListes.Release;
//  Application.CreateForm(TAddDiagnos, DiversesListes);

with  TDiversesListes.create(SELF) do
  begin
   DiversesListes.NT1.Pageindex:=13;
   if DiversesListes.showmodal = mrok then
     Begin
      ClientModule1.Soins.Edit;
      ClientModule1.Soins.FieldByName('RefMedicament').AsString:= ClientModule1.Medicaments.FieldByName('RefMedicament').AsString;
      ClientModule1.Soins.FieldByName('nom_med').AsString:= ClientModule1.Medicaments.FieldByName('nom_med').AsString;
     End;
     Release;
  end;

end;

procedure TAddDiagnos.ToolButton3Click(Sender: TObject);
begin

 ClientModule1.Diagnostiques.cancel;
 ClientModule1.soins.cancel;

end;

end.
