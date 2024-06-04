unit Authentication;

interface

uses UserModel;

type TAuth = class
  public
    class procedure SaveAuth(user: TUserModel);
    class function getUserInfo: TUserModel;
    class procedure DeleteAuth (const UserName: string);
    class function isLogin: Boolean;
  end;


var userClient: TUserModel;

implementation




class procedure TAuth.SaveAuth(user: TUserModel);
begin
  userClient := User;
end;

class procedure TAuth.DeleteAuth(const UserName: string);
begin
  if userClient.getUsername() = Username then
  begin
     userClient.Free;
     userClient := nil;
  end;

end;

class function TAuth.getUserInfo: TUserModel;
begin
  getUserInfo := userClient;
end;

class function TAuth.isLogin: Boolean;
begin
  isLogin := False;
  if userClient <> nil then
    isLogin := True;
end;

initialization
  userClient := nil;
end.
