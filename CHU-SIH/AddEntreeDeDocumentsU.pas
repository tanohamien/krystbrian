unit AddEntreeDeDocumentsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.DBCtrls, DBCtrlsEh, Vcl.Mask,
  Vcl.ToolWin, AdvMenus, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TAddEntreeDeDocuments = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label11: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Nom_Gar: TDBLookupComboBox;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBEditEh2: TDBEditEh;
    DBMemoEh1: TDBMemoEh;
    DBCheckBox1: TDBCheckBox;
    Label5: TLabel;
    DBEditEh3: TDBEditEh;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ImageList1: TImageList;
    AdvMenuStyler1: TAdvMenuStyler;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddEntreeDeDocuments: TAddEntreeDeDocuments;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, RechercheDonneesU;

procedure TAddEntreeDeDocuments.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
Nom_Gar.SetFocus;
end;

procedure TAddEntreeDeDocuments.BitBtn1Click(Sender: TObject);
begin
 ClientModule1.VMouvementDossiers;//VMouvementDossiersEnAttente;
 Close;
end;

procedure TAddEntreeDeDocuments.BitBtn3Click(Sender: TObject);
begin
Close;
end;

end.
