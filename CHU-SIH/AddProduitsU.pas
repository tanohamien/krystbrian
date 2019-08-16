unit AddProduitsU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, DBCtrlsEh, DBLookupEh, Vcl.Mask, Vcl.ComCtrls;

type
  TAddProduits = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel3: TBevel;
    StatusBar1: TStatusBar;
    Label11: TLabel;
    Image2: TImage;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    DBEditEh3: TDBEditEh;
    Label4: TLabel;
    DBEditEh4: TDBEditEh;
    Label5: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label8: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label7: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label6: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    DBEditEh5: TDBEditEh;
    Label9: TLabel;
    Label15: TLabel;
    DBEditEh10: TDBEditEh;
    DBEditEh9: TDBEditEh;
    Label14: TLabel;
    Label12: TLabel;
    DBEditEh7: TDBEditEh;
    Label13: TLabel;
    Button1: TButton;
    DBComboBoxEh2: TDBComboBoxEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEditEh6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh6Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddProduits: TAddProduits;

implementation

{$R *.dfm}

uses RechercheDonneesU,ClientModuleUnit1;

procedure TAddProduits.BitBtn1Click(Sender: TObject);
begin

// DataMd.produit.edit;
//  if  DataMd.produit.ApplyUpdates(0) >  0 then
//   showmessage('Enregistrement échoué, veuillez recommencer')
//   else
//     begin
//       activecontrol:= DBEditEh6;
//       showmessage('Succes')
//
//    end ;

end;

procedure TAddProduits.DBEditEh6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if key = 13 then
//Begin
//  DataMd.produit.close;
//  DataMd.produit.open;
// if DataMd.produit.FindKey([DBEditEh6.text]) = false then
//  begin
//   DataMd.produit.append;
//   DataMd.produitCodeProduit.value:=DBEditEh6.Text;
//  end
// else
//   DataMd.produit.edit;
//End;

end;

procedure TAddProduits.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TAddProduits.DBEditEh6Enter(Sender: TObject);
begin
//DBEditEh6.text:='';
end;

end.
