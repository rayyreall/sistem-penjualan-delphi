unit KategoriRepository;

interface

uses DatabaseRepository, KategoriModel, SysUtils, Utils, DB, ADODB, ZConnection, ZDataset;

type
  TKategoriRepository = class
    private
     // database: TDatabaseRepository;
    public
      constructor Create ();
      class function getAll:  TDataSource;
      class procedure Delete(id: String);
      class procedure Insert (model: TKategoriModel);
      class procedure Update (model: TKategoriModel);
      class function searchDataWithID (const id: String): TDataSource;
      class function searchDataWithName (const name: String): TDataSource;
      end;
implementation

constructor TKategoriRepository.Create ();
begin
end;

class function TKategoriRepository.getAll: TDataSource;
var query: TZQuery;
dataSourceKategori: TDataSource ;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;
  query.SQL.Text := 'SELECT * FROM kategori;';
  query.Open;

  dataSourceKategori := TDataSource.Create(nil);
  dataSourceKategori.DataSet := query;

  getAll := dataSourceKategori;
end;

class procedure TKategoriRepository.Delete(id: String);
var query: TZQuery;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;
  query.SQL.Text := 'DELETE FROM kategori WHERE id= :id';
  query.ParamByName('id').AsString := id;
  query.ExecSQL;
end;

class procedure TKategoriRepository.Insert (model: TKategoriModel);
var query: TZQuery;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;
  query.SQL.Text := 'INSERT INTO kategori (name, deskripsi) VALUES (:name, :deskripsi);';
  query.ParamByName('name').AsString := model.getName;
  query.ParamByName('deskripsi').AsString := model.getDeskripsi;
  query.ExecSQL;
end;

class function TKategoriRepository.searchDataWithID (const id: String): TDataSource;
var query : TZQuery;
dataSourceKategori: TDataSource;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;
  query.SQL.Text := 'SELECT * FROM kategori WHERE id= :id';
  query.ParamByName('id').AsString := id;
  query.Open;

  dataSourceKategori := TDataSource.Create(nil);
  dataSourceKategori.DataSet := query;

  searchDataWithID := dataSourceKategori;
end;
class function TKategoriRepository.searchDataWithName (const name: String): TDataSource;
var query : TZQuery;
dataSourceKategori: TDataSource;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;
  query.SQL.Text := 'SELECT * FROM kategori WHERE name LIKE :name';
  query.ParamByName('name').AsString := '%' + name + '%';
  query.Open;

  dataSourceKategori := TDataSource.Create(nil);
  dataSourceKategori.DataSet := query;

  searchDataWithName := dataSourceKategori;
end;

class procedure TKategoriRepository.Update (model: TKategoriModel);
var query: TZQuery;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;
  query.SQL.Text := 'UPDATE kategori SET name=:name, deskripsi=:deskripsi WHERE id=:id';
  query.ParamByName('id').AsString := intToStr(model.getId);
  query.ParamByName('name').AsString := model.getName;
  query.ParamByName('deskripsi').AsString := model.getDeskripsi;
  query.ExecSQL;
end;
end.
