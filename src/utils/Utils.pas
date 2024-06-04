unit Utils;



interface

uses DatabaseRepository, LanguageAdapter, ZConnection, LangEnum, RoleEnum;


type
  TUtils = class
  public
    Connect: TDatabaseRepository;
    Speak: TLanguageAdapter;
    class function roleToStringFromUser (role: TRoleEnum): string;
    class function stringToRoleFromUser (role: string): TRoleEnum;
    class function databaseConverterToBoolean (intValue: integer): Boolean;
    class function databaseConverterToInteger (booleanValue: Boolean): integer;
    constructor Create;
    destructor Destroy; override;
  end;




implementation

uses SysUtils;

constructor TUtils.Create;
begin
  inherited Create;
  Connect := TDatabaseRepository.GetInstance;
  Speak := TLanguageAdapter.Create(LangEnum.INDONESIA);
end;

destructor TUtils.Destroy;
begin
  Speak.Free;
  Connect.Free;
  inherited Destroy;
end;

class function TUtils.roleToStringFromUser (role: TRoleEnum): string;
begin
    if role = RoleEnum.OWNER then
      roleToStringFromUser := 'OWNER'
    else if role = RoleEnum.ADMIN then
      roleToStringFromUser := 'ADMIN'
    else if role = RoleEnum.KASIR then
      roleToStringFromUser := 'KASIR'
    else
      roleToStringFromUser := 'ERROR';
end;

class function TUtils.stringToRoleFromUser (role: string): TRoleEnum;
begin
  role := UpperCase(role);

  if role = 'OWNER' then
    stringToRoleFromUser := RoleEnum.OWNER
  else if role = 'ADMIN' then
    stringToRoleFromUser := RoleEnum.ADMIN
  else
    stringToRoleFromUser := RoleEnum.KASIR;
end;

class function TUtils.databaseConverterToBoolean (intValue: Integer): Boolean;
begin
  if intValue = 1 then
    databaseConverterToBoolean := True
  else
    databaseConverterToBoolean := False;
end;
class function TUtils.databaseConverterToInteger (booleanValue: Boolean): Integer;
begin
  if booleanValue then
    databaseConverterToInteger := 1
  else
    databaseConverterToInteger := 0;
end;

end.
