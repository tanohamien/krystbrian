unit AddGmaladeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider;

type
  TAddGmalade = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label11: TLabel;
    Image2: TImage;
    Pnom_Gar: TEdit;
    N_Malade: TEdit;
    Nom_Gar: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    Date_Nes_Gar: TDateTimePicker;
    telgarde: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddGmalade: TAddGmalade;

implementation

{$R *.dfm}

uses  ClientModuleUnit1;

procedure TAddGmalade.BitBtn1Click(Sender: TObject);
begin
if(Nom_Gar.Text<>'')and(Pnom_Gar.Text<>'')then begin
with ClientModule1 do begin
Gmalades.Locate('N_Malade',strtoint(N_Malade.Text), [loCaseInsensitive]);
IF(Gmalades.fieldbyName('N_Malade').AsInteger = strtoint(N_Malade.Text))then
   ClientModule1.Gmalades.Edit else ClientModule1.Gmalades.Insert;
Gmalades.fieldbyName('N_Malade').AsInteger:=strtoint(N_Malade.Text);
Gmalades.fieldbyName('Nom_Gar').AsString:=Nom_Gar.Text;
Gmalades.fieldbyName('Pnom_Gar').AsString:=Pnom_Gar.Text ;
Gmalades.fieldbyName('Date_Nes_Gar').AsDatetime:=Date_Nes_Gar.Date;
Gmalades.fieldbyName('telgarde').AsString:=telgarde.text;
vGmalades;
//Gmalades.Refresh;
AddGmalade.Close;
end ;
end
else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddGmalade.FormShow(Sender: TObject);
begin
ClientModule1. Gmalades.Open;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
Nom_Gar.SetFocus;
end;

procedure TAddGmalade.BitBtn3Click(Sender: TObject);
begin
AddGmalade.Close;
end;

end.
