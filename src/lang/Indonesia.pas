unit Indonesia;

interface

uses LanguageImpl;

type
  TIndonesia = class (TInterfacedObject, ILanguage)
  public
    function messageAccountError: string;
    function messageLoginSuccess (name, role: string): string;
  end;

implementation

function TIndonesia.messageAccountError: string;
begin
  messageAccountError := 'Maaf akun anda tidak ada silakan hubungi owner untuk mendaftar account anda';
end;

function TIndonesia.messageLoginSuccess (name, role: string): string;
begin
  messageLoginSuccess := 'Halo ' + name + ', Anda berhasil login, anda terdaftar sebagai ' + role;
end;


end.
