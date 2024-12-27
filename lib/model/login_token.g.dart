// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginTokenAdapter extends TypeAdapter<LoginToken> {
  @override
  final int typeId = 2;

  @override
  LoginToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginToken(
      expiryDate: fields[1] as DateTime, token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginToken obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._token)
      ..writeByte(1)
      ..write(obj.expiryDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
