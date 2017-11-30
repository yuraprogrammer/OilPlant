unit geometricsolution;

interface

uses Math;

  const pi=3.1415926535897932384626433832795;
  function updateNaklon(h11,h12,h21,h22,l1,l2:word):real;
  function volumeSolve(l,d,k,level:word):longint;
  function newPlotn(temper,plotn20,korrect:real):real;
implementation

function updateNaklon(h11,h12,h21,h22,l1,l2:word):real;
begin
if (l1<>0) or (l2<>0) then
  Result:=abs((((h11+h12)/2)-((h21+h22)/2))/((l1+l2)/2));
end;

function Solve_Dni(P1,P2:integer):real;
begin
  Result:=(P1+P2)/2*pi;
end;

function volumeSolve(l,d,k,level:word):longint;
var
  part_1,part_2,part_3,part_4,part_5,part_6,part_7,R,R_L,arg,argg:double;
begin
 R:=d/2;
 R_L:=R-level;
 arg:=R_L/R;
 part_1:=(sqr(R)*Math.arccos(arg)-sqr(R_L)*Math.tan(Math.ArcCos(arg)))*l;
 part_2:=2*(k*sqr(R)*Math.ArcCos(arg))/3;
 part_3:=2*(k*sqr(R_L)*Math.Tan(Math.ArcCos(arg)));
 part_4:=2*k*R_L*R_L*R_L/(3*R);
 part_5:=ln(abs(Math.Tan(Math.ArcCos(arg)/2+pi/4)));
 part_7:=(sin(Math.ArcCos(arg)))/sqr(cos((Math.ArcCos(arg))));
 Result:=Round((part_1+part_2-part_3+part_4*(part_5+part_7))/1000000);
end;

function newplotn(temper,plotn20,korrect:real):real;
begin
  Result:=plotn20-korrect*(temper-20);
end;
end.
