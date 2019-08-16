unit AddFournisseursU;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, OKCANCL1, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.DBClientActns, Vcl.ActnList, Vcl.DBActns,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Grids, Vcl.DBGrids,
  Vcl.AppEvnts, AdvMenus, Vcl.ComCtrls, Vcl.ToolWin, System.ImageList,
  Vcl.ImgList;

type
  TAddFournisseurs = class(TOKBottomDlg)
    Label1: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Bevel2: TBevel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AdvMenuStyler1: TAdvMenuStyler;
    ApplicationEvents1: TApplicationEvents;
    Image1: TImage;
    Label4: TLabel;
    Panel1: TPanel;
    procedure HelpBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddFournisseurs: TAddFournisseurs;

implementation

{$R *.dfm}

uses
  ClientModuleUnit1;

procedure TAddFournisseurs.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  inherited;
  ToolButton1.Enabled:= (ClientModule1.fournisseurs.State in [dsedit,dsinsert]) ;
  ToolButton3.Enabled:= (ClientModule1.fournisseurs.State in [dsedit,dsinsert]) ;
  ToolButton2.Enabled:= NOT (ClientModule1.fournisseurs.State in [dsedit,dsinsert]);

end;

procedure TAddFournisseurs.FormActivate(Sender: TObject);
begin
  inherited;
//  ClientModule1.Fournisseurs.Open;

end;

procedure TAddFournisseurs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // datad.Clients.close;

end;

procedure TAddFournisseurs.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TAddFournisseurs.ToolButton1Click(Sender: TObject);
begin
  inherited;
  ClientModule1.Vfournisseurs  ;
  Close;

end;

end.
