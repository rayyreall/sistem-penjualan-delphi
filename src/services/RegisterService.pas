unit RegisterService;

interface

uses UserModel, SysUtils, Dialogs, LanguageAdapter, LangEnum, Utils;

type TRegisterService = class
  private
    FUser: TUserModel;

  public
    class function isValidateAmount(const text: string; minLength: Integer): Boolean;
    class function isValidateTelpIndonesian (const text: string): Boolean;
    class function isValidatePasswordConfirmation (const password, confirmPassword: string): Boolean;
    class function isValidateNextFirst (const firstName, lastName: string): Boolean;
    class function isValidateNextSecond (const email, NIK: string): Boolean;
    class function isValidateNextThird (const telp, username: string): Boolean;
    class function isValidateNextLogin (const password, confirmPassword: string): Boolean;
    class function isValidateNextFourth (role: string): Boolean;
  end;

implementation


class function TRegisterService.isValidateAmount (const text: string; minLength: Integer): Boolean;
begin
  isValidateAmount := Length(text) <= minLength;
end;

class function TRegisterService.isValidateTelpIndonesian (const text: string): Boolean;
begin
  isValidateTelpIndonesian := SameText(Copy(text, 1, 2), '62')
end;

class function TRegisterService.isValidatePasswordConfirmation (const password, confirmPassword: string): Boolean;
begin
  isValidatePasswordConfirmation := password = confirmPassword;
end;

class function TRegisterService.isValidateNextFirst (const firstName, lastName: string): Boolean;
var isValid: Boolean;
Speak: TLanguageAdapter;
begin
  Speak := TUtils.Create.Speak;
  isValid := False;

  if firstName = '' then
    MessageDlg(Speak.getMessageNotBlank('First Name'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(firstName, 3) then
    MessageDlg(Speak.getMessageInputLengthError('Nama depan', 3), mtError, [mbOK], 0)
  else if lastName = '' then
    MessageDlg(Speak.getMessageNotBlank('Last Name'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(lastName, 3) then
    MessageDlg(Speak.getMessageInputLengthError('Nama belakang', 3), mtError, [mbOK], 0)
  else
    isValid := True;
  isValidateNextFirst := isValid;
end;

class function TRegisterService.isValidateNextSecond (const email, NIK: string): Boolean;
var isValid: Boolean;
speak: TLanguageAdapter;
begin
  Speak := TUtils.Create.Speak;
  isValid := False;
  if email = '' then
    MessageDlg(Speak.getMessageNotBlank('email'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(email, 7) then
    MessageDlg(Speak.getMessageInputLengthError('email', 7), mtError, [mbOK], 0)
  else if NIK = '' then
    MessageDlg(Speak.getMessageNotBlank('NIK'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(NIK, 15) then
    MessageDlg(Speak.getMessageInputLengthError('NIK', 15), mtError, [mbOK], 0)
  else
    isValid := True;
  isValidateNextSecond := isValid;
end;

class function TRegisterService.isValidateNextThird (const telp, username: string): Boolean;
var isValid: Boolean;
speak: TLanguageAdapter;
begin
  Speak := TUtils.Create.Speak;
  isValid := False;

  if telp = '' then
    MessageDlg(Speak.getMessageNotBlank('telp'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(telp, 5) then
    MessageDlg(Speak.getMessageInputLengthError('telp', 5), mtError, [mbOK], 0)
  else if not TRegisterService.isValidateTelpIndonesian(telp) then
    MessageDlg(Speak.getMessageTelpNumberIndonesianError, mtError, [mbOK], 0)
  else if username = '' then
    MessageDlg(Speak.getMessageNotBlank('username'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(username, 4) then
    MessageDlg(Speak.getMessageInputLengthError('username', 4), mtError, [mbOK], 0)
  else
    isValid := True;
  isValidateNextThird := isValid;
end;

class function TRegisterService.isValidateNextLogin (const password, confirmPassword: string): Boolean;
var isValid: Boolean;
speak: TLanguageAdapter;
begin
  Speak := TUtils.Create.Speak;
  isValid := False;

  if password = '' then
    MessageDlg(Speak.getMessageNotBlank('password'), mtError, [mbOK], 0)
  else if TRegisterService.isValidateAmount(password,7) then
    MessageDlg(Speak.getMessageInputLengthError('password', 8), mtError, [mbOK], 0)
  else if not TRegisterService.isValidatePasswordConfirmation(password, confirmPassword) then
    MessageDlg(Speak.getMessagePasswordNotMatchError, mtError, [mbOK], 0)
  else
    isValid := True;
  isValidateNextLogin:= isValid;
end;

class function TRegisterService.isValidateNextFourth (role: string): Boolean;
var isValid: Boolean;
speak: TLanguageAdapter;
begin
  Speak := TUtils.Create.Speak;
  isValid := False;
  role := UpperCase(role);

  if (role = 'OWNER') or (role = 'ADMIN') or (role = 'KASIR') then
    isValid := True
  else
    MessageDlg(Speak.getMessageRoleUserNotValidError, mtError, [mbOK], 0);

  isValidateNextFourth := isValid;
end;

end.
