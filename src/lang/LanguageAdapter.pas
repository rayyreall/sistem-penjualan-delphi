unit LanguageAdapter;

interface

uses Indonesia, English, LangEnum, LanguageImpl;

type TLanguageAdapter = class
  private
    FIndonesia: TIndonesia;
    FEnglish: TEnglish;
    FSpeak: ILanguage;
    FLanguage: TLangEnum;
  public
    function getMessageAccountError (): string;
    function getMessageLoginSuccess (name, role: string): string;
    function getMessageCancelButton: string;
    function getMessageNotBlank (const name: string): string;
    function getMessageInputLengthError(const name: string; amount: Integer): string;
    function getMessageInputMaxLengthError: string;
    function getMessageTelpNumberIndonesianError: string;
    function getMessagePasswordNotMatchError: string;
    constructor Create (lang: TLangEnum);
    end;

implementation

constructor TLanguageAdapter.Create (lang: TLangEnum);
begin
  FIndonesia := TIndonesia.Create;
  FEnglish := TEnglish.Create;
  FLanguage := lang;
  if FLanguage = LangEnum.INDONESIA then
    FSpeak := FIndonesia
  else if FLanguage = LangEnum.ENGLISH then
    FSpeak := FEnglish
  else
    FSpeak := FEnglish;
end;

function TLanguageAdapter.getMessageAccountError: string;
begin
  getMessageAccountError :=  FSpeak.messageAccountError();
end;

function TLanguageAdapter.getMessageLoginSuccess (name, role: string): string;
begin
  getMessageLoginSuccess := FSpeak.messageLoginSuccess(name, role);
end;

function TLanguageAdapter.getMessageCancelButton: string;
begin
  getMessageCancelButton := FSpeak.messageCancelButton;
end;

function TLanguageAdapter.getMessageNotBlank (const name: string): string;
begin
   getMessageNotBlank := FSpeak.messageNotBlank(name);
end;

function TLanguageAdapter.getMessageInputLengthError(const name: string; amount: Integer): string;
begin
  getMessageInputLengthError := FSpeak.messageInputLengthError(name, amount)
end;

function TLanguageAdapter.getMessageInputMaxLengthError: string;
begin
  getMessageInputMaxLengthError := FSpeak.messageInputMaxLengthError;
end;

function TLanguageAdapter.getMessageTelpNumberIndonesianError: string;
begin
  getMessageTelpNumberIndonesianError := FSpeak.messageTelpNumberIndonesianError;
end;

function TLanguageAdapter.getMessagePasswordNotMatchError: string;
begin
  getMessagePasswordNotMatchError := FSpeak.messagePasswordNotMatchError;
end;

end.
