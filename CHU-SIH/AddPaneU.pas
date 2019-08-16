unit AddPaneU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,  DBCtrls, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, Datasnap.Provider, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TAddPane = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Label7: TLabel;
    N_Pane: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Date_Pan: TEdit;
    Type_Pan: TEdit;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    N_Appareil: TDBLookupComboBox;
    DataSource3: TDataSource;
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
  AddPane: TAddPane;

implementation

{$R *.dfm}

uses  ClientModuleUnit1, AppareilsU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddPane.FormShow(Sender: TObject);
begin
ClientModule1.ServerBureauEntreeDClient.DonnesDeBase;
with ClientModule1 do begin
Panes.OPEN;

Panes.Last;
if (Panes.FieldValues['N_Pane']<>null)then N_Pane.Text:=inttostr(Panes.FieldValues['N_Pane']+1)else N_Pane.Text:='1';
Date_Pan.Text:=datetostr(now);
//ApareilsOk.SQL.Clear; //Efface le contenu de la stringlist
//ApareilsOk.SQL.Add('SELECT distinct N_Appareil from Appareils WHERE(Appareils.Etat_Apa = "1") ORDER BY N_Appareil');


ApareilsOk.Open; {}//Active la requête
{-------------------------------------------------}//clavier en majuscule
if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}
end;
end;

procedure TAddPane.BitBtn1Click(Sender: TObject);
begin
if(N_Appareil.Text<>'')and(Date_Pan.Text<>'')and(Type_Pan.Text<>'')then begin
 with ClientModule1 do begin
   Panes.APPEND;
                //  Panes.fieldbyName('N_Pane').AsInteger:=StrToInt(N_Pane.Text) ;
                  Panes.fieldbyName('N_Appareil').AsInteger:=StrToInt(N_Appareil.Text) ;
                  Panes.fieldbyName('Date_Pan').asdatetime :=strtodatetime(Date_Pan.Text);
                  Panes.fieldbyName('Type_Pan').AsString:=Type_Pan.Text ;
  Vpanes;
  Apareils.Locate('N_Appareil',N_Appareil.Text, [loCaseInsensitive]);
  Apareils.Edit;
  Apareils.fieldbyName('Etat_Apa').AsString:='0' ;
  VApareils;
  N_Pane.Text :=inttostr(strtoint(N_Pane.Text)+1);
Type_Pan.Clear;
Addpane.Close;
end ;
end
 else showmessage('Les informations que vous avez saisies sont incomplets ou incorrectes .');
end;

procedure TAddPane.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddPane.BitBtn2Click(Sender: TObject);
begin
Addpane.Close;
end;

end.
