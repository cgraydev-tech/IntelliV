import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'equipment_record.g.dart';

abstract class EquipmentRecord
    implements Built<EquipmentRecord, EquipmentRecordBuilder> {
  static Serializer<EquipmentRecord> get serializer =>
      _$equipmentRecordSerializer;

  @nullable
  String get equipID;

  @nullable
  @BuiltValueField(wireName: 'EquipDesc')
  String get equipDesc;

  @nullable
  @BuiltValueField(wireName: 'EquipIMG')
  String get equipIMG;

  @nullable
  @BuiltValueField(wireName: 'AssetLoc')
  LatLng get assetLoc;

  @nullable
  @BuiltValueField(wireName: 'AssignedVehicle')
  String get assignedVehicle;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EquipmentRecordBuilder builder) => builder
    ..equipID = ''
    ..equipDesc = ''
    ..equipIMG = ''
    ..assignedVehicle = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('equipment');

  static Stream<EquipmentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EquipmentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static EquipmentRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EquipmentRecord(
        (c) => c
          ..equipID = snapshot.data['equipID']
          ..equipDesc = snapshot.data['EquipDesc']
          ..equipIMG = snapshot.data['EquipIMG']
          ..assetLoc = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..assignedVehicle = snapshot.data['AssignedVehicle']
          ..reference = EquipmentRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EquipmentRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'equipment',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  EquipmentRecord._();
  factory EquipmentRecord([void Function(EquipmentRecordBuilder) updates]) =
      _$EquipmentRecord;

  static EquipmentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEquipmentRecordData({
  String equipID,
  String equipDesc,
  String equipIMG,
  LatLng assetLoc,
  String assignedVehicle,
}) =>
    serializers.toFirestore(
        EquipmentRecord.serializer,
        EquipmentRecord((e) => e
          ..equipID = equipID
          ..equipDesc = equipDesc
          ..equipIMG = equipIMG
          ..assetLoc = assetLoc
          ..assignedVehicle = assignedVehicle));
