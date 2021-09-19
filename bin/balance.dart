class Balance {
  final List<Map> accounts;
  final auth;

  const Balance ({
    required this.accounts,
    required this.auth,
  });

  void balance() {
    String id = accounts[auth.userRow]['id'];
    String name = accounts[auth.userRow]['name'];
    int balance = accounts[auth.userRow]['balance'];

    print('Id Rekening : $id');
    print('Nama Akun   : $name');
    print('Sisa Saldo  : $balance');
  }
}