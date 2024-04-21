class ToNotDo {
  ToNotDo({
    required this.title,
    required this.description,
  });

  String title;
  String description;
  bool completed = false;

  void toogle() {
    completed = !completed;
  }
}
