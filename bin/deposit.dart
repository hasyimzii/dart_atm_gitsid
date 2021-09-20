import 'dart:io';

class Deposit {
  final user;

  const Deposit({required this.user});

  void deposit() {
    stdout.write('Masukkan Nominal yang Ingin Disetor : ');
    int? input = int.parse(stdin.readLineSync()!);

    int tempBalance = user.getBalance();
    int? result = tempBalance + input;
    user.setBalance(result);

    // add history
    user.addHistory('Setor Tunai Senilai $input');
    return print('Setoran Berhasil, Saldomu Sisa ${user.getBalance()}');
  }
}
