class TaskModel {
  final String name;
  final String picture;
  final int difficulty;
  int level;
  int mastery;

  TaskModel({
    required this.name,
    required this.picture,
    required this.difficulty,
    this.level = 0,
    this.mastery = 0,
  });
}
