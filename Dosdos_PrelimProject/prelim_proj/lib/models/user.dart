class User {
  final String name;
  final int age;
  final String gender;

  User(this.name, this.age, this.gender);

  @override
  String toString() => 'User(name: $name, age: $age, gender: $gender)';
}