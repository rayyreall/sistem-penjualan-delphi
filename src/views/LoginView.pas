unit LoginView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UserModel, StdCtrls, ExtCtrls,  LanguageAdapter, LanguageImpl, DashboardView;

type
  TLoginViews = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    grp1: TGroupBox;
    edtUsername: TEdit;
    grp2: TGroupBox;
    edtPassword: TEdit;
    btnLogin: TButton;
    btnClose: TButton;
    chkPassword: TCheckBox;
    procedure closeButtonClick(Sender: TObject);
    procedure loginButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkPasswordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginViews: TLoginViews;
  Speak: TLanguageAdapter;

implementation

uses LoginService, RegisterAccountView, LangEnum, RoleEnum, Authentication;

{$R *.dfm}


procedure TLoginViews.closeButtonClick(Sender: TObject);
begin
  if MessageDlg(Speak.getMessageCancelButton, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Close;
end;

procedure TLoginViews.loginButtonClick(Sender: TObject);
var registerView: TRegisterAccount;
username, password: string;
service: TLoginService;
dashboardView: TDashboardViews;
role: TRoleEnum;
begin
  username :=  edtUsername.Text;
  password := edtPassword.Text;
  service := TLoginService.Create;

  service.InitAccountUser(username, password);

  if service.isAccountValidate then
  begin
    role := service.getUser.getRole;

    TAuth.SaveAuth(service.getUser);

    if role = RoleEnum.OWNER then
      MessageDlg(Speak.getMessageLoginSuccess(service.getUser.getFullName, 'Owner'), mtInformation, [mbOK], 0)
    else if role = RoleEnum.ADMIN then
      MessageDlg(Speak.getMessageLoginSuccess(service.getUser.getFullName, 'Admin'), mtInformation, [mbOK], 0)
    else
      MessageDlg(Speak.getMessageLoginSuccess(service.getUser.getFullName, 'Kasir'), mtInformation, [mbOK], 0);

    service.Destroy;

    dashboardView := TDashboardViews.Create(Application);
    Hide;
    dashboardView.ShowModal;
    Close;

  end
  else
  begin
    MessageDlg(Speak.getMessageAccountError(), mtError, [mbOK], 0);
    edtUsername.Text := '';
    edtPassword.Text := '';
  end;
end;

procedure TLoginViews.FormCreate(Sender: TObject);
begin
  Speak := TLanguageAdapter.Create(LangEnum.INDONESIA);
end;

procedure TLoginViews.chkPasswordClick(Sender: TObject);
begin
  if chkPassword.Checked then
    edtPassword.PasswordChar := #0
  else
    edtPassword.PasswordChar := '*';
end;

end.
