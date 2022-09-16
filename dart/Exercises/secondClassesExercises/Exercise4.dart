class BankClient {
  late int _id;
  late String _name;
  late double _balance = 0;
  static int numberOfClients = 0;
  static double bankBalance = 0;

  BankClient(String n) {
    this._name = n; 
    numberOfClients++;
    this._id = numberOfClients;
  }
  String getName(){
    return this._name;
  }
  double getBalance() {
    return this._balance;
  }
  void addToBalance(double amount){
    this._balance += amount;
    bankBalance += amount;
  }
  static void printBankData(){
    print(bankBalance);
    print(numberOfClients);
  }
}

void main(){
  var client1 = BankClient('Manfred Manni');
  client1.addToBalance(33);
  var client2 = BankClient('Max Mustermann');
  BankClient.printBankData();
  print(client1.getName());
}