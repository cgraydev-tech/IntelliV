import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'inspections_record.g.dart';

abstract class InspectionsRecord
    implements Built<InspectionsRecord, InspectionsRecordBuilder> {
  static Serializer<InspectionsRecord> get serializer =>
      _$inspectionsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'ChassisID')
  String get chassisID;

  @nullable
  @BuiltValueField(wireName: 'FFID')
  String get ffid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InspectionsRecordBuilder builder) => builder
    ..chassisID = ''
    ..ffid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inspections');

  static Stream<InspectionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<InspectionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  InspectionsRecord._();
  factory InspectionsRecord([void Function(InspectionsRecordBuilder) updates]) =
      _$InspectionsRecord;

  static InspectionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createInspectionsRecordData({
  String chassisID,
  String ffid,
}) =>
    serializers.toFirestore(
        InspectionsRecord.serializer,
        InspectionsRecord((i) => i
          ..chassisID = chassisID
          ..ffid = ffid));
