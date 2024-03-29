UNIT Achats_U;

INTERFACE

USES
  WINDOWS, MESSAGES, SYSUTILS, CLASSES, GRAPHICS, CONTROLS, FORMS, DIALOGS,
  STDCTRLS, BUTTONS, GRIDS, DBGRIDS, EXTCTRLS, DBCTRLS, COMCTRLS, JVEXCONTROLS,
  JVLABEL, JVEXSTDCTRLS, JVEDIT, JVDBSEARCHEDIT, MASK, JVEXMASK, JVTOOLEDIT,DB,
  JVMASKEDIT, JVDBFINDEDIT, JVDBCONTROLS, JVCHECKEDMASKEDIT, JVDATEPICKEREDIT,
   JVDBGRID, JVDBULTIMGRID,  JVDBGRIDFOOTER, DBGRIDEHGROUPING, TOOLCTRLSEH,
  DBGRIDEHTOOLCTRLS, DYNVARSEH, GRIDSEH,  DBGRIDEH, DBAxisGridsEh,DBGridEhImpExp,
  DataDriverEh,shellapi,  EhLibVCL, Vcl.Menus,  Datasnap.DBClient,
   DBCtrlsEh,   PropFilerEh, PropStorageEh, PrnDbgeh,
  Vcl.AppEvnts, System.ImageList, Vcl.ImgList;

TYPE
  TAchats = CLASS(TFRAME)
    PANEL4: TPANEL;
    STATUSBAR: TSTATUSBAR;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Panel7: TPanel;
    RBSaveAll: TRadioButton;
    RadioButton3: TRadioButton;
    Button5: TButton;
    Button7: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    d1: TDateTimePicker;
    d0: TDateTimePicker;
    Trier: TButton;
    Annuler: TButton;
    DBGridEh8: TDBGridEh;
    Plabel: TPanel;
    l0: TLabel;
    l1: TLabel;
    Panel1: TPanel;
    DBEditEh1: TDBEditEh;
    Button1: TButton;
    PropStorageEh1: TPropStorageEh;
    PrintDBGridEh1: TPrintDBGridEh;
    DBGrid14: TDBGrid;
    ChoixFournisseur: TPopupMenu;
    U1: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    TFacture: TLabel;
    ImageList1: TImageList;
    A1: TMenuItem;
    N1: TMenuItem;
    T1: TMenuItem;
    N2: TMenuItem;
    M1: TMenuItem;
    Splitter1: TSplitter;
    N3: TMenuItem;
    V1: TMenuItem; 
    PROCEDURE CLIENTCHANGE(SENDER: TOBJECT);
    PROCEDURE t1Timer(SENDER: TOBJECT);
    PROCEDURE FORMACTIVATE(SENDER: TOBJECT);
    PROCEDURE REFRESHCLICK(SENDER: TOBJECT);
    PROCEDURE SUPPRIMERCLICK(SENDER: TOBJECT);
    PROCEDURE SPEEDBUTTON5CLICK(SENDER: TOBJECT);
    PROCEDURE STOUTClick(SENDER: TOBJECT);
    PROCEDURE FORMSHOW(SENDER: TOBJECT);
    PROCEDURE DBGRIDEH8DRAWCOLUMNCELL(SENDER: TOBJECT; CONST RECT: TRECT;
      DATACOL: INTEGER; COLUMN: TCOLUMNEH; STATE: TGRIDDRAWSTATE);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TrierClick(Sender: TObject);
    procedure AnnulerClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEditEh1Enter(Sender: TObject);
    procedure DBEditEh1Exit(Sender: TObject);
    procedure DBEditEh1Change(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure DBGrid14CellClick(Column: TColumn);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure A1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);

    { PRIVATE DECLARATIONS }
  PUBLIC
    { PUBLIC DECLARATIONS }
  PUBLIC
    SDEPOT,SDECAISSE:STRING;

    SDEP:integer;

    Libelle, ST01: STRING;


    FRAME:TFRAME;
  //  Libelle: string;
    Numchoix:integer;
        CONSTRUCTOR CREATE(AOWNER: TCOMPONENT); OVERRIDE;
    procedure OUVRETABLE(TT: tclientdataset);
  END;
  var
   Achats:TAchats  ;

IMPLEMENTATION

USES   INIFILES,
          RechercheDonneesU,
          AddFacturationU,
          Assist_AchatsU,
          Sai_AchatBL_U,
          ClientModuleUnit1,
          AddReglementAchatU,
          DossierU, Constantes,
          Sai_Achat_Livraison_U,
          ClientClassesUnit1, AddFournisseursU;

{$R *.DFM}
/// /////////////////////////

 type
  AlternGrid = class(TCustomDBGrideh);


// Parcour la grille et detecte celle qui sont coches
function SelelctionToutGird(Grid: TDBGridEh): Longint;
begin
  Result := 0;
  Grid.SelectedRows.Clear;
  with Grid.DataSource.DataSet do
  begin
    First;
    DisableControls;
    try
      while not EOF do
      begin
        Grid.SelectedRows.CurrentRowSelected := True;
        Inc(Result);
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;
procedure TAchats.OUVRETABLE(TT: tclientdataset);
begin
//
if TT.Active <> true then
  TT.Open;
end;


FUNCTION TIMEBOOT: TTIME;
BEGIN
  RESULT := NOW - (GETTICKCOUNT / 1000) / (24 * 3600);
END;

FUNCTION DATEBOOT: TDATETIME;
BEGIN
  RESULT := NOW - (GETTICKCOUNT / 1000) / (24 * 3600);
END;
/// //////////////////////////////////

procedure TAchats.N1Click(Sender: TObject);
VAR
  I1: INTEGER;
  id:integer;
begin
  TRY
    id:=ClientModule1.ID_T_ACHAT+1;
   ClientModule1.GetFactureAchatsFournisseur('0',TYPEFACTURE);
    FINALLY

    ClientModule1.GetRechercheProduitsDuServiceAFacturer(ClientModule1.ServiceEnCours.FieldByName('n_service').AsString);
     if clientmodule1.ProduitsAFacturer.IsEmpty then
     raise exception.Create('Pas d''article enregistré');

    if TYPEFACTURE <>'LIVRAISON' then
    begin
        ClientModule1.GetFactureAchatsFournisseur('0',TYPEFACTURE);
        RechercheDonnees.T_ACHATS.APPEND;
        Sai_ACHATBL.show ;
    end
    else
    begin
        ClientModule1.GetFactureLivraisonFournisseur('0',TYPEFACTURE);
        RechercheDonnees.T_ACHATS.APPEND;
        Sai_ACHAT_Livraison.show
    end;

  END;
end;

procedure TAchats.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
MenuItem8.Visible:= (DBgridEh8.SelectedRows.CurrentRowSelected = True) and( not RechercheDonnees.AchatsFournisseurTRANSFERE.Value);
MenuItem2.Visible:=  DBgridEh8.SelectedRows.CurrentRowSelected = True;
MenuItem1.Visible:=  NOT DBgridEh8.SelectedRows.CurrentRowSelected = True;
MenuItem4.Visible:= (DBgridEh8.SelectedRows.CurrentRowSelected = True) and( RechercheDonnees.AchatsFournisseurTYPEFACTURE.Value = 'AVOIR')and( RechercheDonnees.AchatsFournisseurTYPEFACTURE.Value = 'FACTURE') ;
RechercheDonnees.T_Achats.ReadOnly:=//(RechercheDonnees.AchatsFournisseurTRANSFERE.Value) or
                                   (RechercheDonnees.T_AchatsINVENTORIES.Value);
                                  // OR (RechercheDonnees.L_Achats.State = dsEdit) ;
 A1.Visible:=  (DBgridEh8.SelectedRows.CurrentRowSelected = True) and  (RechercheDonnees.AchatsFournisseurINVENTORIES.Value);
V1.Visible:=  (DBgridEh8.SelectedRows.CurrentRowSelected = True) AND (RechercheDonnees.AchatsFournisseurTRANSFERE.Value);

end;

procedure TAchats.Button1Click(Sender: TObject);
begin
 if Button1.Caption = 'Filtre' then
  begin
    DBGridEh8.SearchPanel.ApplySearchFilter;
    Button1.Caption := 'Annule';
  end else
  begin
    DBGridEh8.SearchPanel.CancelSearchFilter;
    Button1.Caption := 'Filtre';
    DBEditEh1.Text := '';
  end;

end;

procedure TAchats.Button5Click(Sender: TObject);
begin
  SaveDialog1.Filter := 'Text file|*.rtf';
  SaveDialog1.DefaultExt := 'rtf';

  if SaveDialog1.Execute then
    begin
      SaveDBGridEhToExportFile(TDBGridEhExportAsRTF, DBGridEh8, SaveDialog1.FileName, RBSaveAll.Checked);

      if MessageDlg('File is saved.'#13'Do you want to open file "' + SaveDialog1.FileName + '" ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then
        ShellExecute(Handle, nil, PChar(SaveDialog1.FileName), nil, nil, SW_SHOWNORMAL);
    end;

end;

procedure TAchats.Button7Click(Sender: TObject);
begin
  SaveDialog1.Filter := 'Text file|*.xls';
  SaveDialog1.DefaultExt := 'xls';

  if SaveDialog1.Execute then
    begin
      SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS, DBGridEh8, SaveDialog1.FileName, RBSaveAll.Checked);

      if MessageDlg('File is saved.'#13'Do you want to open file "' + SaveDialog1.FileName + '" ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then
        ShellExecute(Handle, nil, PChar(SaveDialog1.FileName), nil, nil, SW_SHOWNORMAL);
    end;

end;

procedure TAchats.C1Click(Sender: TObject);
begin
 Try
   ClientModule1.Valide_Livraison_Achats(RechercheDonnees.AchatsFournisseurCOde.asstring,RechercheDonnees.AchatsFournisseurTYPEFACTURE.Value)
 Finally
   Showmessage('LIVRAISON REALISEE AVEC SUCCES');
   ClientModule1.GETFactureParPatientNonSolde(RechercheDonnees.TMalades.FieldByName('N_malade').asstring,TYPEFACTURE);

 End;
end;

PROCEDURE TAchats.CLIENTCHANGE(SENDER: TOBJECT);
VAR
  CH: STRING;
  I1: INTEGER;
BEGIN
END;

CONSTRUCTOR TAchats.CREATE(AOWNER: TCOMPONENT);
var
settingsIni:TIniFile;
sVal:string;
sv0: boolean;
si:integer;
begin
  INHERITED CREATE(AOWNER);
  ALIGN:=ALCLIENT;

  settingsIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'comport.ini');
try
  si:= settingsIni.Readinteger('SERVEUR-TANAUD','TPOLICE',0);
  sVal:= settingsIni.ReadString('SERVEUR-TANAUD','POLICE','');
  DBGridEh8.TitleFont.Size:=si;
  DBGridEh8.TitleFont.Name:=sVal;

 finally
  settingsIni.Free;
end;
  //T1.Enabled:=true;
END;

procedure TAchats.R1Click(Sender: TObject);
begin
 TRY
     AddReglementAchat.MT0.Text:='0';
   //  AddReglement.D0.Text:='';
     AddReglementAchat.DOS0.Text:='';
     ClientModule1.GetRecherchesReglementParFournisseur(RechercheDonnees.AchatsFournisseur.FieldByName('Code').asstring);

 FINALLY
  //   RechercheDonnees.CAISSENCOURS.Open;
     AddReglementAchat.N_frn.Text:=RechercheDonnees.AchatsFournisseur.FieldByName('Code_frn').asstring;
     AddReglementAchat.NomFrn.Text:=clientmodule1.Fournisseurs.FieldByName('Raison').asstring;
     AddReglementAchat.MT0.Text:=RechercheDonnees.FacturePatientMontant_Rest.asstring;
     AddReglementAchat.DOS0.Text:=RechercheDonnees.FacturePatientCODE.ASSTRING;
     AddReglementAchat.NumDos.Text:=RechercheDonnees.FacturePatientREFVENTE.ASSTRING;

    AddReglementAchat.SHOW;
 END;

end;

PROCEDURE TAchats.REFRESHCLICK(SENDER: TOBJECT);
BEGIN
  RechercheDonnees.AchatsFournisseur.CLOSE;
  RechercheDonnees.AchatsFournisseur.OPEN;
END;


PROCEDURE TAchats.SPEEDBUTTON5CLICK(SENDER: TOBJECT);
BEGIN
// tano

   TRY
    RechercheDonnees.AchatsFournisseur.CLOSE;
  FINALLY
    RechercheDonnees.AchatsFournisseur.OPEN;
  END;

END;

PROCEDURE TAchats.STOUTClick(SENDER: TOBJECT);
  VAR
    I,K : INTEGER;
    N_FACT, NUM_BORD, S  : STRING;
BEGIN
  IF DIALOGS.MESSAGEDLG('CONFIRMER LA SUPPRESSION DES FACTURES SELECTIONERS ?',
    MTCONFIRMATION, [MBABORT, MBYES], 0, MBYES) = MRYES THEN
  BEGIN
  END;
END;

PROCEDURE TAchats.SUPPRIMERCLICK(SENDER: TOBJECT);
  BEGIN
  if MessageDlg('Attention, La suppression est definitive!!!! Annuler l''operation ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mryes then
      MessageDlg('Supprimer annulee !!!.', mtInformation,
      [mbOk], 0, mbOk)
      else
   begin
    TRY
    // Enregistrement des donnees
    FINALLY
      SHOWMESSAGE('L''enbregistrement a eteefface avec succes');
    END;
   end;

END;

procedure TAchats.T1Click(Sender: TObject);
begin
SelelctionToutGird(Achats.DBGridEh8);
end;

PROCEDURE TAchats.T1TIMER(SENDER: TOBJECT);
VAR
  TOTALERG, SURERG: INTEGER;
BEGIN
END;

procedure TAchats.TrierClick(Sender: TObject);
begin
  RechercheDonnees.AchatsFournisseur.FILTERed:=FALSE;

  RechercheDonnees.AchatsFournisseur.FILTER := '(DATEENREG >=''' + DATETOSTR(D0.Date) +
    ''')AND (DATEENREG <=''' + DATETOSTR(D1.Date) + ''')';
  RechercheDonnees.AchatsFournisseur.FILTERED := TRUE;

end;

procedure TAchats.F1Click(Sender: TObject);
begin
 Try
   ClientModule1.Valide_Proforma_Facture(RechercheDonnees.FacturePatientCOde.asstring,RechercheDonnees.FacturePatientTYPEFACTURE.Value)
 Finally
   Showmessage('Proforma converti en facture avec success');
 End;

end;

PROCEDURE TAchats.FORMACTIVATE(SENDER: TOBJECT);
BEGIN
//  CLIENTCHANGE(SENDER);
END;

PROCEDURE TAchats.FORMSHOW(SENDER: TOBJECT);
BEGIN
//  MENUCLIENT.HIDE;
END;

procedure TAchats.DBEditEh1Change(Sender: TObject);
begin
TRY  DBGridEh8.SearchPanel.SearchingText := DBEditEh1.Text;
  DBGridEh8.SearchPanel.RestartFind;
FINALLY
  DBGridEh8.SearchPanel.ApplySearchFilter;
END;

end;

procedure TAchats.DBEditEh1Enter(Sender: TObject);
begin
 DBGridEh8.SearchPanel.Active := True;
end;

procedure TAchats.DBEditEh1Exit(Sender: TObject);
begin
 DBGridEh8.SearchPanel.Active := False;
end;

procedure TAchats.DBGrid14CellClick(Column: TColumn);
begin
  ClientModule1.GETAchatsParFournisseur(ClientModule1.ServiceEnCours.FieldByName('n_service').AsString,  ClientModule1.fournisseurs.FieldByName('code_frn').AsString,TYPEFACTURE); //
end;

PROCEDURE TAchats.DBGRIDEH8DRAWCOLUMNCELL(SENDER: TOBJECT; CONST RECT: TRECT;
  DATACOL: INTEGER; COLUMN: TCOLUMNEH; STATE: TGRIDDRAWSTATE);
BEGIN
    with AlternGrid(Sender) do begin
     if (RechercheDonnees.AchatsFournisseurINVENTORIES.Value =true)  then
      DBGridEh8.Canvas.Font.Color := clgray else
     if (RechercheDonnees.AchatsFournisseurTRANSFERE.Value =true)  then
      DBGridEh8.Canvas.Font.Color := clLime
     else
       DBGridEh8.Canvas.Font.Color := clblack;
     DBGridEh8.DefaultDrawColumnCell(Rect, DataCol, Column, State);

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
END;




procedure TAchats.A1Click(Sender: TObject);
var
i:Byte;
a0:Integer;

begin
   with DBGridEh8.DataSource.DataSet do
  begin
    First;
    DisableControls;
    try
      while not EOF do
      begin
       if  DBGridEh8.SelectedRows.CurrentRowSelected = True then
        i:=ClientModule1.ARCHIVEACHATS(RechercheDonnees.AchatsFournisseur.FieldByName('CODE').asstring,TYPEFACTURE);
        Inc(i);
        Next;
      end;
    finally
      EnableControls;
    end;
  end;


  if i >= 1 then
   showmessage('Archivage realise avec succes')
 else
  showmessage('Echec veuillez bien verifier vos donnees');
  ClientModule1.GETAchatsParFournisseur(ClientModule1.ServiceEnCours.FieldByName('n_service').AsString,  ClientModule1.fournisseurs.FieldByName('code_frn').AsString,TYPEFACTURE); //
end;

procedure TAchats.AnnulerClick(Sender: TObject);
begin
  RechercheDonnees.FacturePatient.FILTERed:=FALSE;
end;

procedure TAchats.E1Click(Sender: TObject);
begin
  TRY

    ClientModule1.GetRechercheProduitsDuServiceAFacturer(ClientModule1.ServiceEnCours.FieldByName('n_service').AsString);
    if RechercheDonnees.T_AchatsTYPEFACTURE.AsString<>'LIVRAISON' then
      begin
       if  RechercheDonnees.AchatsFournisseurINVENTORIES.Value =true  then
       begin
         mjLockForm(Sai_ACHAT_Livraison.panel1);
         mjLockForm(Sai_ACHAT_Livraison.panel3);
       end
       else
         begin
          mjunLockForm(Sai_ACHAT_Livraison.panel1);
          mjunLockForm(Sai_ACHAT_Livraison.panel3);
         end;
       ClientModule1.GetFactureAchatsFournisseur(RechercheDonnees.AchatsFournisseur.FieldByName('CODE').asstring,TYPEFACTURE);
       RechercheDonnees.AchatsFournisseur.EDIT;
       Sai_ACHATBL.show  ;
      end
    else
     begin
       if  RechercheDonnees.AchatsFournisseurINVENTORIES.Value =true  then
       begin
         mjLockForm(Sai_ACHAT_Livraison.panel1);
         mjLockForm(Sai_ACHAT_Livraison.panel3);
       end
       else
         begin
          mjunLockForm(Sai_ACHAT_Livraison.panel1);
          mjunLockForm(Sai_ACHAT_Livraison.panel3);
         end;
       ClientModule1.GetFactureLivraisonFournisseur(RechercheDonnees.AchatsFournisseur.FieldByName('CODE').asstring,TYPEFACTURE);
       RechercheDonnees.AchatsFournisseur.EDIT;
       Sai_ACHAT_Livraison.show
     end;
  FINALLY
  END;
end;

procedure TAchats.I1Click(Sender: TObject);
begin
    PrintDBGridEh1.DBGridEh := DBGridEh8;
    PrintDBGridEh1.SetSubstitutes(['%[Today]',DateToStr(Now)]);
    PrintDBGridEh1.Preview;

end;

procedure TAchats.M1Click(Sender: TObject);
begin
  AddFournisseurs.show;
end;

END.

