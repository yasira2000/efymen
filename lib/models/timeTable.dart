class TimeTable {
  String _description;
  DateTime _startingTime;
  DateTime _endingTime;
  String _location;
  bool _status;

  TimeTable(this._description, this._startingTime, this._endingTime,
      this._location, this._status);

  String get description => _description;
  DateTime get startingTime => _startingTime;
  DateTime get endingTime => _endingTime;
  String get location => _location;
  bool get status => _status;

  set description(String description) {
    _description = description;
  }
}
