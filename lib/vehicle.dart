import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Vehicle extends Automobile {
  int _length;
  int _width;
  String _color;

  Vehicle() : _length = 0, _width = 0, _color = '', super();

  Vehicle.full(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      this._length,
      this._width,
      this._color)
      : super.full(
            manufactureCompany,
            manufactureDate,
            model,
            engine,
            plateNum,
            gearType,
            bodySerialNum);

  int get length => _length;
  int get width => _width;
  String get color => _color;

  set length(int value) => _length = value;
  set width(int value) => _width = value;
  set color(String value) => _color = value;

  @override
  Map<String, dynamic> toJson() {
    var data = super.toJson();
    data.addAll({'length': _length, 'width': _width, 'color': _color});
    return data;
  }

  Vehicle.fromJson(Map<String, dynamic> json)
      : _length = json['length'],
        _width = json['width'],
        _color = json['color'],
        super.fromJson(json);
}
