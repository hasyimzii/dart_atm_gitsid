import 'dart:io';

class Withdraw {
  final List<Map> accounts;
  final auth;

  const Withdraw ({
    required this.accounts,
    required this.auth,
  });

  void withdraw() {
    stdout.write('Masukkan Nominal yang Ingin Ditarik : ');
    int? input = int.parse(stdin.readLineSync()!);
    int? tempBalance = int.parse(accounts[auth.userRow]['balance'].toString());

    if(tempBalance >= input) {
      int? result = tempBalance - input;
      accounts[auth.userRow]['balance'] = result;
      int balance = accounts[auth.userRow]['balance'];

      // add history
      List<String> history = accounts[auth.userRow]['history'];
      history.add('Tarik Tunai Senilai $input');
      return print('Penarikan Berhasil, Saldomu Sisa $balance');
    }
    else {
      return print('Saldomu Tidak Cukup!');
    }
  }
}