import 'dart:io';

// 1. Customer Management
// 2. Cab Booking
// 3. Hotel Booking
// 4. Print Bill & Show Receipt
// 5. Exit
class Customer {
  static String custID = ''; // Changed from int to String
  String name = '';
  String gender = '';
  String address = '';
  int age = 0;
  int mobileNo = 0;

  void getData() {
    print('Enter Your Id');

    custID = stdin.readLineSync()!;
    print('Enter Your Name');
    name = stdin.readLineSync()!;
    print('Your Age');

    age = int.parse(stdin.readLineSync()!);
    print('Your Gender');

    gender = stdin.readLineSync()!;
    print('Your  Address');
    address = stdin.readLineSync()!;
    print('Mobile No');
    mobileNo = int.parse(stdin.readLineSync()!);

    File file = File('old_customer.txt');
    file.writeAsStringSync(
      'ID: $custID | Name: $name | Age: $age | Mobile: $mobileNo | Address: $address | Gender: $gender\n',
      mode: FileMode.append,
    );

    print("\n✅ Saved! Customer data recorded.\n");
  }

  showData() {
    try {
      final file = File('old_customer.txt');
      final data = file.readAsLinesSync();
      print("\n📁 Old Customer Records:");

      for (var extractData in data) {
        print(extractData);
      }
    } catch (e) {
      print("❌ Error reading file.");
    }
  }
}

class Cabs {
  int cabChoice = 0;
  int kiloMeters = 0;
  int cabCost = 0;
  static int lastCabCost = 0;

  showCab() {
    print('- - - -  Slect Your cab - - - -');
    print('1. Normal Cab: with  Price: 100');
    print('2. Luxury Cab: with Price: 200');

    cabChoice = int.parse(stdin.readLineSync()!);
    if (cabChoice == 1) {
      cabCost = 100;

      print('Write the Kilometers you have to travel');
      kiloMeters = int.parse(stdin.readLineSync()!);
      lastCabCost = kiloMeters * cabCost;
    } else if (cabChoice == 2) {
      cabCost = 200;

      print('Write the Kilometers');
      kiloMeters = int.parse(stdin.readLineSync()!);
      lastCabCost = kiloMeters * cabCost;
    }
  }
}

class Booking {
  int hotelChoice = 0;

  int roomType = 0;
  static int hotelCost = 0;

  showHotels() {
    print('- - - -  Slect Your Hotel - - - -');
    print('1. Royal Grill');
    print('2. Manchester Cafe');
    print('3. Pizza Line');

    hotelChoice = int.parse(stdin.readLineSync()!);

    if (hotelChoice == 1) {
      print('- - - -  Select the Rooms - - - -');
      print('1. Normal Room Bookig Of Royal Grill: 1000');
      print('2. Luxury Room Booking of Royal Grill:  2000');
      roomType = int.parse(stdin.readLineSync()!);
      if (roomType == 1) {
        hotelCost = 1000;
      } else {
        hotelCost = 2000;
      }
    } else if (hotelChoice == 2) {
      print('- - - -  Select the Rooms - - - -');
      print('1. Normal Room Bookig Of Manchester Cafe: 1000');
      print('2. Luxury Room Booking of Manchester Cafe:  2000');
      roomType = int.parse(stdin.readLineSync()!);

      if (roomType == 1) {
        hotelCost = 1000;
      } else {
        hotelCost = 2000;
      }
    } else if (hotelChoice == 3) {
      print('- - - -  Select the Rooms - - - -');
      print('1. Normal Room Bookig Of Pizza Line: 1000');
      print('2. Luxury Room Booking of Pizza Line:  2000');
      roomType = int.parse(stdin.readLineSync()!);

      if (roomType == 1) {
        hotelCost = 1000;
      } else {
        hotelCost = 2000;
      }
    } else {
      print('پلیز بھائی صحیح ان پٹ دیو' + 'Invalid Hotel Selection');
    }
    print("✅ Hotel booked. Cost: Rs.$hotelCost");
  }
}

class Charges {}

class Bill {
  void printBill() {
    //! Without Declaring them Static :
    // final total = Booking().hotelCost + Cabs().lastCabCost;

    //!  After declarig  the hotelCost and  lastCabCost variables Static :
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

  void ShowBill() {
    try {
      final file = File('receipt.txt');
      final bill = file.readAsLinesSync();

      for (var billData in bill) {
        print(billData);
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

  Bill bill = Bill();

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
    int select = 0;
    select = int.parse(stdin.readLineSync()!);
    switch (select) {
      case 1:
        customer.getData();
        break;

      case 2:
        cabs.showCab();
        break;

      case 3:
        booking.showHotels();
        break;
      case 4:
        bill.printBill();
        print("Show bill now? (1 = Yes):");
        if (stdin.readLineSync() == '1') {
          bill.ShowBill();
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
  print('Enter your  Name as Admin');
  String admin = stdin.readLineSync()!;
  print("✅ Welcome $admin!\n");
  menu();
}
