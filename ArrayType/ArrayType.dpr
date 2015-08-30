program ArrayType;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TMonth = (Jan, Feb, Mar, Apr, May, Jun,
            Jul, Aug, Sep, Oct, Nov, Dec);

  TContent = (Analysis, Listing, Practical);
  TPubYear = 1970..1995;

var
  res1: array[1..10] of String;
  res2: array[1..10,1..3] of Integer;
  magazine: array[TPubYear, TMonth, 1..500] of TContent;

begin
  res1[1] := '256x192x16';

  res2[1][1] := 256;
  res2[1,2] := 192;
  res2[1,3] := 16;

  magazine[1982, TMonth.Jan, 10] := TContent.Listing;
end.