unit AddExamenComplementU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, EhLibVCL, SkinCtrls, spdbctrls;

type
  TAddExamenComplement = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Image2: TImage;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Pnom_Contact: TDBEditEh;
    Label1: TLabel;
    Label4: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBNavigator2: TDBNavigator;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemoEh1: TDBMemoEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    odBlob: TOpenDialog;
    sdBlob: TSaveDialog;
    DBImageEh1: TDBImageEh;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AddExamenComplement: TAddExamenComplement;

implementation

{$R *.dfm}

uses Sourcedb, ClientClassesUnit1, ClientModuleUnit1, DossierU,
  RechercheDonneesU;
type
  AlternGrid = class(TCustomDBGrid);
procedure TAddExamenComplement.FormShow(Sender: TObject);
begin

{-------------------------------------------------}//clavier en majuscule
  if GetKeyState(VK_CAPITAL) =0 then begin
                                   keybd_event(VK_CAPITAL,0,1,0); //touche enfoncé
                                   keybd_event(VK_CAPITAL,0,2,0); //touche relevé
                                   end;
{-------------------------------------------------}

end;

procedure TAddExamenComplement.BitBtn1Click(Sender: TObject);
var
  FileStream: TFileStream;
  BlobStream: TStream;
begin
 if (odBlob.Execute) then
   begin
     RechercheDonnees.examcomplem.Edit;
     try
       BlobStream :=RechercheDonnees.examcomplem.CreateBlobStream(RechercheDonnees.examcomplem.FieldByName('Venue_Map'),bmWrite);
       FileStream := TFileStream.Create(odBlob.FileName,fmOpenRead or fmShareDenyNone);
       BlobStream.CopyFrom(FileStream,FileStream.Size);
       FileStream.Free;
       BlobStream.Free;
      // tVenues.Post;
     except
       RechercheDonnees.examcomplem.Cancel;
       raise;
     end;
   end;

end;

procedure TAddExamenComplement.BitBtn2Click(Sender: TObject);
var
  FileStream: TFileStream;
  BlobStream: TStream;
begin
  if (sdBlob.Execute) then
    begin
      FileStream := TFileStream.Create(sdBlob.FileName,fmCreate);
      BlobStream := RechercheDonnees.examcomplem.CreateBlobStream(RechercheDonnees.examcomplem.FieldByName('Venue_Map'),bmRead);
      FileStream.CopyFrom(BlobStream,BlobStream.Size);
      BlobStream.Free;
      FileStream.Free;
    end;
end;



procedure TAddExamenComplement.BitBtn3Click(Sender: TObject);
begin
  with ClientModule1 do
      VExamenCompl;
   Close;

end;

procedure TAddExamenComplement.ComboBox1Change(Sender: TObject);
begin
//
end;

procedure TAddExamenComplement.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAddExamenComplement.Edit1Change(Sender: TObject);
begin
   //
   // ClientModule1.Medecins.locate('NOM_med',edit1.Text,[lopartialkey])
end;

end.
