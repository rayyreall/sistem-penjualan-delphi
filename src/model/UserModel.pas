unit UserModel;


interface

uses RoleEnum;

type
  TUserModel = class
  private
    FId: Integer;
    FUsername: string;
    FFullName: string;
    FEmail: string;
    FPassword: string;
    FRole: TRoleEnum;
    FNik: string;
    FTelp: string;
    FAlamat: string;
    FIsActive: Boolean;
    FCreated_at: TDateTime;
    FUpdate_at: TDateTime;
    FEmptyModel: Boolean;
  public
    constructor Create ();
    function getId: Integer;
    function setID(value: Integer): TUserModel;

    function getUsername: string;
    function setUsername(value: string): TUserModel;

    function getFullName: string;
    function setFullName(Value: string): TUserModel;

    function getEmail: string;
    function setEmail(value: string): TUserModel;

    function getPassword: string;
    function setPassword(value: string): TUserModel;

    function getRole: TRoleEnum;
    function setRole(value: TRoleEnum): TUserModel;

    function getNIK: string;
    function setNIK(value: string): TUserModel;

    function getTelp: string;
    function setTelp(value: string): TUserModel;

    function getAlamat: string;
    function setAlamat(value: string): TUserModel;

    function getIsActive: Boolean;
    function setIsActive (value: Boolean): TUserModel;

    function  getCreatedAt: TDateTime;
    function setCreatedAt(value: TDateTime): TUserModel;

    function getUpdateAt: TDateTime;
    function setUpdateAt(value: TDateTime): TUserModel;

    function getIsEmpty: Boolean;
    function setEmpty (Value: Boolean) : TUserModel;
    end;

implementation

uses Classes;

constructor TUserModel.Create ();
begin
  FEmptyModel := True;
end;

function TUserModel.getID: Integer;
begin
  getId := FId;
end;
function TUserModel.setID(Value: Integer): TUserModel;
begin
  FId := Value;
  setID := Self;
end;

function TUserModel.getUsername: string;
begin
    getUsername := FUsername;
end;
function TUserModel.setUsername(Value: string): TUserModel;
begin
  FUsername := Value;
  setUserName := Self;
end;

function TUserModel.getFullName: string;
begin
  getFullName := FFullName;
end;
function TUserModel.setFullName(Value: string): TUserModel;
begin
  FFullName := Value;
  setFullName := Self;
end;

function TUserModel.getEmail: string;
begin
  getEmail := FEmail;
end;
function TUserModel.setEmail(Value: string): TUserModel;
begin
  Femail := Value;
  setEmail := Self;
end;

function TUserModel.getPassword: string;
begin
  getPassword := FPassword;
end;
function TUserModel.setPassword(Value: string): TUserModel;
begin
  FPassword := value;
  setPassword := Self;
end;

function TUserModel.getRole: TRoleEnum;
begin
  getRole := FRole;
end;
function TUserModel.setRole(Value: TRoleEnum): TUserModel;
begin
  FRole := value;
  setRole := Self;
end;

function TUserModel.getNIK: string;
begin
  getNIK := FNik;
end;
function TUserModel.setNIK(Value: string): TUserModel;
begin
  FNik := Value;
  setNIK := Self;
end;

function TUserModel.getTelp: string;
begin
  getTelp := FTelp;
end;
function TuserModel.setTelp(Value: string): TUserModel;
begin
  FTelp := Value;
  setTelp := Self;
end;

function TUserModel.getAlamat: string;
begin
  getAlamat := FAlamat;
end;
function TUserModel.setAlamat(Value: string): TUserModel;
begin
  FAlamat := value;
  setAlamat := Self;
end;

function TUserModel.getIsActive: Boolean;
begin
  getIsActive :=  FIsActive;
end;
function TUserModel.setIsActive(Value: Boolean): TUserModel;
begin
  FIsActive := value;
  setIsActive := Self;
end;

function TUserModel.getCreatedAt: TDateTime;
begin
  getCreatedAt := FCreated_at;
end;
function TUserModel.setCreatedAt(Value: TDateTime): TUserModel;
begin
  FCreated_at :=  Value;
  setCreatedAt := Self;
end;

function TUserModel.getUpdateAt: TDateTime;
begin
  getUpdateAt := FUpdate_at;
end;
function TUserModel.setUpdateAt(Value: TDateTIme): TUserModel;
begin
  FUpdate_at := value;
  setUpdateAt := Self;
end;

function TUserModel.getIsEmpty: Boolean;
begin
  getIsEmpty := FEmptyModel;
end;
function TUserModel.setEmpty (Value: Boolean) : TUserModel;
begin
  FEmptyModel :=  Value;
  setEmpty := Self;
end;
end.
