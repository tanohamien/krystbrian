unit AddAntecedentsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, Vcl.ComCtrls, Vcl.ToolWin, AdvMenus, System.ImageList, Vcl.ImgList;

type
  TAddAntecedents = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemoEh1: TDBMemoEh;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBMemoEh2: TDBMemoEh;
    DBMemoEh3: TDBMemoEh;
    DBMemoEh4: TDBMemoEh;
    DBMemoEh5: TDBMemoEh;
    DBMemoEh6: TDBMemoEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddAntecedents: TAddAntecedents;

implementation

{$R *.dfm}

uses Sourcedb, ClientClassesUnit1, ClientModuleUnit1, DossierU,  constantes,
  RechercheDonneesU, AddContactPatientsU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddAntecedents.BitBtn1Click(Sender: TObject);
begin
  RechercheDonnees.Antecedents.append;

end;

procedure TAddAntecedents.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddAntecedents.S1Click(Sender: TObject);
begin
   with ClientModule1 do begin
     RechercheDonnees.Antecedents.delete;
     VAntecedents;
   end;
end;

procedure TAddAntecedents.ToolButton1Click(Sender: TObject);
begin
with ClientModule1 do begin
  TRY
   VAntecedents;
  FINALLY
    Close;
  END;

end;

end;

procedure TAddAntecedents.BitBtn2Click(Sender: TObject);
begin
  Close;
end;



procedure TAddAntecedents.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    with AlternGrid(Sender) do begin
                               Case Odd(DataSource.Dataset.Recno) of
                                    true : Canvas.Brush.Color := CouleurA;
                                    False :Canvas.Brush.Color := CouleurB;
                               end;
                               if  DataLink.ActiveRecord = Row -1 then
                               begin
                               Canvas.Font.Color:=couleur2A  ;
                               Canvas.Brush.Color:=couleur2B;
                               end;
                               end;
(Sender as tdbgrid).DefaultDrawColumnCell(Rect,DataCol,Column, State);
end;

procedure TAddAntecedents.Edit1Change(Sender: TObject);
begin
   //
   // ClientModule1.Medecins.locate('NOM_med',edit1.Text,[lopartialkey])
end;

end.
