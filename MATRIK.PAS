Program OperasiMatrik;
Uses Crt;
Var
  klm,brs,klm2,brs2,i,j : Integer;
  M1,M2,M3 : Array[1..4,1..4] of Integer;
  ch1,ch2 : Char;
Procedure Matrik1;
Begin
  Write('Jumlah Baris : ');ReadLn(brs);
  Write('Jumlah Kolom : ');ReadLn(klm);
  If (klm<=4) and (brs<=4) then
  Begin
    For i:=1 to brs do
      For j:= 1 to klm do
      Begin
        GotoXY((4*j),8+i);
        ReadLn(M1[j,i]);
      End;
  End
  Else
  Begin
    WriteLn('   Jumlah Kolom atau Baris melebihi batas !');
    WriteLn('Jumlah Maksimal untuk Kolom atau Baris adalah 4');
  End;
End;
Procedure Operasi;
Begin
  GotoXY(40,1);
  WriteLn('---------- Operator ----------');
  GotoXY(40,2);
  WriteLn('1. Penjumlahan    3. Perkalian');
  GotoXY(40,3);
  WriteLn('2. Pengurangan');
  GotoXY(40,4);
  Write('Pilihan : ');ReadLn(ch2);
  GotoXY(40,5);
  WriteLn('------------------------------');
End;
Procedure Penjumlahan;
Begin
  klm2 := klm;
  brs2 := brs;
  GotoXY(4+(4*klm2),8+(brs2 div 2)+(brs2 mod 2));
  WriteLn('+');
  For i:=1 to brs2 do
    For j:= 1 to klm2 do
    Begin
      GotoXY(4+(4*klm2)+(4*j),8+i);
      ReadLn(M2[j,i]);
    End;
  GotoXY(8+(8*klm2),8+(brs2 div 2)+(brs2 mod 2));
  WriteLn('=');
  For i:=1 to brs2 do
    For j:= 1 to klm2 do
    Begin
      GotoXY(8+(8*klm2)+(4*j),8+i);
      WriteLn(M1[j,i]+M2[j,i]);
    End;
End;
Procedure Pengurangan;
Begin
  klm2 := klm;
  brs2 := brs;
  GotoXY(4+(4*klm2),8+(brs2 div 2)+(brs2 mod 2));
  WriteLn('-');
  For i:=1 to brs2 do
    For j:= 1 to klm2 do
    Begin
      GotoXY(4+(4*klm2)+(4*j),8+i);
      ReadLn(M2[j,i]);
    End;
  GotoXY(8+(8*klm2),8+(brs2 div 2)+(brs2 mod 2));
  WriteLn('=');
  For i:=1 to brs2 do
    For j:= 1 to klm2 do
    Begin
      GotoXY(8+(8*klm2)+(4*j),8+i);
      WriteLn(M1[j,i]-M2[j,i]);
    End;
End;
Procedure Perkalian;
Begin
  brs2 := klm;
  GotoXY(40,6);
  WriteLn('Jumlah Baris : ',brs2);
  GotoXY(40,7);
  Write('Jumlah Kolom : ');ReadLn(klm2);
  If (klm2<=4) then
  Begin
    GotoXY(4+(4*klm),8+(brs2 div 2)+(brs2 mod 2));
    WriteLn('X');
    For i:=1 to brs2 do
      For j:= 1 to klm2 do
      Begin
        GotoXY(4+(4*klm)+(4*j),8+i);
        ReadLn(M2[j,i]);
      End;
    GotoXY(8+(8*klm2),8+(brs2 div 2)+(brs2 mod 2));
    WriteLn('=');
    For i:=1 to brs do
      For j:= 1 to klm2 do
      Begin
        GotoXY(8+(8*klm2)+(4*j),8+i);
        WriteLn(M1[j,i]*M2[i,j]);
      End;
  End
  Else
  Begin
    WriteLn('   Jumlah Baris melebihi batas !!');
    WriteLn('Jumlah Maksimal untuk Baris adalah 4');
  End;
End;

Begin
  Repeat
    ClrScr;
    WriteLn('----- Perhitungan Matrik -----');
    WriteLn('1. Mulai Perhitungan');
    WriteLn('2. Keluar');
    Write('Pilihan : ');ReadLn(ch1);
    WriteLn('------------------------------');
    Case ch1 of
      '1' : Begin
              Matrik1;
              Operasi;
              Case ch2 of
                '1' : Penjumlahan;
                '2' : Pengurangan;
                '3' : Perkalian;
              End;
              ReadLn;
            End;
      '2' : ch1 := '2';
      Else
      Begin
        WriteLn('Pilihan yang Anda Masukkan Salah !!');
        ReadLn;
      End;
    End;
  Until Ch1 = '2';
End.