unit DashboardView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Utils;

type
  TDashboardViews = class(TForm)
    mmHeading: TMainMenu;
    tOwner: TMenuItem;
    tKasir: TMenuItem;
    TAdmin: TMenuItem;
    lblJudul: TLabel;
    pnl1: TPanel;
    menuLogin: TMenuItem;
    menuLogout: TMenuItem;
    LAPORAN1: TMenuItem;
    KATEGORI1: TMenuItem;
    SATUAN1: TMenuItem;
    SUPPLIER1: TMenuItem;
    CUSTOMER1: TMenuItem;
    PENJUALAN1: TMenuItem;
    PPEMBELIAN1: TMenuItem;
    LAPORANPENJUALAN1: TMenuItem;
    LAPORANPEMBELIAN1: TMenuItem;
    LAPORANVARABG1: TMenuItem;
    REGISTER: TMenuItem;
    LISTACCOUNT: TMenuItem;
    procedure menuLoginClick(Sender: TObject);

    procedure menuLogoutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuShow;
    procedure LISTACCOUNTClick(Sender: TObject);
    procedure REGISTERClick(Sender: TObject);
    procedure KATEGORI1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DashboardViews: TDashboardViews;

implementation

uses RegisterAccountView, LanguageAdapter, AccountListView, LoginView, Authentication, RoleEnum, KategoriViews;


{$R *.dfm}

procedure TDashboardViews.menuLoginClick(Sender: TObject);
var loginView: TLoginViews;
begin
  loginView := TLoginViews.Create(Application);
  Hide;
  loginView.ShowModal;
  Close;
end;



procedure TDashboardViews.menuLogoutClick(Sender: TObject);
var dashboardView: TDashboardViews;
begin
  TAuth.DeleteAuth(TAuth.getUserInfo.getUsername);
  dashboardView := TDashboardViews.Create(Application);
  Hide;
  dashboardView.ShowModal;
  Close;

end;

procedure TDashboardViews.MenuShow;
var role: TRoleEnum;
begin
  role := TAuth.getUserInfo.getRole;
  if role = RoleEnum.OWNER then
  begin
    mmHeading.Items[1].Visible := False;
    mmHeading.Items[2].Visible := False;
    mmHeading.Items[3].Visible := True;
  end
  else if role = RoleEnum.KASIR then
  begin
    mmHeading.Items[1].Visible := False;
    mmHeading.Items[2].Visible := True;
    mmHeading.Items[3].Visible := False;
  end
  else if role = RoleEnum.ADMIN then
  begin
    mmHeading.Items[1].Visible := True;
    mmHeading.Items[2].Visible := False;
    mmHeading.Items[3].Visible := False;
  end
  else
  begin
    mmHeading.Items[1].Visible := False;
    mmHeading.Items[2].Visible := False;
    mmHeading.Items[3].Visible := False;
  end;
end;
procedure TDashboardViews.FormShow(Sender: TObject);
var nama: string;
begin
  // mematikan Visibilitas sebelum login
  mmHeading.Items[1].Visible := False;
  mmHeading.Items[2].Visible := False;
  mmHeading.Items[3].Visible := False;
  mmHeading.Items[0][2].Visible := False;
  mmHeading.Items[0][3].Visible := False;

  if TAuth.isLogin then
  begin
    // mematikan Tombol Login (hanya menampilkan logout)
    mmHeading.Items[0][0].Visible := False;
    mmHeading.Items[0][1].Visible := True;
    MenuShow;

    // Spesial Feature Owner
    mmHeading.Items[0][2].Visible := True;
    mmHeading.Items[0][3].Visible := True;
    nama := TAuth.getUserInfo.getFullName;
  end
  else
  begin
    // mematikan tombol logout (hanya menampilkan login)
    mmHeading.Items[0][0].Visible := True;
    mmHeading.Items[0][1].Visible := False;
    nama := '';
  end;
  lblJudul.Caption := Speak.getMessageDashboardHeading(nama);
end;

procedure TDashboardViews.LISTACCOUNTClick(Sender: TObject);
var accountList: TAccountList;
begin
  accountList := TAccountList.Create(Application);
  Hide;
  accountList.ShowModal;
  Close;
end;

procedure TDashboardViews.REGISTERClick(Sender: TObject);
var registerView: TRegisterAccount;
begin
  registerView := TRegisterAccount.Create(Application);
  Hide;
  registerView.ShowModal;
  Close;
end;

procedure TDashboardViews.KATEGORI1Click(Sender: TObject);
var kategoriView: TKategoriView;
begin
  kategoriView := TKategoriView.Create(Application);
  Hide;
  kategoriView.ShowModal;
  Close;
end;

end.
