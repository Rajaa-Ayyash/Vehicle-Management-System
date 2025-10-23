import 'enums.dart';

class Engine {
  String _manufacture;
  DateTime _manufactureDate;
  String _model;
  int _capacity;
  int _cylinders;
  FuelType _fuelType;

  Engine()
      : _manufacture = '',
        _manufactureDate = DateTime.now(),
        _model = '',
        _capacity = 0,
        _cylinders = 0,
        _fuelType = FuelType.gasoline;

  Engine.full(this._manufacture, this._manufactureDate, this._model,
      this._capacity, this._cylinders, this._fuelType);

  String get manufacture => _manufacture;
  DateTime get manufactureDate => _manufactureDate;
  String get model => _model;
  int get capacity => _capacity;
  int get cylinders => _cylinders;
  FuelType get fuelType => _fuelType;

  set manufacture(String value) => _manufacture = value;
  set manufactureDate(DateTime value) => _manufactureDate = value;
  set model(String value) => _model = value;
  set capacity(int value) => _capacity = value;
  set cylinders(int value) => _cylinders = value;
  set fuelType(FuelType value) => _fuelType = value;

  
  Map<String, dynamic> toJson() => {
        'manufacture': _manufacture,
        'manufactureDate': _manufactureDate.toIso8601String(),
        'model': _model,
        'capacity': _capacity,
        'cylinders': _cylinders,
        'fuelType': _fuelType.toString().split('.').last,
      };

  Engine.fromJson(Map<String, dynamic> json)
      : _manufacture = json['manufacture'],
        _manufactureDate = DateTime.parse(json['manufactureDate']),
        _model = json['model'],
        _capacity = json['capacity'],
        _cylinders = json['cylinders'],
        _fuelType = FuelType.values.firstWhere(
            (e) => e.toString().split('.').last == json['fuelType']);
}
