unit English;

interface
uses LanguageImpl;

type
  TEnglish = class (TInterfacedObject, ILanguage)
  public
    function messageAccountError: string;
    function messageLoginSuccess (name, role: string): string;
    function messageCancelButton: string;
    function messageNotBlank (const name: string): string;
    function messageInputLengthError (const name: string; amount: Integer): string;
    function messageInputMaxLengthError: string;
    function messageTelpNumberIndonesianError: string;
    function messagePasswordNotMatchError: string;
    function messageRoleUserNotValidError: string;
    function messageDashboardHeading(const name: string): string;
  end;

implementation

uses SysUtils;

function TEnglish.messageRoleUserNotValidError: string;
begin
  messageRoleUserNotValidError := 'Sorry, the role account you entered is not registered in the database';
end;

function TEnglish.messageAccountError: string;
begin
  messageAccountError := 'Sorry, your account doesn''t exist, please contact the owner to register your account';
end;

function TEnglish.messageLoginSuccess(name, role: string): string;
begin
  messageLoginSuccess := 'Hello ' + name + ', You have successfully logged in, you are registered as ' + role;
end;

function TEnglish.messageCancelButton: string;
begin
  messageCancelButton := 'Are you sure you want to cancel the changes?';
end;

function TEnglish.messageNotBlank (const name: string): string;
begin
  messageNotBlank := 'Please fill in the ' + lowerCase(name) + ' parameter before you continue';
end;

function TEnglish.messageInputLengthError (const name: string; amount: Integer): string;
begin
   messageInputLengthError := 'The ' + lowerCase(name) + ' parameters must be more than ' + IntToStr(amount) + ' characters';
end;

function TEnglish.messageInputMaxLengthError: string;
begin
  messageInputMaxLengthError := 'Sorry, the parameters you entered are too long.';
end;

function TEnglish.messageTelpNumberIndonesianError: string;
begin
  messageTelpNumberIndonesianError := 'Sorry, telephone numbers must start with 62';
end;

function TEnglish.messagePasswordNotMatchError: string;
begin
  messagePasswordNotMatchError := 'Your password is incorrect, please enter the password correctly!';
end;

function TEnglish.messageDashboardHeading(const name: string): string;
begin
  messageDashboardHeading := 'Hello, Welcome ' + name;
end;

end.
