unit AddExamenCliniqueU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, EhLibVCL;

type
  TAddExamenClinique = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    Image2: TImage;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Pnom_Contact: TDBEditEh;
    DBNavigator1: TDBNavigator;
    Nom_Contact: TDBEditEh;
    Label10: TLabel;
    DBImageEh1: TDBImageEh;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddExamenClinique: TAddExamenClinique;

implementation

{$R *.dfm}

uses Sourcedb, ClientClassesUnit1, ClientModuleUnit1, DossierU,
  RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddExamenClinique.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddExamenClinique.BitBtn2Click(Sender: TObject);
begin
  Close;
end;



procedure TAddExamenClinique.BitBtn3Click(Sender: TObject);
begin
  with ClientModule1 do
      VexamenClin;
   Close;

end;

procedure TAddExamenClinique.ComboBox1Change(Sender: TObject);
begin
//
end;

procedure TAddExamenClinique.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddExamenClinique.Edit1Change(Sender: TObject);
begin
   //
   // ClientModule1.Medecins.locate('NOM_med',edit1.Text,[lopartialkey])
end;

end.
