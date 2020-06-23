class Transaction{
  int _type;
  String _title;
  String _content;
  String _dateTime;
  String _status;
  double _price;


  Transaction(this._type, this._title, this._content, this._dateTime,
      this._status, this._price);

  int get type => _type;

  set type(int value) {
    _type = value;
  }

  String get title => _title;

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get dateTime => _dateTime;

  set dateTime(String value) {
    _dateTime = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  set title(String value) {
    _title = value;
  }
}