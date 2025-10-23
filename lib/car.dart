import 'vehicle.dart';
import 'engine.dart';
import 'enums.dart';

class Car extends Vehicle {
  int _chairNum;
  bool _isFurnitureLeather;

  Car()
      : _chairNum = 0,
        _isFurnitureLeather = false,
        super();

  Car.full(
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
      this._chairNum,
      this._isFurnitureLeather)
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

  int get chairNum => _chairNum;
  bool get isFurnitureLeather => _isFurnitureLeather;

  set chairNum(int value) => _chairNum = value;
  set isFurnitureLeather(bool value) => _isFurnitureLeather = value;

 
  @override
  Map<String, dynamic> toJson() {
    var data = super.toJson();
    data.addAll({
      'chairNum': _chairNum,
      'isFurnitureLeather': _isFurnitureLeather,
    });
    return data;
  }

  Car.fromJson(Map<String, dynamic> json)
      : _chairNum = json['chairNum'],
        _isFurnitureLeather = json['isFurnitureLeather'],
        super.fromJson(json);
}
