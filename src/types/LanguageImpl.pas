unit LanguageImpl;

interface

type
  ILanguage = interface
    function messageAccountError: string;
    function messageLoginSuccess (name, role: string): string;
    function messageCancelButton: string;
    function messageNotBlank (const name: string): string;
    function messageInputLengthError (const name: string; amount: Integer): string;
    function messageInputMaxLengthError: string;
    function messageTelpNumberIndonesianError: string;
    function messagePasswordNotMatchError: string;
  end;

implementation

end.
