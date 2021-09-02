import 'dart:io';

// akun
var accounts = [
  {
  'number': '01234',
  'name': 'hasyim',
  'balance': 100000
  },
  {
  'number': '12340',
  'name': 'andi',
  'balance': 320000
  },
  {
  'number': '23401',
  'name': 'aulia',
  'balance': 150000
  },
  {
  'number': '34012',
  'name': 'rudi',
  'balance': 280000
  },
  {
  'number': '40123',
  'name': 'putri',
  'balance': 125000
  }
];

void clear() {
  if(Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout); 
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

void main() {
  
}
