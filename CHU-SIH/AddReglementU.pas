unit AddReglementU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Mask, Datasnap.DBClient, Datasnap.Provider, Vcl.ComCtrls,
  dxGDIPlusClasses, Vcl.Menus;

type
  TAddReglement = class(TForm)
    N_Entree: TEdit;
    N_Malade: TEdit;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    Bevel3: TBevel;
    Label9: TLabel;
    Image2: TImage;
    Bevel2: TBevel;
    MD0: TDBLookupComboBox;
    Bevel5: TBevel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    D0: TDateTimePicker;
    REF0: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    DOS0: TEdit;
    NumDos: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    MT0: TEdit;
    GroupBox1: TGroupBox;
    DBGrid14: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DBText4: TDBText;
    Label12: TLabel;
    limiteProchainpaie: TDateTimePicker;
    Label13: TLabel;
    prochainpaie: TDateTimePicker;
    ImprimeRecu: TPopupMenu;
    R1: TMenuItem;
    R2: TMenuItem;
    R3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddReglement: TAddReglement;

implementation

uses Sourcedb, DossierU, ClientModuleUnit1, Constantes,
Imp_RecuPrestationu, RechercheDonneesU, AddEntreeU;

{$R *.dfm}



function EnLettres(n: integer; France: Boolean = True): string;
Const
  Unite: Array [1 .. 16] of String = ('UN', 'DEUX', 'TROIS', 'QUATRE', 'CINQ',
    'SIX', 'SEPT', 'HUIT', 'NEUF', 'DIX', 'ONZE', 'DOUZE', 'TREIZE', 'QUARTOZE',
    'QUINZE', 'SEIZE');
  Dizaine: Array [2 .. 8] of String = ('VINGT', 'TRENTE', 'QUARANTE',
    'CINQUANTE', 'SOIXANTE', '', 'QUATRE-VINGT');
  Coefs: Array [0 .. 3] of String = ('CENT', 'MILLE', 'MILLION', 'MILLIARD');
Var
  Temp: String;
  C, D, U: Byte;
  Coef: Byte;
  I: Word;
  Neg: Boolean;
begin
  If n = 0 then
  begin
    Result := ' Zéro';
    Exit;
  end;
  Result := '';
  Neg := n < 0;
  If Neg then
    n := -n;
  Coef := 0;
  Repeat
    U := n mod 10;
    n := n div 10; { Récupère unité et dizaine }
    D := n mod 10;
    n := n div 10; { Récupère dizaine }
    If D in [1, 7, 9] then
    begin
      Dec(D);
      Inc(U, 10);
    end;
    Temp := '';
    If D > 1 then
    begin
      Temp := ' ' + Dizaine[D];
      If (D < 8) and ((U = 1) or (U = 11)) then
        Temp := Temp + ' et';
    end;
    If U > 16 then
    begin
      Temp := Temp + ' ' + Unite[10];
      Dec(U, 10);
    end;
    If U > 0 then
      Temp := Temp + ' ' + Unite[U];
    If (Result = '') and (D = 8) and (U = 0) then
      Result := 'S';
    Result := Temp + Result;
    C := n mod 10;
    n := n div 10; { Récupère centaine }
    If C > 0 then
    begin
      Temp := '';
      If C > 1 then
        Temp := ' ' + Unite[C] + Temp;
      Temp := Temp + ' ' + Coefs[0];
      If (Result = '') and (C > 1) then
        Result := 'S';
      Result := Temp + Result;
    end;
    If n > 0 then
    begin
      Inc(Coef);
      I := n mod 1000;
      If (I > 1) and (Coef > 1) then
        Result := 'S' + Result;
      If I > 0 then
        Result := ' ' + Coefs[Coef] + Result;
      If (I = 1) and (Coef = 1) then
        Dec(n);
    end;
  until n = 0;
  If Neg then
    Result := 'Moins' + Result
  else
    Result[2] := UpCase(Result[2]);
end;

// ----------------------------------------------------------------------------------
Procedure TotalTTC_en_Lettre;
var
  S,S2, C, D, centimes, Cfa,cfa2: string;
  cent: string[2];
  // car : array [1..3] of string;
  t1,t2,t3 :double;
  I: integer;
begin
  // --------------------
  centimes := '';
  Cfa := '';
  cent := '';
  t1:=round(RechercheDonnees.tr_detailreglementsMT_REGLER.value);
  t2:=round(RechercheDonnees.tr_detailreglementsMT_REGLER.value);
  t3:=round(RechercheDonnees.tr_detailreglementsMT_REGLER.value);

  S := floattostr(t1);
  S2 := floattostr(t2);

  I := 0; // connaitre la position du separateur decimale
  While not((S[I] = ',') or (I > length(S))) do
  begin
    I := I + 1;
  end;
  C := copy(S, I, 1);
  if C = ',' then // s'il y a un nombre decimale
  begin
    D := copy(S, 1, (I - 1));
    Cfa := EnLettres(StrToInt(D));
    cent := copy(S, I + 1, (length(S) - I));
    if length(cent) = 1 then
      cent := cent + '0';
    centimes := ' et' + EnLettres(StrToInt(cent)) + ' Centimes';
  end
  ELSE
  begin
    Cfa := EnLettres(StrToInt(S));
    centimes := ' et' + EnLettres(0) + ' Centimes';
  end;


  // pour les montan san acompte
  I := 0; // connaitre la position du separateur decimale
  While not((S2[I] = ',') or (I > length(S2))) do
  begin
    I := I + 1;
  end;
  C := copy(S2, I, 1);
  if C = ',' then // s'il y a un nombre decimale
  begin
    D := copy(S2, 1, (I - 1));
    Cfa2 := EnLettres(StrToInt(D));
    cent := copy(S2, I + 1, (length(S2) - I));
    if length(cent) = 1 then
      cent := cent + '0';
    centimes := ' et' + EnLettres(StrToInt(cent)) + ' Centimes';
  end
  ELSE
  begin
    Cfa2 := EnLettres(StrToInt(S2));
    centimes := ' et' + EnLettres(0) + ' Centimes';
  end;

  Imp_RecuPrestation.montant_lettre.Lines.clear;
  Imp_RecuPrestation.montant_lettre.Lines.Append(Cfa2 + ' FRANCS CFA');

  Imp_RecuPrestation.montant_lettre1.Lines.clear;
  Imp_RecuPrestation.montant_lettre1.Lines.Append(Cfa2 + ' FRANCS CFA');

  Imp_RecuPrestation.montant_lettre2.Lines.clear;
  Imp_RecuPrestation.montant_lettre2.Lines.Append(Cfa2 + ' FRANCS CFA');
  // ----------------  Imp_VenteExpress
end;

procedure TAddReglement.FormShow(Sender: TObject);

begin

BitBtn1.Visible:=  (RechercheDonnees.tr_saisie_caisseVEROUILLE.Value=false);
MT0.Enabled:= RechercheDonnees.tr_saisie_caisseVEROUILLE.Value=false;
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;



procedure TAddReglement.R2Click(Sender: TObject);
begin
  RechercheDonnees.FacturePatient.FindKey([ RechercheDonnees.TR_DETAILREGLEMENTSCODE.AsInteger ]);
  Close;
   TotalTTC_en_Lettre;
   Imp_RecuPrestation.Refresh;
  Imp_RecuPrestation.Preview;
end;

procedure TAddReglement.BitBtn1Click(Sender: TObject);
VAR
  i, i00:integer;

BEGIN


   TRY

      RechercheDonnees.TR_DETAILREGLEMENTS.APPEND;
      RechercheDonnees.TR_DETAILREGLEMENTSN_LIGNE.VALUE := RechercheDonnees.FacturePatientCODE.VALUE;//i00;
  //    RechercheDonnees.TR_DETAILREGLEMENTSID0.VALUE := i-1;

      RechercheDonnees.TR_DETAILREGLEMENTSCODE.VALUE := RechercheDonnees.FacturePatientCODE.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSNUMSCAISSE.VALUE := RechercheDonnees.CAISSeENCOURSNUMSCAISSE.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSTYPE.VALUE := RechercheDonnees.FacturePatientTYPEFACTURE.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSCODE_CLI.VALUE := RechercheDonnees.FacturePatientCODE_CLI.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSDATEENREG.VALUE := DATE;//RechercheDonnees.FacturePatientDATEENREG.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSMODE_REGLMENT.VALUE := MD0.Text; //RechercheDonnees.FacturePatientMODEDEREGLEMENT.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSDATEPAIE.VALUE := DATE;//RechercheDonnees.T_VENTESDATEENREG.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSMT_REGLER.VALUE := strtofloat(MT0.Text);// RechercheDonnees.FacturePatientMontant_Rest.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSTMACHINE.VALUE := RechercheDonnees.NOMMACHINE;
      RechercheDonnees.TR_DETAILREGLEMENTSNOMUTILISATEUR.VALUE := 'TANO';//RechercheDonnees.FacturePatientNOMUTILISATEUR.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSTDATE.VALUE :=DATE; //RechercheDonnees.T_VENTESDATEENREG.VALUE;
      RechercheDonnees.TR_DETAILREGLEMENTSDATEPAIE.VALUE:=D0.Date;
      RechercheDonnees.TR_DETAILREGLEMENTSVEROUILLE.VALUE :=FALSE;
      RechercheDonnees.TR_DETAILREGLEMENTSTHEUREDEBUT.VALUE := TIME;
      RechercheDonnees.TR_DETAILREGLEMENTSTHEUREFIN.VALUE := TIME;
      RechercheDonnees.TR_DETAILREGLEMENTSMODE_REGLMENT.VALUE := 'ESPECE';
      RechercheDonnees.tr_detailreglementsCODEMODERGLT.VALUE := MD0.TEXT;
      RechercheDonnees.TR_DETAILREGLEMENTSREF.VALUE :=REF0.Text;
      RechercheDonnees.tr_detailreglementsdateprochainPaie.VALUE := Prochainpaie.Date;
      RechercheDonnees.tr_detailreglementslimiteProchainPaie.VALUE := limiteProchainpaie.Date;
    FINALLY
      ClientModule1.VReglementFacture;
      CLOSE;
    END;
   ClientModule1.GETFactureParPatient(RechercheDonnees.TMalades.FieldByName('N_malade').asstring,TYPEFACTURE);

end;

procedure TAddReglement.BitBtn2Click(Sender: TObject);
begin
AddReglement.Close;
end;
end.
