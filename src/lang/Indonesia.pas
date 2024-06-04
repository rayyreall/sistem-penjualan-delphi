unit Indonesia;

interface

uses LanguageImpl;

type
  TIndonesia = class (TInterfacedObject, ILanguage)
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

function TIndonesia.messageRoleUserNotValidError: string;
begin
  messageRoleUserNotValidError := 'Mohon maaf role akun yang anda masukkan tidak terdaftar di database';
end;

function TIndonesia.messageAccountError: string;
begin
  messageAccountError := 'Maaf akun anda tidak ada silakan hubungi owner untuk mendaftar account anda';
end;

function TIndonesia.messageLoginSuccess (name, role: string): string;
begin
  messageLoginSuccess := 'Halo ' + name + ', Anda berhasil login, anda terdaftar sebagai ' + role;
end;
function TIndonesia.messageCancelButton: string;
begin
  messageCancelButton := 'Apakah anda yakin ingin membatalkan perubahan?';
end;

function TIndonesia.messageNotBlank (const name: string): string;
begin
  messageNotBlank := 'Harap isi parameter ' + LowerCase(name) + ' sebelum anda melanjutkan!';
end;

function TIndonesia.messageInputLengthError (const name: string; amount: Integer): string;
begin
   messageInputLengthError := 'Parameter ' + lowerCase(name) + ' lebih dari ' + IntToStr(amount) + ' Karakter';
end;

function TIndonesia.messageInputMaxLengthError: string;
begin
  messageInputMaxLengthError := 'Maaf parameter yang anda masukkan terlalu panjang.';
end;

function TIndonesia.messageTelpNumberIndonesianError: string;
begin
  messageTelpNumberIndonesianError := 'Maaf nomor telpon harus diawali dengan 62';
end;

function TIndonesia.messagePasswordNotMatchError: string;
begin
  messagePasswordNotMatchError := 'Password anda tidak sesuai, Harap masukkan password dengan benar!';
end;

function TIndonesia.messageDashboardHeading(const name: string): string;
begin
  messageDashboardHeading := 'Halo, Selamat datang ' + name;
end;


end.
