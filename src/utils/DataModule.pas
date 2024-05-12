unit DataModule;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDataLib = class(TDataModule)
    conn: TZConnection;
    querySQL: TZQuery;
    dsdata: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataLib: TDataLib;

implementation

{$R *.dfm}

end.
