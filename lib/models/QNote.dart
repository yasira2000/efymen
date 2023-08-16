class QNote {
  String _description = '';
  String _priority = '';

  QNote(this._description, this._priority);

  String get description => _description;
  String get priority => _priority;

  set description(String description) {
    _description = description;
  }

  set time(String priority) {
    _priority = priority;
  }

  QNote.fromMap(Map<String, dynamic> map) {
    _description = map['description'];
    _priority = map['priority'];
  }
}
