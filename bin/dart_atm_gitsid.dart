import 'dart:io';

// user
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

void balance() {
  clear();
  for(var i = 0; i < accounts.length; i++) {
    if(accounts[i]['id'] == userId) {
      var id = accounts[i]['id'];
      var name = accounts[i]['name'];
      var balance = accounts[i]['balance'];

      print('Id Rekening : $id');
      print('Nama Akun   : $name');
      print('Sisa Saldo  : $balance');
    }
  }

  print('Tekan Enter untuk Kembali');
  final enter = stdin.readLineSync();
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
    print('');
  }
  else if(menu == '3') {
    withdraw();
  }
  else if(menu == '4') {
    print('');
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
