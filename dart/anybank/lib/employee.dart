class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void startWork() {
    print('Working...');
  }
}

class Cook extends Employee {
  Cook(super.name, super.salary);

  @override
  void startWork() {
    print('Cooking...');
  }
}

class Waiter extends Employee {
  Waiter(super.name, super.salary);

  @override
  void startWork() {
    print('Serving...');
  }
}

class Manager extends Employee {
  Manager(super.name, super.salary);

  @override
  void startWork() {
    print('Managing...');
  }
}
