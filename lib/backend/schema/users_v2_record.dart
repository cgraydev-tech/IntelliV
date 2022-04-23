import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_v2_record.g.dart';

abstract class UsersV2Record
    implements Built<UsersV2Record, UsersV2RecordBuilder> {
  static Serializer<UsersV2Record> get serializer => _$usersV2RecordSerializer;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  bool get isAdmin;

  @nullable
  bool get isStandard;

  @nullable
  bool get isExt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersV2RecordBuilder builder) => builder
    ..email = ''
    ..password = ''
    ..isAdmin = false
    ..isStandard = false
    ..isExt = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersV2');

  static Stream<UsersV2Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersV2Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersV2Record._();
  factory UsersV2Record([void Function(UsersV2RecordBuilder) updates]) =
      _$UsersV2Record;

  static UsersV2Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersV2RecordData({
  String email,
  String password,
  bool isAdmin,
  bool isStandard,
  bool isExt,
}) =>
    serializers.toFirestore(
        UsersV2Record.serializer,
        UsersV2Record((u) => u
          ..email = email
          ..password = password
          ..isAdmin = isAdmin
          ..isStandard = isStandard
          ..isExt = isExt));
