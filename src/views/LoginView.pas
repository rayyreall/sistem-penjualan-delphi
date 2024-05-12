unit LoginView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UserModel, StdCtrls, ExtCtrls,  LanguageAdapter, LanguageImpl;

type
  TLoginViews = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    grp1: TGroupBox;
    edtUsername: TEdit;
    grp2: TGroupBox;
    edtPassword: TEdit;
    btn1: TButton;
    btnClose: TButton;
    procedure closeButtonClick(Sender: TObject);
    procedure loginButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function createUserModel(UserName, password: string): TUserModel;
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
  Close;
end;

procedure TLoginViews.loginButtonClick(Sender: TObject);
var registerView: TRegisterAccount;
username, password: string;
service: TLoginService;
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

    service.clearService;
    service.Destroy;
    
    registerView := TRegisterAccount.Create(Application);
    registerView.Show;
    Hide;
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

function TLoginViews.createUserModel(UserName, password: string): TUserModel;
var model: TUserModel;
begin
    model := TUserModel.Create;
    model := model
              .setID(0)
              .setUsername(UserName)
              .setPassword(password)
              .setFullName('Rizki Firdaus')
              .setRole(RoleEnum.OWNER)
              .setEmail('rizkifirdaus2902@gmail.com')
              .setIsActive(true);
    createUserModel := model;
end;

end.
