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
  @BuiltValueField(wireName: 'ChassisID')
  String get chassisID;

  @nullable
  @BuiltValueField(wireName: 'Desc')
  String get desc;

  @nullable
  @BuiltValueField(wireName: 'Img')
  String get img;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..chassisID = ''
    ..desc = ''
    ..img = ''
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicles');

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static VehiclesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VehiclesRecord(
        (c) => c
          ..chassisID = snapshot.data['ChassisID']
          ..desc = snapshot.data['Desc']
          ..img = snapshot.data['Img']
          ..status = snapshot.data['status']
          ..reference = VehiclesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VehiclesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'vehicles',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  VehiclesRecord._();
  factory VehiclesRecord([void Function(VehiclesRecordBuilder) updates]) =
      _$VehiclesRecord;

  static VehiclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVehiclesRecordData({
  String chassisID,
  String desc,
  String img,
  String status,
}) =>
    serializers.toFirestore(
        VehiclesRecord.serializer,
        VehiclesRecord((v) => v
          ..chassisID = chassisID
          ..desc = desc
          ..img = img
          ..status = status));
