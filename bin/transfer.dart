import 'dart:io';

class Transfer {
  final List<Map> accounts;
  final auth;

  const Transfer ({
    required this.accounts,
    required this.auth,
  });

  void transfer() {
    stdout.write('Masukkan Id Rekening yang Ingin Ditransfer : ');
    final id = stdin.readLineSync();

    for(var i = 0; i < accounts.length; i++) {
      if(accounts[i]['id'] == id) {
        String name = accounts[i]['name'];
        print('Kamu Akan Transfer ke Rekening $name');
        stdout.write('Masukkan Nominal yang Ingin Ditransfer : ');
        int? input = int.parse(stdin.readLineSync()!);
        int? tempBalance = int.parse(accounts[auth.userRow]['balance'].toString());
        int? tempTarget = int.parse(accounts[i]['balance'].toString());

        if(tempBalance >= input) {
          // decrease this balance
          int? result = tempBalance - input;
          accounts[auth.userRow]['balance'] = result;

          // increase target balance
          int? targetResult = tempTarget + input;
          accounts[i]['balance'] = targetResult;

          int balance = accounts[auth.userRow]['balance'];
          int targetBalance = accounts[i]['balance'];
          return print('Transfer Berhasil, Saldomu Sisa $balance, Saldo milik $name Sisa $targetBalance');
        }
        else {
          return print('Saldomu Tidak Cukup!');
        }
      }
    }
    return print('Rekening Tidak Ditemukan!');
  }
}