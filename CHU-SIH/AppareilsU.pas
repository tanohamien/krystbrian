unit AppareilsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TabNotBk, Grids, DBGrids, DB,
  ExtCtrls, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TAppareils = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    DBGrid1: TDBGrid;
    Services_s: TDataSource;
    ApperelsA: TDataSource;
    Bevel3: TBevel;
    Bevel1: TBevel;
    DBGrid4: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid5: TDBGrid;
    Bevel5: TBevel;
    App_s: TDataSource;
    ApperelsP_s: TDataSource;
    Bevel13: TBevel;
    Panes_s: TDataSource;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid3: TDBGrid;
    DBGrid6: TDBGrid;
    Bevel6: TBevel;
    Label3: TLabel;
    DBGrid7: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Image1: TImage;
    Label31: TLabel;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure FormResize(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Appareils: TAppareils;

implementation

uses   MenuAdmissionU, Unit28, AddPaneU, AddReparationU,
  ClientModuleUnit1,  StockMedicamentU;

{$R *.dfm}
type
  AlternGrid = class(TCustomDBGrid);
procedure TAppareils.FormShow(Sender: TObject);
begin
//
//ClientModule1.GetRechercheServices_App;
//StockMedicament.Services_app.Open; //Active la requête


TabbedNotebook1.Left:=Round(Appareils.Width div 2) - Round(TabbedNotebook1.Width div 2)-4 ;
TabbedNotebook1.Top:=Round(Appareils.Height div 2)- Round(TabbedNotebook1.Height div 2)+33;
Image1.Top  := TabbedNotebook1.Top - image1.Height - 10;
Image1.Left := TabbedNotebook1.Left -5;
Image2.Top  := Image1.Top + 5;
Image2.Left := Image1.Left +Image1.Width -50;
Bevel13.Left := Image1.Left;
Bevel13.Top  := Image1.Top;
Label31.Left:= Image1.Left +10;
Label31.Top := Image1.Top +10;
{}
end;

procedure TAppareils.DBGrid4CellClick(Column: TColumn);
begin
if(Dbgrid4.SelectedField.DisplayText<>'')then begin

                                               ClientModule1.GetRecherchesApperelsA_App(Dbgrid4.SelectedField.DisplayText);
                                               StockMedicament. ApperelsA_app.Open; {}//Active la requête
                                              BitBtn1.Enabled:=true;
                                              end;
end;

procedure TAppareils.DBGrid5CellClick(Column: TColumn);
begin
if(Dbgrid5.SelectedField.DisplayText<>'')then begin
                                               ClientModule1.GetRecherchesApperelsP_App(Dbgrid5.SelectedField.DisplayText);
                                               StockMedicament. ApperelsP_app.Open; {}//Active la requête
                                              BitBtn2.Enabled:=true;
                                              end;
end; 
procedure TAppareils.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure TAppareils.FormResize(Sender: TObject);
begin
TabbedNotebook1.Left:=Round(Appareils.Width div 2) - Round(TabbedNotebook1.Width div 2)-4 ;
TabbedNotebook1.Top:=Round(Appareils.Height div 2) - Round(TabbedNotebook1.Height div 2)+33;
Image1.Top  := TabbedNotebook1.Top - image1.Height - 10;
Image1.Left := TabbedNotebook1.Left -5;
Image2.Top  := Image1.Top + 5;
Image2.Left := Image1.Left +Image1.Width -50;
Bevel13.Left := Image1.Left;
Bevel13.Top  := Image1.Top;
Label31.Left:= Image1.Left +10;
Label31.Top := Image1.Top +10;

end;

procedure TAppareils.DBGrid3CellClick(Column: TColumn);
begin
if(Dbgrid4.SelectedField.DisplayText<>'')then begin

                                               ClientModule1.GetRecherchesApp_App(Dbgrid5.SelectedField.DisplayText);
                                               StockMedicament. App_app.Open; {}//Active la requête

                                              end;
end;

procedure TAppareils.DBGrid6CellClick(Column: TColumn);
begin
if(Dbgrid6.SelectedField.DisplayText<>'')then begin
                                               ClientModule1.GetRecherchesPanes_App(Dbgrid6.SelectedField.DisplayText);
                                               StockMedicament.Panes_app.Open; {}//Active la requête

                                              end;
end;

procedure TAppareils.BitBtn1Click(Sender: TObject);
begin
Form28.QuickRep8.Preview;
end;

procedure TAppareils.BitBtn2Click(Sender: TObject);
begin
Form28.QuickRep9.Preview;
end;

procedure TAppareils.DBGrid4DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid5DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid6DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid7DrawColumnCell(Sender: TObject;
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

procedure TAppareils.DBGrid4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.DBGrid5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.DBGrid2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.DBGrid3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.DBGrid6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.DBGrid7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='';
end;

procedure TAppareils.BitBtn1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='Imprimer la liste des appareils actif pour le service sélectionné .';
end;

procedure TAppareils.BitBtn2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
chu.StatusBar.SimpleText:='Imprimer la liste des appareils en panes pour le service sélectionné .';
end;

procedure TAppareils.BitBtn4Click(Sender: TObject);
begin
AddReparation.show;
end;

procedure TAppareils.BitBtn3Click(Sender: TObject);
begin
AddPane.show;
end;

end.
