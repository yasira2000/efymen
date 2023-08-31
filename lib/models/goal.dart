class Goal {
  String _description = '';

  Goal(this._description);

  String get description => _description;

  set description(String description) {
    _description = description;
  }
}
