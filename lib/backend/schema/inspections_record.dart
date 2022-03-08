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
  @BuiltValueField(wireName: 'inspection_ID')
  int get inspectionID;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'inspected_for')
  DocumentReference get inspectedFor;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InspectionsRecordBuilder builder) => builder
    ..inspectionID = 0
    ..img = '';

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
  int inspectionID,
  String img,
  DocumentReference createdBy,
  DateTime createdAt,
  DocumentReference inspectedFor,
}) =>
    serializers.toFirestore(
        InspectionsRecord.serializer,
        InspectionsRecord((i) => i
          ..inspectionID = inspectionID
          ..img = img
          ..createdBy = createdBy
          ..createdAt = createdAt
          ..inspectedFor = inspectedFor));
