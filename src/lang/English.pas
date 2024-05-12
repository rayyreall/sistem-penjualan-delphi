unit English;

interface
uses LanguageImpl;

type
  TEnglish = class (TInterfacedObject, ILanguage)
  public
    function messageAccountError: string;
    function messageLoginSuccess (name, role: string): string;
  end;

implementation

function TEnglish.messageAccountError: string;
begin
  messageAccountError := 'Sorry, your account doesn''t exist, please contact the owner to register your account';
end;

function TEnglish.messageLoginSuccess(name, role: string): string;
begin
  messageLoginSuccess := 'Hello ' + name + ', You have successfully logged in, you are registered as ' + role;
end;

end.
