class Pomodoru {
  String _description = '';
  final DateTime _start;
  final String _type;

  Pomodoru(this._description, this._start, this._type);

  String get description => _description;
  DateTime get start => _start;
  String get type => _type;

  set description(String description) {
    _description = description;
  }
}
