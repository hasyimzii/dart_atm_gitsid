class Balance {
  final user;

  const Balance({required this.user});

  void balance() {
    String id = user.getId();
    String name = user.getName();
    int balance = user.getBalance();

    print('Id Rekening : $id');
    print('Nama Akun   : $name');
    print('Sisa Saldo  : $balance');
  }
}
