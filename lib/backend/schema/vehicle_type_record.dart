import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vehicle_type_record.g.dart';

abstract class VehicleTypeRecord
    implements Built<VehicleTypeRecord, VehicleTypeRecordBuilder> {
  static Serializer<VehicleTypeRecord> get serializer =>
      _$vehicleTypeRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'vehicle_type')
  String get vehicleType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VehicleTypeRecordBuilder builder) => builder
    ..name = ''
    ..vehicleType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicle_type');

  static Stream<VehicleTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VehicleTypeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VehicleTypeRecord._();
  factory VehicleTypeRecord([void Function(VehicleTypeRecordBuilder) updates]) =
      _$VehicleTypeRecord;

  static VehicleTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVehicleTypeRecordData({
  String name,
  String vehicleType,
}) =>
    serializers.toFirestore(
        VehicleTypeRecord.serializer,
        VehicleTypeRecord((v) => v
          ..name = name
          ..vehicleType = vehicleType));
