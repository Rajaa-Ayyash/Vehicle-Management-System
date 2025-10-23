import 'vehicle.dart';
import 'engine.dart';
import 'enums.dart';

class Truck extends Vehicle {
  double _freeWeight;
  double _fullWeight;

  Truck()
      : _freeWeight = 0.0,
        _fullWeight = 0.0,
        super();

  Truck.full(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      int length,
      int width,
      String color,
      this._freeWeight,
      this._fullWeight)
      : super.full(
            manufactureCompany,
            manufactureDate,
            model,
            engine,
            plateNum,
            gearType,
            bodySerialNum,
            length,
            width,
            color);

  double get freeWeight => _freeWeight;
  double get fullWeight => _fullWeight;

  set freeWeight(double value) => _freeWeight = value;
  set fullWeight(double value) => _fullWeight = value;

  
  @override
  Map<String, dynamic> toJson() {
    var data = super.toJson();
    data.addAll({'freeWeight': _freeWeight, 'fullWeight': _fullWeight});
    return data;
  }

  Truck.fromJson(Map<String, dynamic> json)
      : _freeWeight = json['freeWeight'],
        _fullWeight = json['fullWeight'],
        super.fromJson(json);
}
