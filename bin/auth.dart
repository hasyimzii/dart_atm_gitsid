import 'dart:io';

class Auth {
  int userRow = 0;
  final List<Map> accounts;

  Auth ({
    required this.accounts,
  });

  bool login() {
    stdout.write('Masukkan Nama : ');
    final name = stdin.readLineSync();
    stdout.write('Masukkan Pin : ');
    final pin = stdin.readLineSync();

    // looping accounts
    for(var i = 0; i < accounts.length; i++) {
      if(accounts[i]['name'] == name) {
        if(accounts[i]['pin'] == pin) {
          userRow = i;
          return true;
        }
      }
    }
    return false;
  }
}