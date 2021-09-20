import 'dart:io';
import 'user.dart';

class Transfer {
  final List<User> accounts;
  final User user;

  const Transfer ({
    required this.accounts,
    required this.user,
  });

  void transfer() {
    stdout.write('Masukkan Id Rekening yang Ingin Ditransfer : ');
    final id = stdin.readLineSync();

    for(User? target in accounts) {
      if(target!.getId() == id) {
        print('Kamu Akan Transfer ke Rekening ${target.getName()}');
        
        stdout.write('Masukkan Nominal yang Ingin Ditransfer : ');
        int? input = int.parse(stdin.readLineSync()!);
        int? tempBalance = user.getBalance();
        int? tempTarget = target.getBalance();

        if(tempBalance >= input) {
          // decrease user balance
          int? result = tempBalance - input;
          user.setBalance(result);

          // increase target balance
          int? targetResult = tempTarget + input;
          target.setBalance(targetResult);

          // add history
          user.addHistory('Transfer Senilai $input ke Rekening ${target.getName()}');
          target.addHistory('Menerima Transfer Senilai $input dari ${user.getName()}');
          return print('Transfer Berhasil! Saldomu Sisa ${user.getBalance()}, Saldo milik ${target.getName()} Sisa ${target.getBalance()}');
        }
        else {
          return print('Saldomu Tidak Cukup!');
        }
      }
    }
    return print('Rekening Tidak Ditemukan!');
  }
}