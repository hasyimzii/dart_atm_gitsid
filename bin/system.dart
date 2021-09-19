import 'dart:io';

class System {
  // clear screen
  void clear() {
    print('\x1B[2J\x1B[0;0H');
  }

  // enter to back
  void back() {
    print('Tekan Enter untuk Kembali');
    stdin.readLineSync();
  }
}