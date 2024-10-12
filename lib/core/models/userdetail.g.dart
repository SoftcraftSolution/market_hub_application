// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdetail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailAdapter extends TypeAdapter<UserDetail> {
  @override
  final int typeId = 1;

  @override
  UserDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetail(
      phoneNumber: fields[2] as String,
      pincode: fields[4] as String,
      visitingCard: fields[5] as String,
      email: fields[3] as String,
      name: fields[0] as String,
      whatsappNumber: fields[1] as String,
      pin: fields[6] as String?,
      plan: fields[7] as String?,
      city: fields[8] as String?,
      state: fields[9] as String?,
      country: fields[10] as String?,
      isApproved: fields[11] as bool?,
      extendendDays: fields[12] as int?,
      isRejected: fields[13] as bool?,
      isInTrail: fields[14] as bool?,
      isFreeUser: fields[15] as bool?,
      planEndDate: fields[17] as String?,
      planStartDate: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetail obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.whatsappNumber)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.pincode)
      ..writeByte(5)
      ..write(obj.visitingCard)
      ..writeByte(6)
      ..write(obj.pin)
      ..writeByte(7)
      ..write(obj.plan)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.isApproved)
      ..writeByte(12)
      ..write(obj.extendendDays)
      ..writeByte(13)
      ..write(obj.isRejected)
      ..writeByte(14)
      ..write(obj.isInTrail)
      ..writeByte(15)
      ..write(obj.isFreeUser)
      ..writeByte(16)
      ..write(obj.planStartDate)
      ..writeByte(17)
      ..write(obj.planEndDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
