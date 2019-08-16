unit AddProduitAvarieU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider;

type
  TAddProduitAvarie = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label11: TLabel;
    Image2: TImage;
    Qte: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Date_Nes_Gar: TDateTimePicker;
    Label1: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    DataSource1: TDataSource;
    Dest: TMemo;
    avar: TComboBox;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddProduitAvarie: TAddProduitAvarie;

implementation

{$R *.dfm}

uses  RechercheDonneesU;

procedure TAddProduitAvarie.BitBtn1Click(Sender: TObject);
begin
//RechercheDonnees.Detail_Avarie
if(Qte.Text<>'')and(Dest.Text<>'')then begin
with RechercheDonnees do begin
   Detail_Avarie.fieldbyName('QteEnStock').AsInteger:=strtoint(Qte.Text);
   Detail_Avarie.fieldbyName('DescriptionAvari').AsString:=Dest.Text;
   Detail_Avarie.fieldbyName('DatePeremption').AsDateTime:=Date_Nes_Gar.Date ;
   Detail_Avarie.fieldbyName('Actif').AsString:=avar.Text ;
end ;
   AddProduitAvarie.Close;
 end
else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddProduitAvarie.FormShow(Sender: TObject);
begin
//ClientModule1. Gmalades.Open;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
Qte.SetFocus;
end;

procedure TAddProduitAvarie.BitBtn3Click(Sender: TObject);
begin
AddProduitAvarie.Close;
end;

end.
