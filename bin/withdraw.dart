import 'dart:io';

class Withdraw {
  final user;

  const Withdraw({required this.user});

  void withdraw() {
    stdout.write('Masukkan Nominal yang Ingin Ditarik : ');
    int? input = int.parse(stdin.readLineSync()!);
    int tempBalance = user.getBalance();

    if (tempBalance >= input) {
      int? result = tempBalance - input;
      user.setBalance(result);

      // add history
      user.addHistory('Tarik Tunai Senilai $input');
      return print('Penarikan Berhasil, Saldomu Sisa ${user.getBalance()}');
    } else {
      return print('Saldomu Tidak Cukup!');
    }
  }
}
