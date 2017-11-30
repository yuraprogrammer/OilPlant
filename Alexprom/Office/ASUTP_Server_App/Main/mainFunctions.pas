unit mainFunctions;

interface
uses
  Windows, Messages, SysUtils, Variants, u_dm, ADODB, Math;

function newRootNumber:longint;
function day_in_month(m:byte; y:word):byte;

implementation

function newRootNumber:longInt;
var
 query:TADOQuery;
begin
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  query.SQL.Clear;
  query.SQL.Add('select max(rootNode) from dbo.Nodes');
  query.Open;
  newRootNumber:=query.Fields[0].AsInteger+1;
end;

function day_in_month(m:byte; y:word):byte;
begin
case m of
0: result:=31;
1:if (y mod 4)=0 then
   result:=29
  else
   result:=28;
2: result:=31;
3: result:=30;
4: result:=31;
5: result:=30;
6: result:=31;
7: result:=31;
8: result:=30;
9: result:=31;
10: result:=30;
11: result:=31;
end;
end;

end.
