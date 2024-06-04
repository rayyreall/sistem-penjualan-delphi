unit KategoriService;

interface

uses KategoriModel, KategoriRepository,  Dialogs, LanguageAdapter, LangEnum, Utils;

type
  TKategoriService = class
  private
    FKategori: TKategoriModel;
    FKategoriRepository: TKategoriRepository;

  public
    constructor Create;
    destructor Destroy; override;
    function isValidInput(const name, deskripsi: string): Boolean;
    procedure insertData (const name, deskripsi: string);
    procedure updateData (const id: Integer; name, deskripsi: string);
  end;
implementation

constructor TKategoriService.Create;
begin
  FKategoriRepository :=  TKategoriRepository.Create;
end;
destructor TKategoriService.Destroy;
begin
  FKategoriRepository.Free;
  inherited Destroy;
end;

function TKategoriService.isValidInput(const name, deskripsi: string): Boolean;
var isValid: Boolean;
Speak: TLanguageAdapter;
begin
  Speak := TUtils.Create.Speak;
  isValid := True;
  
  if name = '' then
  begin
    isValid := False;
    MessageDlg(Speak.getMessageNotBlank('name'), mtError, [mbOK], 0);
  end;
  isValidInput := isValid;
end;

procedure TKategoriService.insertData(const name, deskripsi: string);
var model: TKategoriModel;
begin
  if isValidInput(name, deskripsi) then
  begin
    model := TKategoriModel.Create;
    model.setName(name);
    model.setDeskripsi(deskripsi);
    FKategoriRepository.Insert(model);
  end;
end;
procedure TKategoriService.updateData (const id: Integer; name, deskripsi: string);
var model: TKategoriModel;
begin
  model := TKategoriModel.Create;
  model.setId(id);
  model.setName(name);
  model.setDeskripsi(deskripsi);
  FKategoriRepository.Update(model);
end;
end.
