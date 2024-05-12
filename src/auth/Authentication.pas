unit Authentication;

interface

uses UserModel;

type TAuth = class
  public
    class procedure SaveAuth(user: TUserModel);
    class function getUserInfo: TUserModel;
    class procedure DeleteAuth (const UserName: string);
  end;

implementation



var userClient: TUserModel;


class procedure TAuth.SaveAuth(user: TUserModel);
begin
  userClient := User;
end;

class procedure TAuth.DeleteAuth(const UserName: string);
begin
  if userClient.getUsername() = Username then
    userClient.Free;
end;

class function TAuth.getUserInfo: TUserModel;
begin
  getUserInfo := userClient;
end;



end.
