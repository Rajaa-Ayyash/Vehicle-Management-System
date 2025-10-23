import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Motorcycle extends Automobile {
  double _tierDiameter;
  double _length;

  Motorcycle()
      : _tierDiameter = 0.0,
        _length = 0.0,
        super();

  Motorcycle.full(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      this._tierDiameter,
      this._length)
      : super.full(
            manufactureCompany,
            manufactureDate,
            model,
            engine,
            plateNum,
            gearType,
            bodySerialNum);

  double get tierDiameter => _tierDiameter;
  double get length => _length;

  set tierDiameter(double value) => _tierDiameter = value;
  set length(double value) => _length = value;

 
  @override
  Map<String, dynamic> toJson() {
    var data = super.toJson();
    data.addAll({'tierDiameter': _tierDiameter, 'length': _length});
    return data;
  }

  Motorcycle.fromJson(Map<String, dynamic> json)
      : _tierDiameter = json['tierDiameter'],
        _length = json['length'],
        super.fromJson(json);
}
