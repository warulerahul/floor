import 'package:floor/floor.dart';

@Entity(
  tableName: 'dog',
  /*foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      onDelete: ForeignKeyAction.CASCADE,
    )
  ],*/
)
class Dog {
  @primaryKey
  final int id;

  @ColumnInfo(name: 'nick_name')
  final String nickName;

  @ColumnInfo(name: 'owner_id')
  final int ownerId;

  Dog(this.id, this.nickName, this.ownerId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Dog &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              nickName == other.nickName &&
              ownerId == other.ownerId;

  @override
  int get hashCode =>
      id.hashCode  ^ nickName.hashCode ^ ownerId.hashCode;

  @override
  String toString() {
    return 'Dog{id: $id, nickName: $nickName, ownerId: $ownerId}';
  }
}