import 'dart:io';

// user
var userRow;
var userId;

// akun
var accounts = [
  {
  'id': '1-012345',
  'name': 'hasyim',
  'pin': '123456',
  'balance': 100000
  },
  {
  'id': '2-012345',
  'name': 'andi',
  'pin': '123456',
  'balance': 320000
  },
  {
  'id': '3-012345',
  'name': 'aulia',
  'pin': '123456',
  'balance': 150000
  },
  {
  'id': '4-012345',
  'name': 'rudi',
  'pin': '123456',
  'balance': 280000
  },
  {
  'id': '5-012345',
  'name': 'putri',
  'pin': '123456',
  'balance': 125000
  }
];

// clear screen
void clear() {
  print('\x1B[2J\x1B[0;0H');
}

// enter to back
void back() {
  print('Tekan Enter untuk Kembali');
  final enter = stdin.readLineSync();
}

void balance() {
  clear();
  var id = accounts[userRow]['id'];
  var name = accounts[userRow]['name'];
  var balance = accounts[userRow]['balance'];

  print('Id Rekening : $id');
  print('Nama Akun   : $name');
  print('Sisa Saldo  : $balance');

  back();
  menu();
}

void transfer() {
  clear();
  print('Masukkan Id Rekening yang Ingin Ditransfer');
  final id = stdin.readLineSync();

  for(var i = 0; i < accounts.length; i++) {
    if(accounts[i]['id'] == id) {
      print('Masukkan Nominal yang Ingin Ditransfer');
      int? input = int.parse(stdin.readLineSync()!);
      int tempBalance = int.parse(accounts[userRow]['balance'].toString());
      int tempTarget = int.parse(accounts[i]['balance'].toString());

      if(tempBalance >= input) {
        // decrease this balance
        int result = tempBalance - input;
        accounts[userRow]['balance'] = result;

        // increase target balance
        int targetResult = tempTarget + input;
        accounts[i]['balance'] = targetResult;

        var balance = accounts[userRow]['balance'];
        var targetBalance = accounts[i]['balance'];
        print('Transfer Berhasil, Saldomu Sisa $balance, Saldo Tujuan Sisa $targetBalance');

        back();
        menu();
      }
      else {
        print('Saldomu Tidak Cukup!');
        back();
        menu();
      }
    }
  }
  print('Rekening Tidak Ditemukan!');
  back();
  menu();
}

void withdraw() {
  clear();
  print('Masukkan Nominal yang Ingin Ditarik');
  int? input = int.parse(stdin.readLineSync()!);
  int tempBalance = int.parse(accounts[userRow]['balance'].toString());

  if(tempBalance >= input) {
    int result = tempBalance - input;
    accounts[userRow]['balance'] = result;
    var balance = accounts[userRow]['balance'];
    print('Penarikan Berhasil, Saldomu Sisa $balance');
  }
  else {
    print('Saldomu Tidak Cukup!');
  }

  back();
  menu();
}

void deposit() {
  clear();
  print('Masukkan Nominal yang Ingin Disetor');
  int? input = int.parse(stdin.readLineSync()!);
  
  int tempBalance = int.parse(accounts[userRow]['balance'].toString());
  int result = tempBalance + input;
  accounts[userRow]['balance'] = result;
  var balance = accounts[userRow]['balance'];
  
  print('Setoran Berhasil, Saldomu Sisa $balance');

  back();
  menu();
}


void menu() {
  clear();
  print('[1] Lihat Saldo');
  print('[2] Transfer Saldo');
  print('[3] Tarik Tunai');
  print('[4] Setor Tunai');
  print('[0] Keluar');

  print('Masukkan Digit Angka');
  final menu = stdin.readLineSync();

  if(menu == '1') {
    balance();
  }
  else if(menu == '2') {
    transfer();
  }
  else if(menu == '3') {
    withdraw();
  }
  else if(menu == '4') {
    deposit();
  }
  else if(menu == '0') {
    main();
  }
  else {
    print('Harap Masukkan Digit Angka Menu!');
  }
}

bool login() {
  print('Masukkan Nama');
  final name = stdin.readLineSync();
  print('Masukkan Pin');
  final pin = stdin.readLineSync();

  // looping accounts
  for(var i = 0; i < accounts.length; i++) {
    if(accounts[i]['name'] == name) {
      if(accounts[i]['pin'] == pin) {
        userRow = i;
        userId = accounts[i]['id'];
        return true;
      }
    }
  }
  return false;

}

void main() {
  clear();
  var success = login();

  if(success == true) {
    menu();
  }
  else {
    print('Nama atau Pin Salah!');
  }
  

}
