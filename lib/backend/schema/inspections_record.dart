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
  @BuiltValueField(wireName: 'Horn')
  bool get horn;

  @nullable
  @BuiltValueField(wireName: 'Brakes')
  bool get brakes;

  @nullable
  @BuiltValueField(wireName: 'ICE')
  bool get ice;

  @nullable
  @BuiltValueField(wireName: 'Exhaust')
  bool get exhaust;

  @nullable
  @BuiltValueField(wireName: 'Wipers')
  bool get wipers;

  @nullable
  @BuiltValueField(wireName: 'Mirrors_Glass')
  bool get mirrorsGlass;

  @nullable
  @BuiltValueField(wireName: 'SOL')
  bool get sol;

  @nullable
  @BuiltValueField(wireName: 'Electrical_Connections')
  bool get electricalConnections;

  @nullable
  @BuiltValueField(wireName: 'Markers')
  bool get markers;

  @nullable
  @BuiltValueField(wireName: 'Reflectors')
  bool get reflectors;

  @nullable
  @BuiltValueField(wireName: 'SOB')
  bool get sob;

  @nullable
  @BuiltValueField(wireName: 'Tyres_Wheels')
  bool get tyresWheels;

  @nullable
  @BuiltValueField(wireName: 'Battery')
  bool get battery;

  @nullable
  @BuiltValueField(wireName: 'Wings_Mudflaps')
  bool get wingsMudflaps;

  @nullable
  @BuiltValueField(wireName: 'Spillage')
  bool get spillage;

  @nullable
  @BuiltValueField(wireName: 'Lights_Indicators')
  bool get lightsIndicators;

  @nullable
  @BuiltValueField(wireName: 'Inspection_Time')
  DateTime get inspectionTime;

  @nullable
  @BuiltValueField(wireName: 'Wheel')
  bool get wheel;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InspectionsRecordBuilder builder) => builder
    ..horn = false
    ..brakes = false
    ..ice = false
    ..exhaust = false
    ..wipers = false
    ..mirrorsGlass = false
    ..sol = false
    ..electricalConnections = false
    ..markers = false
    ..reflectors = false
    ..sob = false
    ..tyresWheels = false
    ..battery = false
    ..wingsMudflaps = false
    ..spillage = false
    ..lightsIndicators = false
    ..wheel = false;

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
  bool horn,
  bool brakes,
  bool ice,
  bool exhaust,
  bool wipers,
  bool mirrorsGlass,
  bool sol,
  bool electricalConnections,
  bool markers,
  bool reflectors,
  bool sob,
  bool tyresWheels,
  bool battery,
  bool wingsMudflaps,
  bool spillage,
  bool lightsIndicators,
  DateTime inspectionTime,
  bool wheel,
}) =>
    serializers.toFirestore(
        InspectionsRecord.serializer,
        InspectionsRecord((i) => i
          ..horn = horn
          ..brakes = brakes
          ..ice = ice
          ..exhaust = exhaust
          ..wipers = wipers
          ..mirrorsGlass = mirrorsGlass
          ..sol = sol
          ..electricalConnections = electricalConnections
          ..markers = markers
          ..reflectors = reflectors
          ..sob = sob
          ..tyresWheels = tyresWheels
          ..battery = battery
          ..wingsMudflaps = wingsMudflaps
          ..spillage = spillage
          ..lightsIndicators = lightsIndicators
          ..inspectionTime = inspectionTime
          ..wheel = wheel));
