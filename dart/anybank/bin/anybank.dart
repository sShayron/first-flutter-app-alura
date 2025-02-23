import 'package:anybank/account.dart';

void main() {
  CheckingAccount accountCris = CheckingAccount('Cris', 4000);
  SavingsAccout accountDenize = SavingsAccout('Denize', 4000);
  CompanyAccount accountMatheus = CompanyAccount('Matheus', 2000);
  InvestingAccount accountRoberta = InvestingAccount('Roberta', 2000);

  accountCris.showBalance();
  accountCris.send(4300);

  accountDenize.showBalance();
  accountDenize.send(4300);

  accountDenize.calcIncoming();

  accountMatheus.send(1000);
  accountRoberta.receive(1000);
}
