class History {
  final List<Map> accounts;
  final auth;

  const History ({
    required this.accounts,
    required this.auth,
  });

  void getHistory() {
    List<String> history = accounts[auth.userRow]['history'];
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