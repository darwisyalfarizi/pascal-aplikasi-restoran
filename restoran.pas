program restoran;

uses sysutils, crt;

var 

menuMakanan: array[1..18,1..2] of string;
menuMinuman: array[1..9,1..2] of string;

pesananMakanan : array of string;
pesananMinuman : array of string;
jumlahMakanan: array of integer;
jumlahMinuman: array of integer;
meja: array[1..7,1..2] of string;

i, pilihanMenu,  noMeja, jmlPesananMakanan, jmlPesananMinuman : integer;
ulang, nama : string;
diskon, hasilDiskon, total, kembali, cash : double;   
subtotal,subtotalMinuman, subtotalMakanan : longint;


procedure tampilMenu;
begin
  clrscr;
  writeln('========== Selamat Datang di Bakso Malang Cacak ==========');
  writeln('----------------------------------------------------------');
  writeln('1. Pesan Makanan');
  writeln('2. Pesan Minuman');
  writeln('3. Pilih Meja');
  writeln('4. Input Diskon (jika ada) ');
  writeln('5. Input Nama Pembeli');
  writeln('6. Bayar');
  writeln('7. Keluar');
  writeln('--------------------------------');
  write('Masukkan pilihan Anda: ');
end;

procedure pesanMakanan;

var

jumlah : integer;

begin
  write('Masukkan jumlah jenis makanan : ');
  readln(jumlah);
  for i:=1 to jumlah do
    begin
      setlength(pesananMakanan, jumlah);
      setlength(jumlahMakanan, jumlah);
      write('Masukkan Jenis Makanan (angka) : ');
      readln(pesananMakanan[i]);
      write('Masukkan Jumlah porsi : ');
      readln(jumlahMakanan[i]);


    end;
  
    jmlPesananMakanan := High(pesananMakanan) + 1;
    

end;

procedure pesanMinuman;

var

jumlah : integer;

begin
  write('Masukkan jumlah jenis minuman : ');
  readln(jumlah);
  for i:=1 to jumlah do
    begin
      setlength(pesananMinuman, jumlah);
      setlength(jumlahMinuman, jumlah);
      write('Masukkan Jenis Minuman (angka) : ');
      readln(pesananMinuman[i]);
      write('Masukkan Jumlah porsi : ');
      readln(jumlahMinuman[i]);
      // write('Apakah ingin memesan lagi ? (y/n)');
      // readln(kondisi);
      // if (kondisi = 'n') then
      //   begin
      //     break;
      //   end;
    

    end;
  
    jmlPesananMinuman := High(pesananMinuman) + 1;
    //writeln(jmlPesananMakanan);

end;



procedure tampilMenuMakanan;
begin
  
  clrscr;
  writeln('## Daftar Makanan ##');
  writeln('--------------------------------');

  for i := 1 to 18 do
    begin
      writeln(i, '. ', menuMakanan[i,1], ' - Rp ', menuMakanan[i,2]);

      if (i = 4) or (i = 6) or (i = 10) or (i = 12) or (i = 14) or (i = 17) or (i = 18) then
        writeln('--------------------------------');
    end;
    pesanMakanan;
end;


procedure tampilMenuMinuman;
begin
  
  clrscr;
  writeln('## Daftar Minuman ##');
  writeln('--------------------------------');
  for i := 1 to 9 do
    begin
      writeln(i, '. ', menuMinuman[i,1], ' - Rp ', menuMinuman[i,2]);
      
      if (i = 3) or (i = 6) or (i = 7) or (i = 9) then
        writeln('--------------------------------');
    end;
    pesanMinuman;
end;


procedure tampilMenuMeja;
begin
  clrscr;
    writeln('## Daftar Meja ##');
    writeln('--------------------------------');
      for i := 1 to 7 do
    begin
      writeln('Meja ', meja[i,1], ' - ', meja[i,2]);
      writeln('--------------------------------');
    end;
  write('Masukkan No Meja : ');
  readln(noMeja);

    if(meja[noMeja,2] = 'Tidak Tersedia') then
        begin
          tampilMenuMeja;
        end;
    
end;


procedure tampilMenuDiskon;
var
kodeDiskon : string;

begin
  clrscr;
      writeln('## Daftar Diskon Tahun Ini ##');
      writeln('--------------------------------');
      writeln('1. Pembeli Baru 5% (NEW) ');
      writeln('2. Ulang Tahun Tempat Makan 10% (BIRTH)');
      writeln('3. Membeli sampai 10x 25% (TEN)');
      writeln('--------------------------------');
      write('Masukkan Kode diskon Anda: ');
      readln(kodeDiskon);
      if (kodeDiskon ='NEW') then
        begin
          diskon := 0.05;
        end
      else if (kodeDiskon='BIRTH') then
        begin
          diskon := 0.1;
        end
      else if (kodeDiskon='TEN') then
        begin
          diskon := 0.25;
        end
      else
        begin
          writeln('Kode Diskon yang anda masukkan salah!');
        end;
end;

procedure tampilNama;
begin
  clrscr;
    writeln('## Identitas Pembeli ##');
    writeln('--------------------------------');
    write('Masukkan Nama Pembeli : ');
    readln(nama);
    writeln('--------------------------------');

end;

procedure tampilStruk;
begin

    subtotalMakanan := 0;
    subtotalMinuman := 0;

  clrscr;
  writeln('BAKSO MALANG CACAK');
  writeln('## ',DateToStr(Date));
  writeln('## ',TimeToStr(Time), ' WIB');
  writeln('------------------------------------------------------------------');
  writeln('Pembeli : ', nama);
  writeln('Meja : No. ', noMeja);
  writeln('------------------------------------------------------------------');
  writeln('Nama |':20, ' Qty |':4, ' Harga |':6, ' Sub Total |');
  writeln('-------------------------------------------------------------------');
  writeln('## Makanan');
  writeln('');
  
    for i := 1 to jmlPesananMakanan do
      begin
        writeln(menuMakanan[StrToInt(pesananMakanan[i]), 1]:20, ' | ',
                jumlahMakanan[i]:4, ' | ',
                menuMakanan[StrToInt(pesananMakanan[i]), 2]:6, ' | ',
                jumlahMakanan[i] * StrToInt(menuMakanan[StrToInt(pesananMakanan[i]), 2]));
          subtotalMakanan := subtotalMakanan + jumlahMakanan[i] * StrToInt(menuMakanan[StrToInt(pesananMakanan[i]), 2]);
      end;
  writeln('');
  writeln('Sub total makanan : ', subtotalMakanan);
  writeln('');
  writeln('## Minuman');
  writeln('');
    for i := 1 to jmlPesananMinuman do
      begin
        writeln(menuMinuman[StrToInt(pesananMinuman[i]), 1]:20, ' | ',
                jumlahMinuman[i]:4, ' | ',
                menuMinuman[StrToInt(pesananMinuman[i]), 2]:6, ' | ',
                jumlahMinuman[i] * StrToInt(menuMinuman[StrToInt(pesananMinuman[i]), 2]));

        subtotalMinuman :=  subtotalMinuman + jumlahMinuman[i] * StrToInt(menuMinuman[StrToInt(pesananMinuman[i]), 2]);
      end;
  writeln('');
  writeln('Sub total minuman : ', subtotalMinuman);
  writeln('-------------------------------------------------------');
  writeln('Sub Total  : ', subtotal);
  writeln('Discount  : ', diskon * 100:0:0 , '%');
  writeln('Receipt Total  : ',subtotal - hasilDiskon:0:0 );
  writeln('Cash  : ', cash:0:0);
  kembali := cash - total;
  writeln('Kembali  : ', kembali:0:0);
  writeln('-------------------------------------------------------');
  writeln('Terima Kasih Sudah Membeli Makanan disini');
  writeln('Silahkan Datang Kembali');
  writeln('');
  writeln('|| Untuk Pembelian ke-10 anda akan mendapatkan diskon sebesar 25%  ||');
  writeln('|| JANGAN LUPA MEMBAWA STRUK INI KEMBALI SAAT PEMBELIAN KE-10      ||');

  
end;



procedure tampilBayar;



begin
  subtotalMakanan := 0;
  subtotalMinuman := 0;

  clrscr;

  writeln('## Total harga yang harus dibayar ##');
  writeln('------------------------------------------------------------------');
  writeln('Nama |':20, ' Qty |':4, ' Harga |':6, ' Sub Total ');
  writeln('-------------------------------------------------------------------');
  writeln('## Makanan');
  writeln('');
  
    for i := 1 to jmlPesananMakanan do
      begin
        writeln(menuMakanan[StrToInt(pesananMakanan[i]), 1]:20, ' | ',
                jumlahMakanan[i]:4, ' | ',
                menuMakanan[StrToInt(pesananMakanan[i]), 2]:6, ' | ',
                jumlahMakanan[i] * StrToInt(menuMakanan[StrToInt(pesananMakanan[i]), 2]));
          subtotalMakanan := subtotalMakanan + jumlahMakanan[i] * StrToInt(menuMakanan[StrToInt(pesananMakanan[i]), 2]);
      end;
  writeln('');
  writeln('Sub total makanan : ', subtotalMakanan);
  writeln('');

  writeln('## Minuman');
  writeln('');
    for i := 1 to jmlPesananMinuman do
      begin
        writeln(menuMinuman[StrToInt(pesananMinuman[i]), 1]:20, ' | ',
                jumlahMinuman[i]:4, ' | ',
                menuMinuman[StrToInt(pesananMinuman[i]), 2]:6, ' | ',
                jumlahMinuman[i] * StrToInt(menuMinuman[StrToInt(pesananMinuman[i]), 2]));

        subtotalMinuman := subtotalMinuman + jumlahMinuman[i] * StrToInt(menuMinuman[StrToInt(pesananMinuman[i]), 2]);
      end;
  writeln('');
  writeln('Sub total minuman : ', subtotalMinuman);
  writeln('');

  subtotal := subtotalMakanan + subtotalMinuman;

  writeln('-------------------------------------------------------');
  writeln('Sub Total  : ', subtotal);
  writeln('Discount  : ', diskon * 100:0:0 , '%');
  hasilDiskon := subtotal * diskon;
  total := subtotal - hasilDiskon;
  writeln('Receipt Total  : ', total:0:0);
  write('Masukkan jumlah cash : ');readln(cash);
  tampilStruk;
end;







begin

  //mengisi menu makanan beserta harganya
  menuMakanan[1,1] := 'Bakso Campur 6';
  menuMakanan[1,2] := '24000';
  menuMakanan[2,1] := 'Bakso Campur 5';
  menuMakanan[2,2] := '20000';
  menuMakanan[3,1] := 'Bakso Campur 4';
  menuMakanan[3,2] := '16000';
  menuMakanan[4,1] := 'Bakso Spesial 5';
  menuMakanan[4,2] := '20000';
  menuMakanan[5,1] := 'Cwie Mie Ayam';
  menuMakanan[5,2] := '15000';
  menuMakanan[6,1] := 'Cwie Mie Spesial';
  menuMakanan[6,2] := '22000';
  menuMakanan[7,1] := 'Soto Ayam';
  menuMakanan[7,2] := '15000';
  menuMakanan[8,1] := 'Soto Sapi';
  menuMakanan[8,2] := '20000';
  menuMakanan[9,1] := 'Nasi Soto Ayam';
  menuMakanan[9,2] := '18000';
  menuMakanan[10,1] := 'Nasi Soto Sapi';
  menuMakanan[10,2] := '23000';
  menuMakanan[11,1] := 'Rawon';
  menuMakanan[11,2] := '20000';
  menuMakanan[12,1] := 'Nasi + Rawon';
  menuMakanan[12,2] := '23000';
  menuMakanan[13,1] := 'Mie Jawa Goreng';
  menuMakanan[13,2] := '20000';
  menuMakanan[14,1] := 'Mie Jawa Godog';
  menuMakanan[14,2] := '20000';
  menuMakanan[15,1] := 'Nasi Goreng Telur';
  menuMakanan[15,2] := '14000';
  menuMakanan[16,1] := 'Nasi Goreng Ayam';
  menuMakanan[16,2] := '17000';
  menuMakanan[17,1] := 'Nasi Goreng Sapi';
  menuMakanan[17,2] := '20000';
  menuMakanan[18,1] := 'Nasi Putih';
  menuMakanan[18,2] := '5000';
  

  //mengisi menu minuman beserta harganya

  menuMinuman[1,1] := 'Teh Botol';
  menuMinuman[1,2] := '5000';
  menuMinuman[2,1] := 'Aqua Botol';
  menuMinuman[2,2] := '4000';
  menuMinuman[3,1] := 'Air Putih (Hangat/Es)';
  menuMinuman[3,2] := '1000';
  menuMinuman[4,1] := 'Teh Manis (Panas/Es)';
  menuMinuman[4,2] := '5000';
  menuMinuman[5,1] := 'Teh Tawar (Panas/Es)';
  menuMinuman[5,2] := '2000';
  menuMinuman[6,1] := 'Lemon Tea (Panas/Es)';
  menuMinuman[6,2] := '7000';
  menuMinuman[7,1] := 'Jeruk (Panas/Es)';
  menuMinuman[7,2] := '8000';
  menuMinuman[8,1] := 'Kopi Hitam / White Coffe';
  menuMinuman[8,2] := '5000';
  menuMinuman[9,1] := 'Es Kopi Hitam / White Coffe';
  menuMinuman[9,2] := '6000';

  //mengisi data setiap meja

  meja[1,1] := '1';
  meja[1,2] := 'Tidak Tersedia';
  meja[2,1] := '2';
  meja[2,2] := 'Tersedia';
  meja[3,1] := '3';
  meja[3,2] := 'Tersedia';
  meja[4,1] := '4';
  meja[4,2] := 'Tidak Tersedia';
  meja[5,1] := '5';
  meja[5,2] := 'Tidak Tersedia';
  meja[6,1] := '6';
  meja[6,2] := 'Tersedia';
  meja[7,1] := '7';
  meja[7,2] := 'Tersedia';


//begin

   repeat
    tampilMenu;
    readln(pilihanMenu);
    case pilihanMenu of
      1: tampilMenuMakanan;
      2: tampilMenuMinuman;
      3: tampilMenuMeja;
      4: tampilMenuDiskon;
      5: tampilNama;
      6: tampilBayar;
      7: exit;
      
      else writeln('Pilihan tidak valid');
    end;
    writeln(' ');
    write('Tekan Y/y untuk kembali ke menu, atau tekan tombol lain 2x untuk keluar : ');
    readln(ulang);
  until (ulang <> 'Y') and (ulang <> 'y');


readln

end.