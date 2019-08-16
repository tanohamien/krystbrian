unit AddInfoSocialesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBVertGridsEh, dxGDIPlusClasses, Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ComCtrls, Vcl.ToolWin, AdvMenus, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TAddInfoSociales = class(TForm)
    BitBtn2: TBitBtn;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label11: TLabel;
    Image2: TImage;
    BitBtn3: TBitBtn;
    DBEditEh2: TDBEditEh;
    DBCheckBox2: TDBCheckBox;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    Bevel5: TBevel;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
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
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddInfoSociales: TAddInfoSociales;

implementation



{$R *.dfm}

uses DossierU,RechercheDonneesU, ClientModuleUnit1, assist_1U;

procedure TAddInfoSociales.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TAddInfoSociales.BitBtn3Click(Sender: TObject);
begin
TRY
clientmodule1.VInfoSociales;
FINALLY
 if MessageDlg('Enregistrement terminé voulez-vous enegristrer un aure dossier ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   assist_1.Show;
  Close;
END;

end;

end.
