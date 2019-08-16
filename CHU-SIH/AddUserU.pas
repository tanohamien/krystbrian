unit AddUserU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh, dxGDIPlusClasses, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, AdvMenus, Vcl.Menus;

type
  TAddUser = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Label11: TLabel;
    Pass1: TEdit;
    users_s: TDataSource;
    Bevel2: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    User: TDBEditEh;
    pass2: TDBEditEh;
    services_S: TDataSource;
    tr_caisse_s: TDataSource;
    DBEditEh2: TDBEditEh;
    Image2: TImage;
    DBGrid1: TDBGrid;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddUser: TAddUser;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddUser.BitBtn1Click(Sender: TObject);
begin
{}if (User.Text<>'')and(pass1.Text<>'')
and(pass1.Text = pass2.Text)then begin

  ClientModule1.VUtilisateurs2;
  end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddUser.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddUser.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =1 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

procedure TAddUser.ToolButton2Click(Sender: TObject);
begin
 ClientModule1.Utilisateurs2.Delete;
end;

procedure TAddUser.ToolButton3Click(Sender: TObject);
begin
AddUser.Close;
end;

procedure TAddUser.ToolButton4Click(Sender: TObject);
begin
 ClientModule1.Utilisateurs2.Append;
end;

end.
