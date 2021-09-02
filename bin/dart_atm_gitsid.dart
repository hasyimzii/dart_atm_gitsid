import 'dart:io';

// user
var user;

// akun
var accounts = [
  {
  'id': '1',
  'name': 'hasyim',
  'pin': '123456',
  'balance': 100000
  },
  {
  'id': '2',
  'name': 'andi',
  'pin': '123456',
  'balance': 320000
  },
  {
  'id': '3',
  'name': 'aulia',
  'pin': '123456',
  'balance': 150000
  },
  {
  'id': '4',
  'name': 'rudi',
  'pin': '123456',
  'balance': 280000
  },
  {
  'id': '5',
  'name': 'putri',
  'pin': '123456',
  'balance': 125000
  }
];

void clear() {
  print('\x1B[2J\x1B[0;0H');
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
}

void main() {
  clear();
  print('Masukkan Nama');
  final name = stdin.readLineSync();
  print('Masukkan Pin');
  final pin = stdin.readLineSync();

  for(var i = 0; i < accounts.length; i++) {
    if(accounts[i]['name'] == name) {
      if(accounts[i]['pin'] == pin) {
        user = name;
        menu();
      }
      else {
      print('Pin Salah!');
    }
    }
    else {
      print('Nama Salah!');
    }
  }

}
