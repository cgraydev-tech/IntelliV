import '../additional_page/additional_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InspectionFormWidget extends StatefulWidget {
  const InspectionFormWidget({
    Key key,
    this.vreg,
    this.addinfo,
  }) : super(key: key);

  final String vreg;
  final String addinfo;

  @override
  _InspectionFormWidgetState createState() => _InspectionFormWidgetState();
}

class _InspectionFormWidgetState extends State<InspectionFormWidget> {
  String choiceChipsValue;
  bool brakesSwitchValue;
  bool hornSwitchValue;
  bool steeringSwitchValue;
  bool iCESwitchValue;
  bool exhSwitchValue;
  bool winWipSwitchValue;
  bool batterySwitchValue;
  bool elecSwitchValue;
  bool sOLSwitchValue;
  bool markersSwitchValue;
  bool reflSwitchValue;
  bool sOBWSwitchValue;
  bool tyresSwitchValue;
  bool wingSwitchValue;
  bool fuelOilSwitchValue;
  bool lightsSwitchValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Inspection',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Registration: ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState().vreg,
                                      'failed',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Pass / Fail:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FlutterFlowChoiceChips(
                                      initiallySelected: [choiceChipsValue],
                                      options: [
                                        ChipData('In Cab Checks'),
                                        ChipData('External Checks')
                                      ],
                                      onChanged: (val) => setState(
                                          () => choiceChipsValue = val.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0xFFE87021),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans Condensed',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18,
                                        elevation: 4,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0xFFE87021),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans Condensed',
                                              color: Color(0xFF323B45),
                                            ),
                                        iconColor: Color(0xFFE87021),
                                        iconSize: 18,
                                        elevation: 4,
                                      ),
                                      chipSpacing: 20,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if ((choiceChipsValue) == 'In Cab Checks')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((choiceChipsValue) ==
                                          'External Checks')
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              'Internal Cab Checks:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: steeringSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => steeringSwitchValue =
                                                  newValue),
                                          title: Text(
                                            'Steering Wheel : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: hornSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => hornSwitchValue = newValue),
                                          title: Text(
                                            'Horn : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: brakesSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () =>
                                                  brakesSwitchValue = newValue),
                                          title: Text(
                                            'Brakes : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: iCESwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => iCESwitchValue = newValue),
                                          title: Text(
                                            'In Cab Electronics : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: exhSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => exhSwitchValue = newValue),
                                          title: Text(
                                            'Exhaust Smoke: ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: winWipSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () =>
                                                  winWipSwitchValue = newValue),
                                          title: Text(
                                            'Windscreen Wipers/Washers : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            if ((choiceChipsValue) == 'External Checks')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((choiceChipsValue) ==
                                          'External Checks')
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              'External Cab Checks:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: sOLSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => sOLSwitchValue = newValue),
                                          title: Text(
                                            'Secruity Of Load : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: elecSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => elecSwitchValue = newValue),
                                          title: Text(
                                            'Electrical Connections : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: markersSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => markersSwitchValue =
                                                  newValue),
                                          title: Text(
                                            'Markers : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: reflSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => reflSwitchValue = newValue),
                                          title: Text(
                                            'Reflectors: ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: sOBWSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => sOBWSwitchValue = newValue),
                                          title: Text(
                                            'Security Of Body/Wings : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily:
                                                      'Open Sans Condensed',
                                                  fontSize: 19,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: tyresSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () =>
                                                  tyresSwitchValue = newValue),
                                          title: Text(
                                            'Tyres/Wheel Fittings : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: batterySwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => batterySwitchValue =
                                                  newValue),
                                          title: Text(
                                            'Battery Security/Condition : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: wingSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => wingSwitchValue = newValue),
                                          title: Text(
                                            'Wings/Mudflaps : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: fuelOilSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () => fuelOilSwitchValue =
                                                  newValue),
                                          title: Text(
                                            'Fuel/Oil Spills : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: lightsSwitchValue ??= false,
                                          onChanged: (newValue) => setState(
                                              () =>
                                                  lightsSwitchValue = newValue),
                                          title: Text(
                                            'Lights/Indicators : ',
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final inspectionsCreateData =
                                          createInspectionsRecordData(
                                        horn: hornSwitchValue,
                                        brakes: brakesSwitchValue,
                                        ice: iCESwitchValue,
                                        exhaust: exhSwitchValue,
                                        wipers: winWipSwitchValue,
                                        sol: sOLSwitchValue,
                                        electricalConnections: elecSwitchValue,
                                        markers: markersSwitchValue,
                                        reflectors: reflSwitchValue,
                                        sob: sOBWSwitchValue,
                                        tyresWheels: tyresSwitchValue,
                                        battery: batterySwitchValue,
                                        wingsMudflaps: wingSwitchValue,
                                        spillage: fuelOilSwitchValue,
                                        inspectionTime: getCurrentTimestamp,
                                        lightsIndicators: false,
                                        wheel: false,
                                        chassisID: FFAppState().vreg,
                                        addInfo: widget.addinfo,
                                        completedBy: currentUserEmail,
                                      );
                                      await InspectionsRecord.collection
                                          .doc()
                                          .set(inspectionsCreateData);
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Inspection '),
                                            content:
                                                Text('Inspection Complete'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'HomePage'),
                                        ),
                                      );
                                    },
                                    text: 'Submit Inspection',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: Color(0xFFE87021),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Open Sans Condensed',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdditionalPageWidget(
                                            vreg: '',
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'Additional Information',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: Color(0xFFE87021),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Open Sans Condensed',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
