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
  @BuiltValueField(wireName: 'Photo_Url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'VehiclesLoc')
  LatLng get vehiclesLoc;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..chassisID = ''
    ..desc = ''
    ..photoUrl = '';

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
          ..photoUrl = snapshot.data['Photo_Url']
          ..vehiclesLoc = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
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
  String photoUrl,
  LatLng vehiclesLoc,
}) =>
    serializers.toFirestore(
        VehiclesRecord.serializer,
        VehiclesRecord((v) => v
          ..chassisID = chassisID
          ..desc = desc
          ..photoUrl = photoUrl
          ..vehiclesLoc = vehiclesLoc));
