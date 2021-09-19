import 'dart:io';
import 'bin/account.dart';
import 'bin/system.dart';
import 'bin/auth.dart';
import 'bin/balance.dart';
import 'bin/transfer.dart';
import 'bin/withdraw.dart';
import 'bin/deposit.dart';
import 'bin/history.dart';

// account
Account accountClass = Account();
List<Map> accounts = accountClass.accounts;

// history
History historyClass = History();
List<String> history = historyClass.history;

// system
System system = System();

// auth
Auth auth = Auth(accounts: accounts);

// balance
Balance balance = Balance(accounts: accounts, auth: auth);

// transfer
Transfer transfer = Transfer(accounts: accounts, auth: auth, history: history);

// withdraw
Withdraw withdraw = Withdraw(accounts: accounts, auth: auth, history: history);

// deposit
Deposit deposit = Deposit(accounts: accounts, auth: auth, history: history);


// menu
void menu() {
  system.clear();
  String name = accounts[auth.userRow]['name'];
  print('Selamat Datang $name!');
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
      historyClass.getHistory();
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

// main
void main() {
  system.clear();
  var success = auth.login();

  if(success) {
    menu();
  }
  else {
    print('Nama atau Pin Salah!');
    system.back();
    main(); // recusrive
  }
}
