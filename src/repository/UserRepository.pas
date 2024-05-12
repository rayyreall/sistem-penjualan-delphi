unit UserRepository;

interface

uses UserModel, ZConnection, DatabaseRepository,  ZDataset, RoleEnum;

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
     database := TDatabaseRepository.GetInstance();
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

end.
