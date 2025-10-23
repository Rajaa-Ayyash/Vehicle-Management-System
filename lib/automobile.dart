import 'engine.dart';
import 'enums.dart';

class Automobile {
  String _manufactureCompany;
  DateTime _manufactureDate;
  String _model;
  Engine _engine;
  int _plateNum;
  GearType _gearType;
  int _bodySerialNum;

  Automobile()
      : _manufactureCompany = '',
        _manufactureDate = DateTime.now(),
        _model = '',
        _engine = Engine(),
        _plateNum = 0,
        _gearType = GearType.normal,
        _bodySerialNum = 0;

  Automobile.full(this._manufactureCompany, this._manufactureDate, this._model,
      this._engine, this._plateNum, this._gearType, this._bodySerialNum);

  String get manufactureCompany => _manufactureCompany;
  DateTime get manufactureDate => _manufactureDate;
  String get model => _model;
  Engine get engine => _engine;
  int get plateNum => _plateNum;
  GearType get gearType => _gearType;
  int get bodySerialNum => _bodySerialNum;

  set manufactureCompany(String value) => _manufactureCompany = value;
  set manufactureDate(DateTime value) => _manufactureDate = value;
  set model(String value) => _model = value;
  set engine(Engine value) => _engine = value;
  set plateNum(int value) => _plateNum = value;
  set gearType(GearType value) => _gearType = value;
  set bodySerialNum(int value) => _bodySerialNum = value;

  
  Map<String, dynamic> toJson() => {
        'manufactureCompany': _manufactureCompany,
        'manufactureDate': _manufactureDate.toIso8601String(),
        'model': _model,
        'engine': _engine.toJson(),
        'plateNum': _plateNum,
        'gearType': _gearType.toString().split('.').last,
        'bodySerialNum': _bodySerialNum,
      };

  Automobile.fromJson(Map<String, dynamic> json)
      : _manufactureCompany = json['manufactureCompany'],
        _manufactureDate = DateTime.parse(json['manufactureDate']),
        _model = json['model'],
        _engine = Engine.fromJson(json['engine']),
        _plateNum = json['plateNum'],
        _gearType = GearType.values.firstWhere(
            (e) => e.toString().split('.').last == json['gearType']),
        _bodySerialNum = json['bodySerialNum'];
}
