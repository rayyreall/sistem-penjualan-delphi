unit KategoriViews;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ZDataset, DB, ADODB;

type
  TKategoriView = class(TForm)
    edtName: TEdit;
    lblName: TLabel;
    edtDeskripsi: TEdit;
    lblDeskripsi: TLabel;
    dbgrdKategori: TDBGrid;
    lblMasukkanName: TLabel;
    edtMasukkanName: TEdit;
    btnCari: TButton;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnKembali: TButton;
    procedure mShow(Sender: TObject);
    procedure formattedDBGRID;
    procedure btnKembaliClick(Sender: TObject);
    procedure dbgrdKategoriCellClick(Column: TColumn);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
  private
    idLastClick: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KategoriView: TKategoriView;

implementation

uses KategoriRepository, DashboardView, KategoriService;

{$R *.dfm}

procedure TKategoriView.formattedDBGRID;
begin
   dbgrdKategori.Columns[0].Width := 30;  // id
   dbgrdKategori.Columns[1].Width := 150; // name
   dbgrdKategori.Columns[2].Width := 240;  // Deskripsi
end;

procedure TKategoriView.mShow(Sender: TObject);
begin
  idLastClick := -1;
  btnDelete.Enabled := False;
  btnUpdate.Enabled := False;
  
  dbgrdKategori.DataSource :=  TKategoriRepository.getAll;
  formattedDBGRID;
end;

procedure TKategoriView.btnKembaliClick(Sender: TObject);
var dashboardView: TDashboardViews;
begin
  dashboardView := TDashboardViews.Create(Application);
  Hide;
  dashboardView.ShowModal;
  Close;
end;

procedure TKategoriView.dbgrdKategoriCellClick(Column: TColumn);
begin
  idLastClick := dbgrdKategori.DataSource.DataSet.FieldByName('id').AsInteger;
  btnDelete.Enabled := True;
  btnUpdate.Enabled := True;

  edtName.Text := dbgrdKategori.DataSource.DataSet.FieldByName('name').AsString;
  edtDeskripsi.Text :=  dbgrdKategori.DataSource.DataSet.FieldByName('deskripsi').AsString;
end;

procedure TKategoriView.btnDeleteClick(Sender: TObject);
begin
  TKategoriRepository.Delete(IntToStr(idLastClick));
  idLastClick := -1;
  btnDelete.Enabled := False;
  btnUpdate.Enabled := False;
  
  dbgrdKategori.DataSource :=  TKategoriRepository.getAll;
  formattedDBGRID;
end;

procedure TKategoriView.btnInsertClick(Sender: TObject);
var service: TKategoriService;
begin
  service := TKategoriService.Create;
  service.insertData(edtName.Text, edtDeskripsi.Text);
  btnDelete.Enabled := False;
  btnUpdate.Enabled := False;

  dbgrdKategori.DataSource :=  TKategoriRepository.getAll;
  formattedDBGRID;
  edtName.Text := '';
  edtDeskripsi.Text := '';
end;

procedure TKategoriView.btnUpdateClick(Sender: TObject);
var service: TKategoriService;
begin
  service := TKategoriService.Create;
  service.updateData(idLastClick, edtName.Text, edtDeskripsi.Text);
  btnDelete.Enabled := False;
  btnUpdate.Enabled := False;

  dbgrdKategori.DataSource :=  TKategoriRepository.getAll;
  formattedDBGRID;
  edtName.Text := '';
  edtDeskripsi.Text := '';
end;

procedure TKategoriView.btnCariClick(Sender: TObject);
begin
  if edtMasukkanName.Text = '' then
  begin
    dbgrdKategori.DataSource :=  TKategoriRepository.getAll;
    formattedDBGRID;
  end
  else
  begin
    dbgrdKategori.DataSource := TKategoriRepository.searchDataWithName(edtMasukkanName.Text);
    formattedDBGRID;
  end;
end;

end.
