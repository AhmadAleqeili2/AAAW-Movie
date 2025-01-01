import 'package:hive/hive.dart';
part "user.g.dart";

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? _email;
  @HiveField(1)
  String? _firstName;
  @HiveField(2)
  String? _lastName;
  @HiveField(3)
  String? _password;
  @HiveField(4)
  int? _age;
  @HiveField(5)
  String? _gender;
 @HiveField(6)
  String? _image;

  String? email() {
    return _email;
  }
  String? image() {
    return _image;
  }
  String? firstName() => _firstName;

  String? lastName() => _lastName;

  String? password() => _password;

  get age => _age;

  String? gender() => _gender;
  void setPass(String pass) => _password = pass;
  void setEmail(String email) => _email = email;
  void setFirstName(String name) => _firstName = name;
  void setLastName(String name) => _lastName = name;
  void setAge(int age) => _age = age;
  void setGender(String gender) => _gender = gender;
  void setImage(String image) => _image = image;

  User();
}
