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

end.
