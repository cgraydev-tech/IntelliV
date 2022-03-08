import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vehicles_record.g.dart';

abstract class VehiclesRecord
    implements Built<VehiclesRecord, VehiclesRecordBuilder> {
  static Serializer<VehiclesRecord> get serializer =>
      _$vehiclesRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: 'vehicle_type')
  DocumentReference get vehicleType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..name = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicles');

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VehiclesRecord._();
  factory VehiclesRecord([void Function(VehiclesRecordBuilder) updates]) =
      _$VehiclesRecord;

  static VehiclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVehiclesRecordData({
  String name,
  String img,
  DocumentReference vehicleType,
}) =>
    serializers.toFirestore(
        VehiclesRecord.serializer,
        VehiclesRecord((v) => v
          ..name = name
          ..img = img
          ..vehicleType = vehicleType));
