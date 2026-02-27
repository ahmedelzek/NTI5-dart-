import 'dart:io';

void main() {

  print("Welcome To Our Theater\n");
  List<List<String>> seats =
      List.generate(5, (_) => List.generate(5, (_) => 'E'));
  Map<String, Map<String, String>> bookings = {};

  while (true) {
    print("press 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");

    stdout.write("choose the operation: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        bookSeat(seats, bookings);
        break;

      case '2':
        showSeats(seats);
        break;

      case '3':
        showBookings(bookings);
        break;

      case '4':
        print("See You Back");
        return;

      default:
        print("Invalid choice!");
    }
  }
}

void bookSeat(List<List<String>> seats, Map<String, Map<String, String>> bookings) {
  stdout.write("Enter row (1-5) or 'exit' to quit: ");
  String? rowInput = stdin.readLineSync();

  if (rowInput == 'exit') return;

  int row = int.parse(rowInput!);

  stdout.write("Enter column (1-5): ");
  int col = int.parse(stdin.readLineSync()!);

  if (row < 1 || row > 5 || col < 1 || col > 5) {
    print("Invalid seat position!");
    return;
  }

  if (seats[row - 1][col - 1] == 'B') {
    print("Seat already booked!");
    return;
  }

  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter your phone number: ");
  String phone = stdin.readLineSync()!;

  seats[row - 1][col - 1] = 'B';

  bookings["$row,$col"] = {
    "name": name,
    "phone": phone,
  };

  print("Seat booked successfully!");
}

void showSeats(List<List<String>> seats) {
  print("\nTheater Seats:");
  for (var row in seats) {
    print(row.join(" "));
  }
}

void showBookings(Map<String, Map<String, String>> bookings) {
  if (bookings.isEmpty) {
    print("No bookings yet.");
    return;
  }

  print("\nUsers Booking Details:");
  bookings.forEach((seat, user) {
    print("Seat $seat: ${user['name']} - ${user['phone']}");
  });
}
