import 'dart:io';
import 'dart:convert';

import 'package:vehicle_oop_task/motorcycle.dart';
import 'package:vehicle_oop_task/car.dart';
import 'package:vehicle_oop_task/truck.dart';
import 'package:vehicle_oop_task/engine.dart';
import 'package:vehicle_oop_task/enums.dart';
import 'package:vehicle_oop_task/automobile.dart';

class VehicleManager {
  List<Motorcycle> motorcycles = [];
  List<Car> cars = [];
  List<Truck> trucks = [];

 
  
  // =============للطباعة=============
  void printMotorcycle(Motorcycle? m) {
    if (m == null) return;
    print('--- Motorcycle Info ---');
    print('Company: ${m.manufactureCompany}');
    print('Model: ${m.model}');
    print('Engine: ${m.engine.model}');
    print('Plate: ${m.plateNum}');
    print('Tier Diameter: ${m.tierDiameter}');
    print('Length: ${m.length}');
    print('Body Serial: ${m.bodySerialNum}');
  }

  void printCar(Car? c) {
    if (c == null) return;
    print('--- Car Info ---');
    print('Company: ${c.manufactureCompany}');
    print('Model: ${c.model}');
    print('Engine: ${c.engine.model}');
    print('Plate: ${c.plateNum}');
    print('Length: ${c.length}');
    print('Width: ${c.width}');
    print('Color: ${c.color}');
    print('Chair Num: ${c.chairNum}');
    print('Leather Furniture: ${c.isFurnitureLeather}');
    print('Body Serial: ${c.bodySerialNum}');
  }

  void printTruck(Truck? t) {
    if (t == null) return;
    print('--- Truck Info ---');
    print('Company: ${t.manufactureCompany}');
    print('Model: ${t.model}');
    print('Engine: ${t.engine.model}');
    print('Plate: ${t.plateNum}');
    print('Length: ${t.length}');
    print('Width: ${t.width}');
    print('Color: ${t.color}');
    print('Free Weight: ${t.freeWeight}');
    print('Full Weight: ${t.fullWeight}');
    print('Body Serial: ${t.bodySerialNum}');
  }

  void printAll() {
    if (motorcycles.isEmpty && cars.isEmpty && trucks.isEmpty) {
      print('No vehicles found.');
      return;
    }

    if (motorcycles.isNotEmpty) {
      print('\n===== All Motorcycles =====');
      for (var m in motorcycles) printMotorcycle(m);
    }

    if (cars.isNotEmpty) {
      print('\n===== All Cars =====');
      for (var c in cars) printCar(c);
    }

    if (trucks.isNotEmpty) {
      print('\n===== All Trucks =====');
      for (var t in trucks) printTruck(t);
    }
  }

  
  // ===========الإضافة والحذف===============
  void addMotorcycle(Motorcycle m) => motorcycles.add(m);
  void addCar(Car c) => cars.add(c);
  void addTruck(Truck t) => trucks.add(t);

  void deleteMotorcycle(int plateNum) =>
      motorcycles.removeWhere((m) => m.plateNum == plateNum);
  void deleteCar(int plateNum) => cars.removeWhere((c) => c.plateNum == plateNum);
  void deleteTruck(int plateNum) =>
      trucks.removeWhere((t) => t.plateNum == plateNum);

 
  // ===========للبحث===============
  List<Automobile> searchByCompany(String company) {
    List<Automobile> result = [];
    result.addAll(motorcycles.where((m) => m.manufactureCompany == company));
    result.addAll(cars.where((c) => c.manufactureCompany == company));
    result.addAll(trucks.where((t) => t.manufactureCompany == company));
    return result;
  }

  List<Automobile> searchByPlate(int plate) {
    List<Automobile> result = [];
    result.addAll(motorcycles.where((m) => m.plateNum == plate));
    result.addAll(cars.where((c) => c.plateNum == plate));
    result.addAll(trucks.where((t) => t.plateNum == plate));
    return result;
  }

  

  // =============تعديل المركبات=============
  void modifyCar(int plateNum) {
  Car? car;
  for (var c in cars) {
    if (c.plateNum == plateNum) {
      car = c;
      break;
    }
  }

  if (car == null) {
    print('Car not found.');
    return;
  }

  print('--- Modify Car ---');
  stdout.write('Enter new color (leave empty to keep current): ');
  String? color = stdin.readLineSync();
  if (color != null && color.isNotEmpty) car.color = color;

  stdout.write('Enter new chair number (leave empty to keep current): ');
  String? chairs = stdin.readLineSync();
  if (chairs != null && chairs.isNotEmpty) {
    try {
      car.chairNum = int.parse(chairs);
    } catch (e) {
      print('Invalid chair number input.');
    }
  }

  stdout.write('Enter new body serial (leave empty to keep current): ');
  String? body = stdin.readLineSync();
  if (body != null && body.isNotEmpty) {
    try {
      car.bodySerialNum = int.parse(body);
    } catch (e) {
      print('Invalid body serial input.');
    }
  }

  print('Car updated successfully.');
}



  // ============الانسيرت في بوزشن محدد==============
  void insertCarAt(int index, Car c) {
    if (index >= 0 && index <= cars.length) {
      cars.insert(index, c);
      print('Car inserted at position $index.');
    } else {
      print('Invalid index.');
    }
  }


  void saveData() {
    File('motorcycles.json').writeAsStringSync(
        jsonEncode(motorcycles.map((m) => m.toJson()).toList()));
    File('cars.json')
        .writeAsStringSync(jsonEncode(cars.map((c) => c.toJson()).toList()));
    File('trucks.json')
        .writeAsStringSync(jsonEncode(trucks.map((t) => t.toJson()).toList()));
    print('Data saved successfully.');
  }

  void loadData() {
    if (File('motorcycles.json').existsSync()) {
      var data = File('motorcycles.json').readAsStringSync();
      if (data.isNotEmpty) {
        motorcycles = (jsonDecode(data) as List)
            .map((m) => Motorcycle.fromJson(m))
            .toList();
      }
    }

    if (File('cars.json').existsSync()) {
      var data = File('cars.json').readAsStringSync();
      if (data.isNotEmpty) {
        cars = (jsonDecode(data) as List).map((c) => Car.fromJson(c)).toList();
      }
    }

    if (File('trucks.json').existsSync()) {
      var data = File('trucks.json').readAsStringSync();
      if (data.isNotEmpty) {
        trucks =
            (jsonDecode(data) as List).map((t) => Truck.fromJson(t)).toList();
      }
    }

    print('Data loaded successfully.');
  }

 
  // ============menuالـ==============
  void handleMenuChoice(String? choice) {
    switch (choice) {
      case '1':
        addMotorcycle(Motorcycle.full(
          'Honda',
          DateTime(2023, 5, 1),
          'CBR',
          Engine.full('Honda', DateTime(2023, 5, 1), 'V2', 600, 2, FuelType.gasoline),
          1234,
          GearType.normal,
          1111,
          17.0,
          2.1,
        ));
        print('Motorcycle added.');
        break;
      case '2':
        addCar(Car.full(
          'Toyota',
          DateTime(2022, 3, 10),
          'Corolla',
          Engine.full('Toyota', DateTime(2022, 3, 10), '1.8L', 1800, 4, FuelType.gasoline),
          5678,
          GearType.automatic,
          2222,
          450,
          180,
          'Red',
          5,
          true,
        ));
        print('Car added.');
        break;
      case '3':
        addTruck(Truck.full(
          'Ford',
          DateTime(2021, 7, 20),
          'F150',
          Engine.full('Ford', DateTime(2021, 7, 20), 'V8', 5000, 8, FuelType.diesel),
          9999,
          GearType.normal,
          3333,
          600,
          250,
          'Blue',
          3000.0,
          5000.0,
        ));
        print('Truck added.');
        break;
      case '4':
        stdout.write('Enter Plate Number to delete: ');
        int plate = int.parse(stdin.readLineSync()!);
        deleteMotorcycle(plate);
        deleteCar(plate);
        deleteTruck(plate);
        print('Vehicle deleted if existed.');
        break;
      case '5':
        printAll();
        break;
      case '6':
        stdout.write('Enter Company Name to search: ');
        String company = stdin.readLineSync()!;
        var results = searchByCompany(company);
        if (results.isEmpty) {
          print('No vehicles found for company $company.');
        } else {
          for (var r in results) {
            if (r is Motorcycle) printMotorcycle(r);
            if (r is Car) printCar(r);
            if (r is Truck) printTruck(r);
          }
        }
        break;
      case '7':
        stdout.write('Enter Plate Number to search: ');
        int plate = int.parse(stdin.readLineSync()!);
        var results = searchByPlate(plate);
        if (results.isEmpty) {
          print('No vehicles found for plate $plate.');
        } else {
          for (var r in results) {
            if (r is Motorcycle) printMotorcycle(r);
            if (r is Car) printCar(r);
            if (r is Truck) printTruck(r);
          }
        }
        break;
      case '8':
        stdout.write('Enter index to insert car: ');
        int index = int.parse(stdin.readLineSync()!);
        insertCarAt(index, Car.full(
          'Hyundai',
          DateTime(2021, 9, 15),
          'Elantra',
          Engine.full('Hyundai', DateTime(2021, 9, 15), '1.6L', 1600, 4, FuelType.gasoline),
          7777,
          GearType.automatic,
          8888,
          460,
          190,
          'White',
          5,
          false,
        ));
        break;
      case '9':
        stdout.write('Enter car plate number to modify: ');
        int plate = int.parse(stdin.readLineSync()!);
        modifyCar(plate);
        break;
      case '10':
        saveData();
        print('Exiting...');
        exit(0);
      default:
        print('Invalid option, try again.');
    }
  }
}
