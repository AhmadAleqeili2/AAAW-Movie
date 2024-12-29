import 'package:hive/hive.dart';
part "login_token.g.dart";

@HiveType(typeId: 2)
class LoginToken {
  @HiveField(0)
  final String? _token;
  @HiveField(1)
  final DateTime expiryDate;
 DateTime getExpiry()=>expiryDate;
  LoginToken({
    required String? token,
    required this.expiryDate,
  }) : _token = token;

}
