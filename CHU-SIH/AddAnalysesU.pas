unit AddAnalysesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, AdvMenus, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin, DBCtrlsEh, Vcl.Mask, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.AppEvnts;

type
  TAddAnalyses = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Ajouter: TBitBtn;
    Suprimer: TBitBtn;
    analyses_s: TDataSource;
    analyses2: TDataSource;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    N_Entree: TDBEditEh;
    N_Ana: TDBEditEh;
    Date_Ind: TDBEditEh;
    Heure_Ind: TDBEditEh;
    Nom_Ana: TDBEditEh;
    RemAnalyse: TDBMemoEh;
    G_ana: TDBGridEh;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    ApplicationEvents1: TApplicationEvents;
    procedure AjouterClick(Sender: TObject);
    procedure SuprimerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddAnalyses: TAddAnalyses;
  liste :TListItem;
  i:integer;
implementation

uses  Sourcedb, DossierU, ClientModuleUnit1, DiversesListesU; //with  ClientModule1 do begin

{$R *.dfm}

procedure TAddAnalyses.AjouterClick(Sender: TObject);
begin
  ClientModule1.analyses2.APPEND;
end;

procedure TAddAnalyses.SpeedButton1Click(Sender: TObject);
begin
  ClientModule1.DiversListes.Close;
  ClientModule1.GetDiversListes(9);
  DiversesListes.NT1.PageIndex:=9;
  ClientModule1.DiversListes.Open;

  if DiversesListes.showmodal =  mrok then begin
   ClientModule1.Medicaments.EDIT;
   Nom_Ana.Text:= ClientModule1.DiversListes.fieldbyName('libelle').AsString;
   RemAnalyse.Lines.Add(ClientModule1.DiversListes.fieldbyName('Remarques').AsString);
  end;

end;

procedure TAddAnalyses.SuprimerClick(Sender: TObject);
begin
   ClientModule1.analyses2.delete;
end;

procedure TAddAnalyses.ToolButton2Click(Sender: TObject);
begin
  ClientModule1.analyses.delete;
end;

procedure TAddAnalyses.ToolButton3Click(Sender: TObject);
begin
   ClientModule1.analyses.cancel;
   ClientModule1.analyses2.cancel;
end;

procedure TAddAnalyses.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
//end;
end;

procedure TAddAnalyses.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  ToolButton1.Enabled:= (ClientModule1.analyses.State in [dsedit,dsinsert]) OR(ClientModule1.analyses2.State in [dsedit,dsinsert]);
  ToolButton3.Enabled:= (ClientModule1.analyses.State in [dsedit,dsinsert]) OR(ClientModule1.analyses2.State in [dsedit,dsinsert]);
  ToolButton2.Enabled:= NOT (ClientModule1.analyses.State in [dsedit,dsinsert])OR NOT (ClientModule1.analyses2.State in [dsedit,dsinsert]);
end;

procedure TAddAnalyses.BitBtn2Click(Sender: TObject);
begin
with  ClientModule1 do
  VAnalyses;
end;

end.
