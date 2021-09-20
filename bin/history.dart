class History {
  final user;

  const History({required this.user});

  void getHistory() {
    List<String> history = user.getHistory();
    if (history.isEmpty) {
      print('Belum Ada Riwayat Transaksi!');
    } else {
      print('Riwayat Transaksi');
      for (String? item in history) {
        print('- $item');
      }
    }
  }
}
