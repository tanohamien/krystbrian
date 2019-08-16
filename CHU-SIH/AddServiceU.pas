unit AddServiceU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, Vcl.ToolWin, Vcl.AppEvnts,
  System.ImageList, Vcl.ImgList, AdvMenus, Vcl.Menus, DBGridEh, Vcl.DBCtrls,
  Vcl.Mask, DBCtrlsEh, DBLookupEh;

type
  TAddService = class(TForm)
    DataSource1: TDataSource;
    AJOUT: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ENREG: TBitBtn;
    Label1: TLabel;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    AdvMenuStyler1: TAdvMenuStyler;
    ImageList1: TImageList;
    ApplicationEvents1: TApplicationEvents;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Capacite_Ser: TDBEdit;
    Places_Lib_Ser: TDBEdit;
    prixConsultation: TDBEdit;
    DureeConsultation: TDBEdit;
    Nom_Ser: TDBEdit;
    Label5: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    procedure AJOUTClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure N_ServKeyPress(Sender: TObject; var Key: Char);
    procedure Capacite_SerKeyPress(Sender: TObject; var Key: Char);
    procedure Places_Lib_SerKeyPress(Sender: TObject; var Key: Char);
    procedure ENREGClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddService: TAddService;

implementation

{$R *.dfm}

uses  ClientModuleUnit1;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddService.AJOUTClick(Sender: TObject);
begin

with ClientModule1 do
 Services.append;

(*
if(Places_Lib_Ser.Text<>'')and(Nom_Serv.Text<>'')and(Capacite_Ser.Text<>'')then begin
with ClientModule1 do begin
 Services.Last;
 Services.Insert;
              // Services.fieldbyName('N_Service').AsInteger:=StrToInt(N_Serv.Text) ;
               Services.fieldbyName('Nom_Ser').AsString:=Nom_Serv.Text ;
               Services.fieldbyName('Capacite_Ser').AsInteger:=StrToInt(Capacite_Ser.Text);
               Services.fieldbyName('Places_Lib_Ser').AsInteger:=StrToInt(Places_Lib_Ser.Text);
               Services.fieldbyName('prixConsultation').Asfloat:=strtofloat(prixConsultation.Text) ;
               Services.fieldbyName('DureeConsultation').AsInteger:=StrToInt(DureeConsultation.Text);
 VServices;
  end;
end
 else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
    *)
//      Nom_Serv.Clear ;
//      Capacite_Ser.Text:='100' ;
//      Places_Lib_Ser.Text:='100' ;
//      prixConsultation.Text:='0' ;
//      DureeConsultation.Text:='0';
     // FormeBase.Text:='';
end;

procedure TAddService.BitBtn3Click(Sender: TObject);
begin
with ClientModule1 do  begin
     Services.Delete;
     VServices;
end;

end;

procedure TAddService.ENREGClick(Sender: TObject);
begin
with ClientModule1 do begin
 Services.Edit;
//               Services.fieldbyName('Nom_Ser').AsString:=Nom_Serv.Text ;
//               Services.fieldbyName('Capacite_Ser').AsInteger:=StrToInt(Capacite_Ser.Text);
//               Services.fieldbyName('Places_Lib_Ser').AsInteger:=StrToInt(Places_Lib_Ser.Text);
//               Services.fieldbyName('prixConsultation').Asfloat:=strtofloat(prixConsultation.Text) ;
//               Services.fieldbyName('DureeConsultation').AsInteger:=StrToInt(DureeConsultation.Text);
//               Services.fieldbyName('FormeBase').Asstring:=FormeBase.Text;


 VServices;
end;


end;

procedure TAddService.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  ToolButton1.Enabled:= (ClientModule1.services.State in [dsedit,dsinsert]) ;
  ToolButton3.Enabled:= (ClientModule1.services.State in [dsedit,dsinsert]) ;
  ToolButton2.Enabled:= NOT (ClientModule1.services.State in [dsedit,dsinsert]);

end;

procedure TAddService.BitBtn2Click(Sender: TObject);
begin
AddService.Close;
end;

procedure TAddService.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddService.FormShow(Sender: TObject);
begin
with ClientModule1 do
Services.Open;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;

procedure TAddService.N_ServKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then   Key := #0;
end;

procedure TAddService.Capacite_SerKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then   Key := #0;
end;

procedure TAddService.Places_Lib_SerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then   Key := #0;
end;

end.
