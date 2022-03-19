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
  @BuiltValueField(wireName: 'Horn')
  String get horn;

  @nullable
  @BuiltValueField(wireName: 'Steering')
  String get steering;

  @nullable
  @BuiltValueField(wireName: 'Brakes')
  String get brakes;

  @nullable
  @BuiltValueField(wireName: 'CabElectrics')
  String get cabElectrics;

  @nullable
  @BuiltValueField(wireName: 'Exhaust')
  String get exhaust;

  @nullable
  @BuiltValueField(wireName: 'WipersWashers')
  String get wipersWashers;

  @nullable
  @BuiltValueField(wireName: 'Mirrors')
  String get mirrors;

  @nullable
  @BuiltValueField(wireName: 'Glass')
  String get glass;

  @nullable
  @BuiltValueField(wireName: 'LightsIndicators')
  String get lightsIndicators;

  @nullable
  @BuiltValueField(wireName: 'Fuel')
  String get fuel;

  @nullable
  @BuiltValueField(wireName: 'Oil')
  String get oil;

  @nullable
  @BuiltValueField(wireName: 'LoadSecurity')
  String get loadSecurity;

  @nullable
  @BuiltValueField(wireName: 'ElectricalConnections')
  String get electricalConnections;

  @nullable
  @BuiltValueField(wireName: 'Markers')
  String get markers;

  @nullable
  @BuiltValueField(wireName: 'Reflectors')
  String get reflectors;

  @nullable
  @BuiltValueField(wireName: 'BodySecurity')
  String get bodySecurity;

  @nullable
  @BuiltValueField(wireName: 'TyresWheels')
  String get tyresWheels;

  @nullable
  @BuiltValueField(wireName: 'BatterySecurity')
  String get batterySecurity;

  @nullable
  @BuiltValueField(wireName: 'BatteryCondition')
  String get batteryCondition;

  @nullable
  @BuiltValueField(wireName: 'Wings')
  String get wings;

  @nullable
  @BuiltValueField(wireName: 'Mudflaps')
  String get mudflaps;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InspectionsRecordBuilder builder) => builder
    ..chassisID = ''
    ..ffid = ''
    ..horn = ''
    ..steering = ''
    ..brakes = ''
    ..cabElectrics = ''
    ..exhaust = ''
    ..wipersWashers = ''
    ..mirrors = ''
    ..glass = ''
    ..lightsIndicators = ''
    ..fuel = ''
    ..oil = ''
    ..loadSecurity = ''
    ..electricalConnections = ''
    ..markers = ''
    ..reflectors = ''
    ..bodySecurity = ''
    ..tyresWheels = ''
    ..batterySecurity = ''
    ..batteryCondition = ''
    ..wings = ''
    ..mudflaps = '';

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
  String horn,
  String steering,
  String brakes,
  String cabElectrics,
  String exhaust,
  String wipersWashers,
  String mirrors,
  String glass,
  String lightsIndicators,
  String fuel,
  String oil,
  String loadSecurity,
  String electricalConnections,
  String markers,
  String reflectors,
  String bodySecurity,
  String tyresWheels,
  String batterySecurity,
  String batteryCondition,
  String wings,
  String mudflaps,
}) =>
    serializers.toFirestore(
        InspectionsRecord.serializer,
        InspectionsRecord((i) => i
          ..chassisID = chassisID
          ..ffid = ffid
          ..horn = horn
          ..steering = steering
          ..brakes = brakes
          ..cabElectrics = cabElectrics
          ..exhaust = exhaust
          ..wipersWashers = wipersWashers
          ..mirrors = mirrors
          ..glass = glass
          ..lightsIndicators = lightsIndicators
          ..fuel = fuel
          ..oil = oil
          ..loadSecurity = loadSecurity
          ..electricalConnections = electricalConnections
          ..markers = markers
          ..reflectors = reflectors
          ..bodySecurity = bodySecurity
          ..tyresWheels = tyresWheels
          ..batterySecurity = batterySecurity
          ..batteryCondition = batteryCondition
          ..wings = wings
          ..mudflaps = mudflaps));
