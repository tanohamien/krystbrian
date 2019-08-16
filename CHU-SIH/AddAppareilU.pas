unit AddAppareilU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DBCtrls, Mask, Datasnap.DBClient, Datasnap.Provider, DBCtrlsEh;

type
  TAddAppareil = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Image2: TImage;
    N_Appareil: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    apareils_s: TDataSource;
    N_Service: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    Label10: TLabel;
    N_Serie: TDBEditEh;
    Date_Aqui_Apa: TDBEditEh;
    Type_Apa: TDBEditEh;
    Marque_Apa: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddAppareil: TAddAppareil;

implementation

{$R *.dfm}

uses  ClientModuleUnit1, AppareilsU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddAppareil.FormShow(Sender: TObject);
begin
 with ClientModule1 do begin
Apareils.OPEN;
Apareils.Last;
if (Apareils.FieldValues['N_Appareil']<>null)then N_Appareil.Text:=inttostr(Apareils.FieldValues['N_Appareil']+1)else N_Appareil.Text:='1';
Date_Aqui_Apa.Text:=datetostr(now);
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
 end;
end;

procedure TAddAppareil.BitBtn1Click(Sender: TObject);
begin
if(DBLookupComboBox1.Text<>'')and(Marque_Apa.Text<>'')and(Type_Apa.Text<>'')and(Date_Aqui_Apa.Text<>'')and(N_Serie.Text<>'')then begin
 with ClientModule1 do begin
Apareils.Insert;
//            //   Appareils.fieldbyName('N_Appareil').AsInteger:=StrToInt(N_Appareil.Text) ;
//               Apareils.fieldbyName('N_Service').AsInteger:=StrToInt(N_Service.Text) ;
//               Apareils.fieldbyName('Marque_Apa').AsString:=Marque_Apa.Text;
//               Apareils.fieldbyName('Type_Apa').AsString:=Type_Apa.Text ;
//               Apareils.fieldbyName('Date_Aqui_Apa').asdatetime:=strtodatetime(Date_Aqui_Apa.Text);
//               Apareils.fieldbyName('N_Serie').AsString:=N_Serie.Text;
//               Apareils.fieldbyName('Etat_Apa').AsString:='1';
//VApareils;
N_Appareil.Text :=inttostr(strtoint(N_Appareil.Text)+1);
//Marque_Apa.Clear;
//Type_Apa.Clear;
end ;
end
else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddAppareil.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddAppareil.BitBtn2Click(Sender: TObject);
begin
AddAppareil.Close;
end;

end.
