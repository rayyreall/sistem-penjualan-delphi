unit DashboardView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls;

type
  TDashboardViews = class(TForm)
    mmHeading: TMainMenu;
    tOwner: TMenuItem;
    tKasir: TMenuItem;
    TAdmin: TMenuItem;
    lbl1: TLabel;
    pnl1: TPanel;
    menuRegister: TMenuItem;
    menuPengguna: TMenuItem;
    procedure menuRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DashboardViews: TDashboardViews;

implementation

uses RegisterAccountView, LanguageAdapter;

var Speak: TLanguageAdapter;

{$R *.dfm}

procedure TDashboardViews.menuRegisterClick(Sender: TObject);
var registerView: TRegisterAccount;
begin
  registerView := TRegisterAccount.Create(Application);
  Hide;
  registerView.ShowModal;
  Close;
end;

end.
