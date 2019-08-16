unit AddReparationU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  DBCtrls, Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Datasnap.Provider;

type
  TAddReparation = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Label4: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Appareils_s: TDataSource;
    N_Appareil: TDBLookupComboBox;
    panes_s: TDataSource;
    Date_Rep: TEdit;
    Label2: TLabel;
    reparations_s: TDataSource;
    Appareils2_s: TDataSource;
    N_Pane: TDBEdit;
    procedure N_AppareilClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddReparation: TAddReparation;

implementation

{$R *.dfm}

uses  ClientModuleUnit1, RechercheDonneesU, DossierU;

procedure TAddReparation.N_AppareilClick(Sender: TObject);
begin
//Pane.SQL.Clear; //Efface le contenu de la stringlist
//Pane.SQL.Add('SELECT N_Pane from Panes WHERE(Panes.N_Appareil = :N_Appareil) ORDER BY N_Pane');
//Pane.ParamByName('N_Appareil').AsInteger:=N_Appareil.KeyValue;
ClientModule1.ServerBureauEntreeDClient.RecherchesTrouveParDossier(N_Appareil.KeyValue);
 with RechercheDonnees do
   Panes.Open; {}//Active la requête

end;

procedure TAddReparation.FormShow(Sender: TObject);
begin

Date_Rep.Text := datetimetostr(date);
//Appareils.SQL.Clear; //Efface le contenu de la stringlist
//Appareils.SQL.Add('SELECT distinct N_Appareil from Appareils WHERE(Appareils.Etat_Apa = 0) ORDER BY N_Appareil');
//ClientModule1.ServerBureauEntreeDClient. .RecherchesTrouveParDossier(dossier.nn);

with RechercheDonnees do
AppareilsEnPane.Open; {}//Active la requête
end;

procedure TAddReparation.BitBtn2Click(Sender: TObject);
begin
AddReparation.Close;
end;

procedure TAddReparation.BitBtn1Click(Sender: TObject);
begin
if(N_Appareil.Text<>'')and(Date_Rep.Text<>'')then begin
with   ClientModule1  do begin
Reparations.open;
Apareils.open;
Reparations.Insert;
Reparations.fieldbyName('N_Pane').AsInteger:=StrtoInt(N_Pane.Text) ;
Reparations.fieldbyName('Date_Rep').AsDatetime:=strtodatetime(Date_Rep.Text);
VReparations;

     Apareils.Locate('N_Appareil',N_Appareil.KeyValue, [loCaseInsensitive]);
     Apareils.Edit;
     Apareils.fieldbyName('Etat_Apa').AsString:='1' ;
     VApareils;
end;
AddReparation.Close;
end else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

end.
