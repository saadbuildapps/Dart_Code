import 'dart:io';

class Customer {
  static String custID = ''; // Changed from int to String
  String name = '';
  String gender = '';
  String address = '';
  int age = 0;
  int mobileNo = 0;

  void getData() {
    print("Enter Customer ID:");
    Customer.custID = stdin.readLineSync()!; // Removed int.parse

    print("Enter Name:");
    name = stdin.readLineSync()!;

    print("Enter Age:");
    age = int.parse(stdin.readLineSync()!);

    print("Enter Mobile Number:");
    mobileNo = int.parse(stdin.readLineSync()!);

    print("Enter Address:");
    address = stdin.readLineSync()!;

    print("Enter Gender:");
    gender = stdin.readLineSync()!;

    File file = File('old_customer.txt');
    file.writeAsStringSync(
      'ID: $custID | Name: $name | Age: $age | Mobile: $mobileNo | Address: $address | Gender: $gender\n',
      mode: FileMode.append,
    );

    print("\n✅ Saved! Customer data recorded.\n");
  }

  void showData() {
    try {
      final file = File('old_customer.txt');
      final lines = file.readAsLinesSync();
      print("\n📁 Old Customer Records:");
      for (var line in lines) {
        print(line);
      }
    } catch (e) {
      print("❌ Error reading file.");
    }
  }
}

class Cabs {
  int cabChoice = 0;
  int kilometers = 0;
  double cabCost = 0.0;
  static double lastCabCost = 0.0;

  void cabDetail() {
    print("\n🚕 Cab Options:");
    print("1. Standard Cab - Rs.15/km");
    print("2. Luxury Cab   - Rs.25/km");

    stdout.write("Enter your choice: ");
    cabChoice = int.parse(stdin.readLineSync()!);

    stdout.write("Enter kilometers to travel: ");
    kilometers = int.parse(stdin.readLineSync()!);

    if (cabChoice == 1) {
      cabCost = kilometers * 15;
      print("✅ Standard Cab selected. Cost: Rs.$cabCost");
    } else if (cabChoice == 2) {
      cabCost = kilometers * 25;
      print("✅ Luxury Cab selected. Cost: Rs.$cabCost");
    } else {
      print("❌ Invalid Cab Choice.");
      return;
    }

    lastCabCost = cabCost;
  }
}

class Booking {
  int choiceHotel = 0;
  int packChoice = 0;
  static double hotelCost = 0.0;

  void hotels() {
    print("\n🏨 Hotel Options:");
    print("1. ROYAL GRILL");
    print("2. Manchester CAFE");
    print("3. Pizza Line");
    stdout.write("Enter hotel number to book: ");
    choiceHotel = int.parse(stdin.readLineSync()!);

    if (choiceHotel == 1) {
      print("Packages at ROYAL GRILL:");
      print("1. Standard Pack - Rs.5000");
      print("2. Premium Pack  - Rs.10000");
      print("3. Luxury Pack   - Rs.15000");
      packChoice = int.parse(stdin.readLineSync()!);
      hotelCost = [5000, 10000, 15000][packChoice - 1].toDouble();
    } else if (choiceHotel == 2) {
      print("Packages at Manchester CAFE:");
      print("1. Family Pack - Rs.3000");
      print("2. Couple Pack - Rs.25000");
      print("3. Single Pack - Rs.10000");
      packChoice = int.parse(stdin.readLineSync()!);
      hotelCost = [3000, 25000, 10000][packChoice - 1].toDouble();
    } else if (choiceHotel == 3) {
      print("Packages at Pizza Line:");
      print("1. Special    - Rs.1000");
      print("2. Arrangement- Rs.5000");
      packChoice = int.parse(stdin.readLineSync()!);
      hotelCost = [1000, 5000][packChoice - 1].toDouble();
    } else {
      print("❌ Invalid hotel selection.");
      return;
    }

    print("✅ Hotel booked. Cost: Rs.$hotelCost");
  }
}



class Charges {
  void printBill() {
    final total = Booking.hotelCost + Cabs.lastCabCost;
    final file = File('receipt.txt');
    file.writeAsStringSync("""
--------------- ABC Travel Agency ---------------
--------------------- Receipt -------------------
Customer ID: ${Customer.custID}
-----------------------------------------------
Hotel Cost: Rs.${Booking.hotelCost.toStringAsFixed(2)}
Cab Cost  : Rs.${Cabs.lastCabCost.toStringAsFixed(2)}
-----------------------------------------------
Total     : Rs.${total.toStringAsFixed(2)}
-----------------------------------------------
        THANK YOU FOR USING OUR SERVICE
""");
    print("✅ Bill saved to 'receipt.txt'");
  }

  void showBill() {
    try {
      final file = File('receipt.txt');
      final lines = file.readAsLinesSync();
      for (var line in lines) {
        print(line);
      }
    } catch (e) {
      print("❌ Could not open receipt file.");
    }
  }
}

void menu() {
  Customer customer = Customer();
  Cabs cabs = Cabs();
  Booking booking = Booking();
  Charges charges = Charges();

  while (true) {
    print("""
================= ABC Travel Menu =================
1. Customer Management
2. Cab Booking
3. Hotel Booking
4. Print Bill & Show Receipt
5. Exit
===================================================
Enter your choice:
""");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print("1. Enter New Customer");
        print("2. View Existing Customers");
        int sub = int.parse(stdin.readLineSync()!);
        if (sub == 1) customer.getData();
        if (sub == 2) customer.showData();
        break;
      case 2:
        cabs.cabDetail();
        break;
      case 3:
        booking.hotels();
        break;
      case 4:
        charges.printBill();
        print("Show bill now? (1 = Yes):");
        if (stdin.readLineSync() == '1') {
          charges.showBill();
        }
        break;
      case 5:
        print("👋 Exiting... Goodbye!");
        return;
      default:
        print("❌ Invalid Choice.");
    }
  }
}

void main() {
  stdout.write("👋 Enter your name (Admin): ");
  String admin = stdin.readLineSync()!;
  print("✅ Welcome $admin!\n");
  menu();
}
