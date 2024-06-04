unit UserRepository;

interface

uses UserModel, ZConnection, DatabaseRepository,  ZDataset, RoleEnum, Utils, DB, ADODB;

type
  TUserRepository = class
   private
     database: TDatabaseRepository;
     user: TUserModel;
     function InitRepository (const UserName, password: string): Boolean;
     function StringToRole (role: string): TRoleEnum;
   public
     constructor Create (const UserName, password: string);
     destructor Destroy; override;
     function getUser: TUserModel;
     procedure InsertQuery (model: TUserModel);
     class function getAllUser: TDataSource;
     class function getUserByFilterName (const keyword: string): TDataSource;
     class function getUserByFilter (const keyword, id: string): TDataSource;
   end;

implementation

uses SysUtils;

constructor TUserRepository.Create (const UserName, password: string);
begin
  InitRepository(UserName, password);
end;

function TUserRepository.StringToRole(role: string): TRoleEnum;
begin
  if UpperCase(role) = 'OWNER' then
    StringToRole := RoleEnum.OWNER
  else if UpperCase(role) = 'ADMIN' then
    StringToRole := RoleEnum.ADMIN
  else
    StringToRole := RoleEnum.KASIR;

end;
function TUserRepository.InitRepository (const UserName, password: string): Boolean;
var query: TZQuery;
begin
     database := TDatabaseRepository.GetInstance;
     query := TZQuery.Create(nil);
     try
       query.Connection := Database.getConnection;
       query.SQL.Text := 'SELECT * FROM user WHERE username = :username AND password = :password;';
       query.ParamByName('username').AsString := UserName;
       query.ParamByName('password').AsString := password;
       query.Open;

       user := TUserModel.Create;
       if not query.isEmpty then
       begin
           user
            .setID(query.FieldByName('id').AsInteger)
            .setUsername(query.FieldByName('username').AsString)
            .setPassword (query.FieldByName('password').AsString)
            .setEmail(query.FieldByName('email').AsString)
            .setFullName(query.FieldByName('full_name').AsString)
            .setRole (StringToRole(query.FieldByName('role').AsString))
            .setNIK(query.FieldByName('nik').AsString)
            .setTelp(query.FieldByName('telp').AsString)
            .setAlamat(query.FieldByName('alamat').AsString)
            .setEmpty(False);
            
           if query.FieldByName('is_active').AsInteger = 1 then
            user.setIsActive(True)
            else
            user.setIsActive(False);
           InitRepository := True;

       end
       else
       begin
         InitRepository := False;
         user.setEmpty(True);
       end;
     finally
       query.Free
     end;
end;

function TUserRepository.getUser: TUserModel;
begin
  getUser := user;
end;

destructor TUserRepository.Destroy;
begin
  inherited Destroy;
end;

procedure TUserRepository.InsertQuery (model: TUserModel);
var query: TZQuery;
begin
   database := TDatabaseRepository.GetInstance;
   query := TZQuery.Create(nil);

   query.Connection := database.getConnection;
   try
     query.SQL.Text := 'INSERT INTO user (username, full_name, email, password, nik, telp, alamat, is_active, role) VALUES (:username, :full_name, :email, :password, :nik, :telp, :alamat,:is_active, :role)';
     query.ParamByName('username').AsString := model.getUsername;
     query.ParamByName('full_name').AsString := model.getFullName;
     query.ParamByName('email').AsString := model.getEmail;
     query.ParamByName('password').AsString := model.getPassword;
     query.ParamByName('nik').AsString := model.getNIK;
     query.ParamByName('telp').AsString := model.getTelp;
     query.ParamByName('alamat').AsString := model.getAlamat;
     query.ParamByName('role').AsString := TUtils.roleToStringFromUser(model.getRole);
     query.ParamByName('is_active').AsBoolean := model.getIsActive;
     query.ExecSQL;
   finally
    // query.Free;
     //database.disconnect;
   end;
end;

class function TUserRepository.getUserByFilter (const keyword, id: string): TDataSource;
var query: TZQuery;
dataSourceUser: TDataSource;
begin
  query := TDatabaseRepository.getQuery;
  query.Close;

  query.SQL.Text := 'SELECT * FROM user WHERE :id LIKE :keyword';
  query.Params.ParamByName('id').AsString := id;
  query.Params.ParamByName('keyword').AsString := '%' + Keyword + '%';
  query.Open;

  dataSourceUser := TDataSource.Create(nil);
  dataSourceUser.DataSet := query;

  getUserByFilter := dataSourceUser;
end;
class function  TUserRepository.getAllUser: TDataSource;
var query: TZQuery;
dataSourceUser: TDataSource ;
begin
  query := TDatabaseRepository.getQuery;
   query.Close;
  query.SQL.Text := 'SELECT * FROM user';
  query.Open;

  dataSourceUser := TDataSource.Create(nil);
  dataSourceUser.DataSet := query;

  getAllUser := dataSourceUser;
end;

class function TUserRepository.getUserByFilterName (const keyword: string): TDataSource;
begin
  getUserByFilterName := getUserByFilter(keyword, 'username');
end;

end.
