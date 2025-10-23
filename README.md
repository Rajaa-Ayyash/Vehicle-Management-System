# Vehicle Management System (OOP Project)

## Overview
This is a **Vehicle Management System** implemented in **Dart** following **Object-Oriented Programming (OOP) principles**.  
The system manages different types of vehicles: **Motorcycles**, **Cars**, and **Trucks**, allowing users to **add, delete, modify, and search vehicles**, as well as **persist data in JSON files**.

---

## Features
- **Add Vehicles:** Add new motorcycles, cars, or trucks to the system.
- **Delete Vehicles:** Remove vehicles by their plate number.
- **Modify Vehicles:** Update specific vehicle properties such as color, chair numbers, or body serial number.
- **Insert Vehicles at Specific Positions:** Insert a car at a specific index in the list.
- **Search Vehicles:**
  - By manufacture company
  - By plate number
  - By manufacture date
- **Display Functions:**
  - Display information for individual vehicles (`printMotorcycle`, `printCar`, `printTruck`)
  - Display all vehicles (`printAll`)
- **Data Persistence:**
  - Saves all vehicles into JSON files on exit
  - Loads vehicles from JSON files on start

---

## Classes & Structure
- `Automobile` (Base Class)
- `Motorcycle`, `Car`, `Truck` (Inherit from `Automobile`)
- `Engine` (Represents the engine of a vehicle)
- `VehicleManager` (Handles all operations: add, delete, modify, search, save/load)
- `enums.dart` (Contains `FuelType`, `GearType`, and other enumerations)
