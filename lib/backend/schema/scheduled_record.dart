import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scheduled_record.g.dart';

abstract class ScheduledRecord
    implements Built<ScheduledRecord, ScheduledRecordBuilder> {
  static Serializer<ScheduledRecord> get serializer =>
      _$scheduledRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'schedulued_for')
  DocumentReference get scheduluedFor;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ScheduledRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scheduled');

  static Stream<ScheduledRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ScheduledRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ScheduledRecord._();
  factory ScheduledRecord([void Function(ScheduledRecordBuilder) updates]) =
      _$ScheduledRecord;

  static ScheduledRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createScheduledRecordData({
  DocumentReference createdBy,
  DateTime createdAt,
  DateTime date,
  DocumentReference scheduluedFor,
}) =>
    serializers.toFirestore(
        ScheduledRecord.serializer,
        ScheduledRecord((s) => s
          ..createdBy = createdBy
          ..createdAt = createdAt
          ..date = date
          ..scheduluedFor = scheduluedFor));
