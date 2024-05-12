unit LoginService;

interface

uses UserModel, UserRepository;

type
  TLoginService = class
  private
    FUser: TUserModel;
    FUserRepository: TUserRepository;

  public
    constructor Create;
    destructor Destroy; override;
    procedure InitAccountUser(const username, password: string);
    procedure clearService;
    function getUser (): TUserModel;
    function isAccountValidate: Boolean;
  end;

implementation

constructor TLoginService.Create;
begin

end;

destructor TLoginService.Destroy;
begin
  FUserRepository.Free;
  inherited Destroy;
end;

function TLoginService.getUser: TUserModel;
begin
  getUser := FUser;
end;
procedure TLoginService.clearService;
begin
  FUser.Free;
  FUserRepository.Free;
end;

procedure TLoginService.InitAccountUser(const UserName, password: string);
var repository: TUserRepository;
begin
  repository := TUserRepository.Create(UserName, password);
  FUser := repository.getUser;
end;


function TLoginService.isAccountValidate: Boolean;
begin
  if not (Fuser.getIsEmpty()) then
  begin
    FUser.setEmpty(False);
    isAccountValidate := True;
  end
  else
  begin
    FUser.setEmpty(True);
    isAccountValidate := False;
  end;

end;

end.
