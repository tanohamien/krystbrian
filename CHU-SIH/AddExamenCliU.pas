unit AddExamenCliU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, AdvMenus, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

type
  TAddExamenCCli = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Pnom_Contact: TDBEditEh;
    Tel_contact: TDBEditEh;
    type_contact: TDBEditEh;
    Nom_Contact: TDBEditEh;
    Label7: TLabel;
    DBEditEh2: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
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
    DBEdit2: TDBEdit;
    DBEditEh3: TDBEditEh;
    Label6: TLabel;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    Label14: TLabel;
    DBEditEh6: TDBEditEh;
    Label15: TLabel;
    DBEditEh7: TDBEditEh;
    Label16: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Image3: TImage;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddExamenCCli: TAddExamenCCli;

implementation

{$R *.dfm}

uses Sourcedb, ClientClassesUnit1, ClientModuleUnit1, DossierU,
  RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddExamenCCli.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddExamenCCli.ToolButton1Click(Sender: TObject);
begin
  with ClientModule1 do
      VexamenClin;
   Close;

end;

procedure TAddExamenCCli.ToolButton3Click(Sender: TObject);
begin
 RechercheDonnees.examencli.cancel;
 Close;
end;

procedure TAddExamenCCli.ComboBox1Change(Sender: TObject);
begin
//
end;

procedure TAddExamenCCli.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddExamenCCli.Edit1Change(Sender: TObject);
begin
   //
   // ClientModule1.Medecins.locate('NOM_med',edit1.Text,[lopartialkey])
end;

end.
