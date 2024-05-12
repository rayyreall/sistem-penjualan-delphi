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
    function getConnection: TZConnection;

    end;
implementation

var FInstance: TDatabaseRepository = nil;

constructor TDatabaseRepository.Create;
begin
  FConnection := DataLib.conn;
  DataLib.conn.Connected := True;
end;

function  TDatabaseRepository.getConnection: TZConnection;
begin
  getConnection := FConnection;
end;

class function TDatabaseRepository.GetInstance: TDatabaseRepository;
begin
  if FInstance = nil then
    FInstance := TDatabaseRepository.Create;
  GetInstance := FInstance;
end;

destructor TDatabaseRepository.Destroy;
begin
  FConnection.Free;
end;

end.
