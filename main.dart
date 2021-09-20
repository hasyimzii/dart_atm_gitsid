import 'dart:io';
import 'bin/user.dart';
import 'bin/system.dart';
import 'bin/balance.dart';
import 'bin/transfer.dart';
import 'bin/withdraw.dart';
import 'bin/deposit.dart';
import 'bin/history.dart';

// system
System system = System();

// account
List<User> accounts = [
  User(id: '1-0123', name: 'hasyim', pin: '123456', balance: 100000, history: []),
  User(id: '2-0123', name: 'andi', pin: '123456', balance: 320000, history: []),
  User(id: '3-0123', name: 'aulia', pin: '123456', balance: 125000, history: []),
  User(id: '4-0123', name: 'rudi', pin: '123456', balance: 80000, history: []),
  User(id: '5-0123', name: 'putri', pin: '123456', balance: 210000, history: []),
];

// init user
var user;

// balance
Balance balance = Balance(user: user);

// transfer
Transfer transfer = Transfer(accounts: accounts, user: user);

// withdraw
Withdraw withdraw = Withdraw(user: user);

// deposit
Deposit deposit = Deposit(user: user);


// menu
void menu() {
  system.clear();
  print('Selamat Datang ${user.getName()}!');
  print('[1] Lihat Saldo');
  print('[2] Transfer Saldo');
  print('[3] Tarik Tunai');
  print('[4] Setor Tunai');
  print('[5] Riwayat Transaksi');
  print('[0] Keluar');

  stdout.write('Masukkan Digit Angka : ');
  final input = stdin.readLineSync();
  system.clear();

  switch (input) {
    case '1' :
      balance.balance();
      break;
    case '2' :
      transfer.transfer();
      break;
    case '3' :
      withdraw.withdraw();
      break;
    case '4' :
      deposit.deposit();
      break;
    case '5' :
      user.getHistory();
      break;
    case '0' :
      main();
      break;
    default:
      print('Harap Masukkan Digit Angka Menu!');
      break;
  }
  
  system.back();
  menu(); // recusrive
}

bool login() {
  stdout.write('Masukkan Nama : ');
  final name = stdin.readLineSync();
  stdout.write('Masukkan Pin : ');
  final pin = stdin.readLineSync();

  // looping accounts
  for(User? usr in accounts) {
    if(usr!.getName() == name) {
      if(usr.getPin() == pin) {
        user = usr;
        return true;
      }
    }
  }
  return false;
}

// main
void main() {
  system.clear();
  var success = login();

  if(success) {
    menu();
  }
  else {
    print('Nama atau Pin Salah!');
    system.back();
    main(); // recusrive
  }
}
