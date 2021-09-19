class History {
  List<String> history = [];

  void getHistory() {
    if(history.isEmpty) {
      print('Belum Ada Riwayat Transaksi!');
    }
    else {
      print('Riwayat Transaksi');
      for(String? item in history) {
        print('- $item');
      }
    }
  }
}