unit DatabaseRepository;

interface

uses ZConnection, ZDataset, SysUtils, DataModule;

type
  TDatabaseRepository = class
  private
    FConnection: TZConnection;
    constructor Create;
  public
    destructor Destroy; override;
    class function GetInstance: TDatabaseRepository;
    class function getQuery: TZQuery;
    class procedure closeQuery;
    function getConnection: TZConnection;
    procedure disconnect;

    end;
implementation

var FInstance: TDatabaseRepository = nil;
  query: TZQuery = nil;

constructor TDatabaseRepository.Create;
begin
  FConnection := DataLib.conn;
  DataLib.conn.Connected := True;
end;

function  TDatabaseRepository.getConnection: TZConnection;
begin
  if not FConnection.Connected then
    FConnection.Connect;
  getConnection := FConnection;
end;
procedure TDatabaseRepository.disconnect;
begin
  FConnection.Disconnect;
end;

class function TDatabaseRepository.GetInstance: TDatabaseRepository;
begin
  if FInstance = nil then
    FInstance := TDatabaseRepository.Create;
  if not FInstance.getConnection.Connected then
    Finstance.getConnection.Connect;
  GetInstance := FInstance;
end;

class function TDatabaseRepository.getQuery: TZQuery;
var database: TDatabaseRepository;
begin
  if query = nil then
  begin
    database := GetInstance;
    query := TZQuery.Create(nil);
    query.Connection := database.getConnection;
  end;
  getQuery := query;
end;
class procedure TDatabaseRepository.closeQuery;
begin
  if not(query = nil) then
  begin
    query.Close;
    query := nil;
  end;
end;

destructor TDatabaseRepository.Destroy;
begin
  FConnection.Free;
end;

end.
