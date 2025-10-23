import 'dart:io';
import './vehicle_manager.dart';

void main() {
  VehicleManager manager = VehicleManager();
  manager.loadData();

  while (true) {
    print('\n--- Vehicle Management ---');
    print('1. Add Motorcycle');
    print('2. Add Car');
    print('3. Add Truck');
    print('4. Delete Vehicle by Plate');
    print('5. Show All Vehicles');
    print('6. Search by Company');
    print('7. Search by Plate');
    print('8. Insert Vehicle at Position');
    print('9. Modify Vehicle');
    print('10. Save & Exit');

    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    manager.handleMenuChoice(choice);
  }
}
