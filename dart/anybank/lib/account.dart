abstract class Account {
  String name;
  double _balance;

  Account(this.name, this._balance);

  void showType();

  void showBalance() {
    print('Titular: ${name} - Saldo: R\$${_balance}');
  }

  void receive(double value) {
    _balance += value;
    showBalance();
  }

  void send(double value) {
    if (_balance >= value) {
      _balance -= value;
      showBalance();
    } else {
      print('Saldo insuficiente');
    }
  }
}

class CheckingAccount extends Account {
  double loan = 300;
  CheckingAccount(super.name, super._balance);

  @override
  void showType() {
    print('Conta Corrente');
  }

  @override
  void send(double value) {
    if (_balance + loan >= value) {
      _balance -= value;
      showBalance();
    }
  }
}

class SavingsAccout extends Account {
  double incoming = 0.05;

  SavingsAccout(super.name, super._balance);

  @override
  void showType() {
    print('Conta Poupança');
  }

  void calcIncoming() {
    _balance += _balance * incoming;
    showBalance();
  }
}

mixin Duty {
  double tax = 0.03;

  double calcTax(double value) {
    return value * tax;
  }
}

class CompanyAccount extends Account with Duty {
  CompanyAccount(super.name, super._balance);

  @override
  void showType() {
    print('Conta Empresarial');
  }

  @override
  void send(double value) {
    var tax = calcTax(value);
    if (_balance >= value + tax) {
      _balance -= value + tax;
      showBalance();
    } else {
      print('Saldo insuficiente');
    }
  }

  @override
  void receive(double value) {
    var tax = calcTax(value);
    _balance += value - tax;
  }
}

class InvestingAccount extends Account with Duty {
  InvestingAccount(super.name, super._balance);

  @override
  void showType() {
    print('Conta de Investimento');
  }

  @override
  void send(double value) {
    var tax = calcTax(value);
    if (_balance >= value + tax) {
      _balance -= value + tax;
      showBalance();
    } else {
      print('Saldo insuficiente');
    }
  }

  @override
  void receive(double value) {
    var tax = calcTax(value);
    _balance += value - tax;
    showBalance();
  }
}
