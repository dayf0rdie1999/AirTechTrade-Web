class ProjectDetailProgression {
  late final String title;
  late final String projectDetailName;
  late final double progress;

  ProjectDetailProgression(this.title, this.projectDetailName, this.progress);
}

class ProjectDetailProgressionList {
  final research = ProjectDetailProgression(
    "Study",
    "Learning & Calculating the properties of the drone",
    0.5,
  );

  final design = ProjectDetailProgression(
    "Design & Research",
    "Designing and searching for the suitable components",
    0.9,
  );

  final manufacture = ProjectDetailProgression(
    "Order & Manufacture",
    "Ordering and Manufacturing the components",
    0.0,
  );

  final assemble = ProjectDetailProgression(
    "Assembly",
    "Attaching, soldering and programming all the components together",
    0.0,
  );

  final testing = ProjectDetailProgression("Testing",
      "Testing stress, performance and efficiency of the design", 0.0);

  late final List<ProjectDetailProgression> projectDetailList;

  ProjectDetailProgressionList() {
    projectDetailList = [research,design,manufacture,assemble,testing];
  }
}
