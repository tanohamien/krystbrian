unit AddMedecinU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls;

type
  TAddMedecin = class(TForm)
    Label3: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Image2: TImage;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    DBEdit4: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddMedecin: TAddMedecin;

implementation

{$R *.dfm}

uses  ClientClassesUnit1, ClientModuleUnit1;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddMedecin.BitBtn1Click(Sender: TObject);
begin
//if(Nom_Med.Text<>'')and(Pnom_Med.Text<>'')and(Specialite_med.Text<>'')and(Grade_Med.Text<>'')then begin
//with ClientModule1 do begin
//  Medecins.Insert;
//             //  Medecins.fieldbyName('N_Medecin').AsInteger:=StrToInt(N_Medecin.Text) ;
//               Medecins.fieldbyName('').AsString:=Nom_Med.Text ;
//               Medecins.fieldbyName('').AsString:=Pnom_Med.Text;
//               Medecins.fieldbyName('').AsString:=Specialite_med.Text ;
//               Medecins.fieldbyName('').AsString:=Grade_Med.Text;
//               Medecins.fieldbyName('').AsString:=TeleMedecin.Text;
//Vmedecin;
// end;
//N_Medecin.Text :=inttostr(strtoint(N_Medecin.Text)+1);
//Nom_Med.Clear;
//Pnom_Med.Clear;
//Specialite_med.Clear;
//Grade_Med.Clear;
//
//  end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
 ClientModule1.Medecins.Append;
end;

procedure TAddMedecin.FormShow(Sender: TObject);
begin
//  Nom_Med.Clear;
//  Pnom_Med.Clear;
//  Specialite_med.Clear;
//  Grade_Med.Clear;

  with ClientModule1 do begin
//   Medecins.Last;
//   if (Medecins.FieldValues['N_Medecin']<>null)then
//     N_Medecin.Text:=inttostr(Medecins.FieldValues['N_Medecin']+1)else N_Medecin.Text:='1';

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
  end;
end;

procedure TAddMedecin.BitBtn2Click(Sender: TObject);
begin
  AddMedecin.Close;
end;



procedure TAddMedecin.BitBtn3Click(Sender: TObject);
begin
try
  ClientModule1.Vmedecin;
finally
    close
end;

end;

procedure TAddMedecin.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddMedecin.Edit1Change(Sender: TObject);
begin

 //   ClientModule1.Medecins.locate('NOM_med',edit1.Text,[lopartialkey])
end;

end.
