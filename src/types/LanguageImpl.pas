unit LanguageImpl;

interface

type
  ILanguage = interface
    function messageAccountError: string;
    function messageLoginSuccess (name, role: string): string;
  end;

implementation

end.
