import 'dart:io';

class Deposit {
  final List<Map> accounts;
  final auth;

  const Deposit ({
    required this.accounts,
    required this.auth,
  });

  void deposit() {
    stdout.write('Masukkan Nominal yang Ingin Disetor : ');
    int? input = int.parse(stdin.readLineSync()!);
    
    int? tempBalance = int.parse(accounts[auth.userRow]['balance'].toString());
    int? result = tempBalance + input;
    accounts[auth.userRow]['balance'] = result;
    int balance = accounts[auth.userRow]['balance'];
    
    
    // add history
    List<String> history = accounts[auth.userRow]['history'];
    history.add('Setor Tunai Senilai $input');
    return print('Setoran Berhasil, Saldomu Sisa $balance');
  }
}