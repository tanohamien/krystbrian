unit AddTransfertU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, DB, DBTables, Buttons,
  ExtCtrls, Mask, DBCtrls, Datasnap.Provider, Datasnap.DBClient,
  dxGDIPlusClasses, Vcl.ToolWin, Vcl.Menus, AdvMenus, System.ImageList,
  Vcl.ImgList;

type
  TAddTransfert = class(TForm)
    BitBtn1: TBitBtn;
    Transferts_s: TDataSource;
    Entrees_s: TDataSource;
    N_Entree: TEdit;
    N_Ser_Act: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    N_Transfert: TEdit;
    Label5: TLabel;
    Date_Tra: TEdit;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn3: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    N_Ser_Des: TDBEdit;
    Services_s: TDataSource;
    Nom_Ser_Act: TEdit;
    Label7: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Places_Lib_Ser: TDBEdit;
    Services2_s: TDataSource;
    Label11: TLabel;
    Image2: TImage;
    Label6: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    ImageList1: TImageList;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvMainMenu1: TAdvMainMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    A1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Places_Lib_SerChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddTransfert: TAddTransfert;
  toto :TListItem;
implementation

uses   DossierU, ClientModuleUnit1;

{$R *.dfm}

procedure TAddTransfert.FormShow(Sender: TObject);
begin
 with ClientModule1 do begin
    Services.Open;
    Services2.Open;
    Transferts.Open;
    Entrees.Open;


Transferts.Last;
//if (Transferts.FieldValues['N_Transfert']<>null)then N_Transfert.Text:=inttostr(Transferts.FieldValues['N_Transfert']+1)else N_Transfert.Text:='1'; //calcule du n° du malade a ajouter
N_Entree.Text:=Dossier.N_Entree.Text;
Date_Tra.Text := DatetoStr(now);

Transferts.Last;

while((Transferts.FieldByName('N_Entree').AsString<>N_Entree.Text) and not(Transferts.Bof))do Transferts.Prior; //parcoure de la table de bas en haut
if (Transferts.FieldByName('N_Entree').AsString=N_Entree.Text) then begin //verifie si l'anregistrement en cours correspend  au n_entrée
                                                                    N_Ser_Act.Text := Transferts.FieldByName('N_Ser_Des').AsString
                                                                    end else begin //si non c-a-d qu'on n'a pas truver un transferts correspendant au n-enrée

                                                                             Entrees.FindKey([N_Entree.Text]);

//                                                                             Entrees.SetKey;
//                                                                             Entrees.FieldByName('N_Entree').AsString:=N_Entree.Text;
//                                                                             Entrees.GotoKey;
                                                                             N_Ser_Act.Text :=  Entrees.FieldByName('N_Service').AsString;
                                                                             end;

services.Locate('N_Service',strtoint(N_ser_Act.Text), [loCaseInsensitive]);
Nom_Ser_Act.Text:=services.FieldByName('Nom_Ser').AsString;

end;
end;

procedure TAddTransfert.BitBtn1Click(Sender: TObject);
begin
 with ClientModule1 do begin
if(DBLookupComboBox1.Text<>'')and(Date_tra.Text<>'')then begin
if(N_Ser_Act.Text<>N_Ser_Des.Text)then begin
                                       Transferts.Insert;
                                       //Transferts.FieldByName('N_Transfert').AsInteger:= Strtoint(N_Transfert.text);
                                       Transferts.FieldByName('N_Entree').AsInteger:= Strtoint(N_Entree.text);
                                       Transferts.FieldByName('N_Ser_Act').AsInteger:= Strtoint(N_Ser_Act.text) ;
                                       Transferts.FieldByName('N_Ser_Des').AsInteger:= Strtoint(N_Ser_Des.text);
                                       Transferts.FieldByName('Date_Tra').asdatetime:= Strtodate(Date_Tra.text);
                                       //Transferts.ApplyUpdates(-1);

                                       Services.Edit;
                                       Services.FieldByName('Places_Lib_Ser').AsInteger :=Services.FieldByName('Places_Lib_Ser').AsInteger+1;
                                       //Services.ApplyUpdates(-1);

                                       Services2.Edit;
                                       Services2.FieldByName('Places_Lib_Ser').AsInteger :=Services2.FieldByName('Places_Lib_Ser').AsInteger-1;

  if malades.FindKey([dossier.N_Malade.Text]) = true then
   begin
    malades.Edit;
    malades.FieldByName('N_Entree').Asinteger:=Strtoint(N_Entree.text);
  //  malades.FieldByName('N_Sortie').Asinteger:=0;
    malades.FieldByName('N_service').Asinteger:=Strtoint(N_Ser_Des.text);
  if Entrees.FindKey([dossier.N_Entree.Text]) = true then
   begin
    Entrees.Edit;
    Entrees.FieldByName('n_service').Asinteger:=Strtoint(N_Ser_Des.text);
   end;

   end;


                                       Vtransferts;
                                       AddTransfert.Close;
                                       end else showmessage('choisissez un service destination diferants du service actuel !');
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;
end;

procedure TAddTransfert.BitBtn3Click(Sender: TObject);
begin
addtransfert.Close;
end;

procedure TAddTransfert.Places_Lib_SerChange(Sender: TObject);
begin
if Places_Lib_Ser.Text='0' then begin
                                Places_Lib_Ser.Color:=$007A7AEF;
                                BitBtn1.Enabled:=false;
                                end else begin
                                         Places_Lib_Ser.Color:=clMoneyGreen;
                                         BitBtn1.Enabled:=true;
                                         end;


end;

end.
