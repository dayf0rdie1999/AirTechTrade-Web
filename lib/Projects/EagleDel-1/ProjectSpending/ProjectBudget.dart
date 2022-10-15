class ProjectBudget {

  late final double projectGoal;
  late final double currentMoney;

  ProjectBudget(this.projectGoal, this.currentMoney);

  double calculatePercentCompleted() {
    return (currentMoney / projectGoal) * 100;
  }

}
