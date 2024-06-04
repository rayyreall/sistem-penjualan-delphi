unit KategoriModel;

interface

type
  TKategoriModel = class
  private
    FId: Integer;
    FName: String;
    FDeskripsi: String;
    FEmptyModel: Boolean;
  public
    constructor Create ();

    function getId: Integer;
    function setId(value: Integer): TKategoriModel;

    function getName: String;
    function setName(value: String): TKategoriModel;

    function getDeskripsi: String;
    function setDeskripsi(value: String): TKategoriModel;

    function getIsEmpty: Boolean;
    function setEmpty (Value: Boolean) : TKategoriModel;
    end;


implementation

constructor TKategoriModel.Create ();
begin
  FEmptyModel := True;
end;

function TKategoriModel.getId;
begin
  getId := FId;
end;

function TKategoriModel.setId(value: Integer): TKategoriModel;
begin
  FId := value;
  setId := Self;
end;

function TKategoriModel.getName: String;
begin
  getName := FName;
end;

function TKategoriModel.setName(value: String): TKategoriModel;
begin
  FName := value;
  setName := Self;
end;

function TKategoriModel.getDeskripsi: String;
begin
  getDeskripsi := FDeskripsi;
end;

function TKategoriModel.setDeskripsi(value: String): TKategoriModel;
begin
  FDeskripsi := value;
  setDeskripsi := Self;
end;

function TKategoriModel.getIsEmpty: Boolean;
begin
  getIsEmpty := FEmptyModel;
end;
function TKategoriModel.setEmpty (Value: Boolean) : TKategoriModel;
begin
  FEmptyModel :=  Value;
  setEmpty := Self;
end;

end.
