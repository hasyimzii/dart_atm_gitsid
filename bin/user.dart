class User {
  String id;
  String name;
  String pin;
  int balance;
  List<String> history;

  User({
    required this.id,
    required this.name,
    required this.pin,
    required this.balance,
    required this.history,
  });

  String getId() {
    return id;
  }

  String getName() {
    return name;
  }

  String getPin() {
    return pin;
  }

  int getBalance() {
    return balance;
  }

  void getHistory() {
    if (history.isEmpty) {
      print('Belum Ada Riwayat Transaksi!');
    } else {
      print('Riwayat Transaksi');
      for (String? item in history) {
        print('- $item');
      }
    }
  }

  void setBalance(int balance) {
    this.balance = balance;
  }

  void addHistory(String history) {
    this.history.add(history);
  }
}
