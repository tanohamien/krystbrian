unit AddUserOrdinaireU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh, dxGDIPlusClasses;

type
  TAddUserOrdinaire = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Pass1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    users_s: TDataSource;
    Bevel2: TBevel;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    User: TDBEditEh;
    pass2: TDBEditEh;
    services_S: TDataSource;
    tr_caisse_s: TDataSource;
    Image3: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddUserOrdinaire: TAddUserOrdinaire;

implementation

{$R *.dfm}

uses Sourcedb, ClientModuleUnit1, RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddUserOrdinaire.BitBtn1Click(Sender: TObject);
begin
{}if (User.Text<>'')and(pass1.Text<>'')
and(pass1.Text = pass2.Text)then begin
   ClientModule1.VUtilisateurs2;
   showmessage('Mises a jour modifiees avec succees');
   AddUserOrdinaire.Close;
  end
   else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddUserOrdinaire.BitBtn3Click(Sender: TObject);
begin
 ClientModule1.Utilisateurs2.Delete;
end;

procedure TAddUserOrdinaire.BitBtn4Click(Sender: TObject);
begin
ClientModule1.Utilisateurs2.Append;
end;

procedure TAddUserOrdinaire.BitBtn2Click(Sender: TObject);
begin
AddUserOrdinaire.Close;
end;

procedure TAddUserOrdinaire.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddUserOrdinaire.FormShow(Sender: TObject);
begin
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =1 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

end.
