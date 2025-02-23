abstract class Pontuation {
  void calcPoints();
  void returnPosition();
}

abstract class Sport {
  String team;

  Sport(this.team);
}

class Volei extends Sport implements Pontuation {
  int points = 0;
  int position = 0;
  Volei(super.time);

  @override
  void calcPoints() {
    points += 1;
    print('Points: ${points}');
  }

  @override
  void returnPosition() {
    position += 1;
    print('Position: ${position}');
  }
}
