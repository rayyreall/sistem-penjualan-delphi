unit RegisterAccountView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, LanguageAdapter, LangEnum, DashboardView,
  RegisterService, UserModel, Utils;

type
  TRegisterAccount = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btnNext: TButton;
    btnPrev: TButton;
    btnCancel: TButton;
    grpFirstName: TGroupBox;
    edtFirstName: TEdit;
    grpLastName: TGroupBox;
    edtLastName: TEdit;
    pnlFirst: TPanel;
    pnlSecond: TPanel;
    grpNIK: TGroupBox;
    edtNIK: TEdit;
    grpEmail: TGroupBox;
    edtEmail: TEdit;
    pnlThird: TPanel;
    grpUsername: TGroupBox;
    edtUsername: TEdit;
    grpTelp: TGroupBox;
    edtTelp: TEdit;
    pnlFifty: TPanel;
    grpPassword: TGroupBox;
    edtPassword: TEdit;
    grpConfirmPassword: TGroupBox;
    edtConfirmPassword: TEdit;
    pnlFourth: TPanel;
    rgRole: TRadioGroup;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nextFirst;
    procedure nextSecond;
    procedure nextThird;
    procedure nextFourth;
    procedure loginAction;
    procedure prevFirst;
    procedure prevSecond;
    procedure prevThird;
    procedure prevFourth;
    procedure prevFifty;
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure edtNIKKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelpKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterAccount: TRegisterAccount;
  Speak: TLanguageAdapter;

implementation



{$R *.dfm}

procedure TRegisterAccount.btnCancelClick(Sender: TObject);
var dialog: TModalResult;
dashboard: TDashboardViews;
begin
  dialog := MessageDlg(Speak.getMessageCancelButton, mtConfirmation, [mbYes, mbNo], 0);
  if dialog = mrYes then
  begin
    dashboard := TDashboardViews.Create(Application);
    Hide;
    dashboard.ShowModal;
    Close;
  end;
end;

procedure TRegisterAccount.FormCreate(Sender: TObject);
begin
  Speak := TUtils.Create.Speak;
  btnPrev.Enabled := False;
  pnlFirst.Visible := True;
end;

procedure TRegisterAccount.nextFirst;
begin
  if TRegisterService.isValidateNextFirst(edtFirstName.Text, edtLastName.Text) then
  begin
    pnlFirst.Visible := False;
    pnlSecond.Visible := True;
    btnPrev.Enabled := True;
  end;
end;
procedure TRegisterAccount.nextSecond;
begin
  if TRegisterService.isValidateNextSecond (edtEmail.Text, edtNIK.Text) then
  begin
     pnlSecond.Visible := False;
     pnlThird.Visible := True;
  end;
end;
procedure TRegisterAccount.nextThird;
begin
  if TRegisterService.isValidateNextThird(edtTelp.Text, edtUsername.Text) then
  begin
    pnlThird.Visible := False;
    pnlFourth.Visible := True;
  end;
end;
procedure TRegisterAccount.nextFourth;
var role: string;
begin
  role := rgRole.Items[rgRole.ItemIndex];
  if TRegisterService.isValidateNextFourth(role) then
  begin
    pnlFourth.Visible := False;
    pnlFifty.Visible := True;
    btnNext.Caption := 'REGISTER';
  end;

end;
procedure TRegisterAccount.prevFirst;
begin
  pnlFirst.Visible := True;
  pnlSecond.Visible := False;
  btnPrev.Enabled := False;
end;
procedure TRegisterAccount.prevSecond;
begin
  pnlSecond.Visible := True;
  pnlThird.Visible := False;
end;
procedure TRegisterAccount.prevThird;
begin
  pnlThird.Visible := True;
  pnlFourth.Visible := False;

end;
procedure TRegisterAccount.prevFourth;
begin
  pnlFourth.Visible := True;
  pnlFifty.Visible := False;
end;
procedure TRegisterAccount.prevFifty;
begin
  pnlFourth.Visible := True;
  pnlFifty.Visible := False;
end;
procedure TRegisterAccount.btnNextClick(Sender: TObject);
begin
  if pnlFirst.Visible then
    nextFirst
  else if pnlSecond.Visible then
    nextSecond
  else if pnlThird.Visible then
    nextThird
  else if pnlFourth.Visible then
    nextFourth
  else if pnlFifty.Visible then
    loginAction;
end;

procedure TRegisterAccount.btnPrevClick(Sender: TObject);
begin
  if pnlFifty.Visible then
    prevFourth
  else if pnlFourth.Visible then
    prevThird
  else if pnlThird.Visible then
    prevSecond
  else if pnlSecond.Visible then
    prevFirst;
end;


procedure TRegisterAccount.edtNIKKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TRegisterAccount.edtTelpKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TRegisterAccount.loginAction;
var modelUser: TUserModel;
begin
  if UpperCase(btnNext.Caption) = 'REGISTER' then
  begin
    if TRegisterService.isValidateNextLogin(edtPassword.Text, edtConfirmPassword.Text) then
    begin
      ShowMessage('Berhasil Login');
      modelUser := TUserModel.Create;

      modelUser
        .setUsername(edtUsername.Text)
        .setPassword(edtPassword.Text)
        .setFullName(edtFirstName.Text + ' '+ edtLastName.Text)
        .setEmail(edtEmail.Text)
        .setTelp(edtTelp.Text)
        .setRole(TUtils.stringToRoleFromUser(rgRole.Items[rgRole.ItemIndex]))
        .setAlamat('')
        .setNIK(edtNIK.Text)
        .setIsActive(TUtils.databaseConverterToBoolean(1));
    end;
  end;
end;

end.
