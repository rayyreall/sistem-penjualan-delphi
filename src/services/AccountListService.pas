unit AccountListService;

interface

type
  TAccountListService = class
  public
    constructor Create;
    destructor Destroy; override;
    function ItemIndexToAttribute(const index: Integer): String;
    end;
implementation

constructor TAccountListService.Create;
begin

end;

destructor TAccountListService.Destroy;
begin
  inherited Destroy;
end;

function TAccountListService.ItemIndexToAttribute(const index: Integer): String;
begin
  if index = 0 then
    ItemIndexToAttribute := 'id'
  else if index = 1 then
    ItemIndexToAttribute := 'username'
  else if index = 2 then
    ItemIndexToAttribute := 'full_name'
  else if index = 3 then
    ItemIndexToAttribute := 'email'
  else if index = 4 then
    ItemIndexToAttribute := 'telp'
  else if index = 5 then
    ItemIndexToAttribute := 'alamat'
  else if index = 6 then
    ItemIndexToAttribute := 'role'
  else
    ItemIndexToAttribute := 'username';

end;

end.
