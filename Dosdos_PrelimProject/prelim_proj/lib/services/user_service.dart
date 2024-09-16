import '../models/user.dart';

class UserService {
  final List<User> _users = [];

  // Add a new user to the list
  void addUser(String name, int age, String gender) {
    final user = User(name, age, gender);
    _users.add(user);
    print("");
    print('User added: $user');
  }

  // List all users
  void listUsers() {
    if (_users.isEmpty) {
      print('\nNo users available.');
    } else {
      print('\nListing users:');
      for (var user in _users) {
        print(user);
      }
    }
  }

  // Delete a user by name
  void deleteUser(String name) {
    final userToDelete = _users.firstWhere(
      (user) => user.name == name,
      orElse: () => User('', 0, ''),
    );

    if (userToDelete.name.isEmpty) {
      print('\nUser not found.');
    } else {
      _users.remove(userToDelete);
      print("");
      print('User deleted: $name');
    }
  }
}