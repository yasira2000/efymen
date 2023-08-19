class Scheduled {
  String _description = '';
  DateTime _date;

  Scheduled(this._description, this._date);

  String get description => _description;
  DateTime get date => _date;

  set description(String description) {
    _description = description;
  }

  set time(DateTime date) {
    _date = date;
  }
}
