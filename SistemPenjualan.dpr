program SistemPenjualan;

uses
  Forms,
  LoginView in 'src\views\LoginView.pas' {LoginViews},
  DataModule in 'src\utils\DataModule.pas' {DataLib: TDataModule},
  UserModel in 'src\model\UserModel.pas',
  RoleEnum in 'src\types\RoleEnum.pas',
  UserRepository in 'src\repository\UserRepository.pas',
  RegisterAccountView in 'src\views\RegisterAccountView.pas' {RegisterAccount},
  LoginService in 'src\services\LoginService.pas',
  Indonesia in 'src\lang\Indonesia.pas',
  English in 'src\lang\English.pas',
  LanguageAdapter in 'src\lang\LanguageAdapter.pas',
  LangEnum in 'src\types\LangEnum.pas',
  LanguageImpl in 'src\types\LanguageImpl.pas',
  Authentication in 'src\auth\Authentication.pas',
  DatabaseRepository in 'src\repository\DatabaseRepository.pas',
  DashboardView in 'src\views\DashboardView.pas' {DashboardViews},
  RegisterService in 'src\services\RegisterService.pas',
  Utils in 'src\utils\Utils.pas',
  AccountListView in 'src\views\AccountListView.pas' {AccountList},
  AccountListService in 'src\services\AccountListService.pas',
  KategoriModel in 'src\model\KategoriModel.pas',
  KategoriViews in 'src\views\KategoriViews.pas' {KategoriView},
  KategoriRepository in 'src\repository\KategoriRepository.pas',
  KategoriService in 'src\services\KategoriService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TKategoriView, KategoriView);
  Application.CreateForm(TDashboardViews, DashboardViews);
  Application.CreateForm(TLoginViews, LoginViews);
  Application.CreateForm(TDataLib, DataLib);
  Application.CreateForm(TRegisterAccount, RegisterAccount);
  Application.CreateForm(TAccountList, AccountList);
  Application.Run;
end.
