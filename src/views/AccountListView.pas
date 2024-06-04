unit AccountListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, DatabaseRepository, AccountListService, LanguageAdapter, LanguageImpl, LangEnum, DashboardView;

type
  TAccountList = class(TForm)
    pnl1: TPanel;
    dbgrdUser: TDBGrid;
    btn1: TButton;
    edtFilterQuery: TEdit;
    cbbFilterQuery: TComboBox;
    grp1: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure edtFilterQueryChange(Sender: TObject);
    procedure formattedDBGRID;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountList: TAccountList;
  Speak: TLanguageAdapter;

implementation

uses DataModule,  UserRepository;

{$R *.dfm}

procedure TAccountList.formattedDBGRID;
begin
   dbgrdUser.Columns[0].Width := 25;  // id
   dbgrdUser.Columns[1].Width := 110; // username
   dbgrdUser.Columns[2].Width := 200;  // fullname
   dbgrdUser.Columns[3].Width := 150;  // email
   dbgrdUser.Columns[4].Width := 80;   // password
   dbgrdUser.Columns[5].Width := 50; // role
   dbgrdUser.Columns[6].Width := 140;  // nik
   dbgrdUser.Columns[7].Width := 100;  // telp
   dbgrdUser.Columns[8].Width := 200;  // alamat
   dbgrdUser.Columns[9].Width := 25;  // is_active
end;
procedure TAccountList.FormCreate(Sender: TObject);
begin
   Speak := TLanguageAdapter.Create(LangEnum.INDONESIA);
   dbgrdUser.DataSource :=  TUserRepository.getAllUser;
   formattedDBGRID;
end;

procedure TAccountList.edtFilterQueryChange(Sender: TObject);
begin
  
   //if not (edtFilterQuery.Text = '') then
  // begin
     //dbgrdUser.DataSource :=  TUserRepository.getUserByFilter(edtFilterQuery.Text, AccountList);
     //formattedDBGRID;
   //end
   //else if (edtFilterQuery.Text = '') then
   //begin
    //dbgrdUser.DataSource :=  TUserRepository.getAllUser;
    //formattedDBGRID;
   //end;
end;

procedure TAccountList.btn1Click(Sender: TObject);
var dashboardView: TDashboardViews;
begin
  if MessageDlg(Speak.getMessageCancelButton, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dashboardView := TDashboardViews.Create(Application);
    Hide;
    dashboardView.ShowModal;
    Close;
  end;
end;

end.
