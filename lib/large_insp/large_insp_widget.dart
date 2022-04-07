import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeInspWidget extends StatefulWidget {
  const LargeInspWidget({Key key}) : super(key: key);

  @override
  _LargeInspWidgetState createState() => _LargeInspWidgetState();
}

class _LargeInspWidgetState extends State<LargeInspWidget> {
  List<String> brakesCheckboxValues;
  List<String> steeringCheckboxValues;
  String choiceChipsValue;
  TextEditingController chassisidtfController;
  TextEditingController ffidtfController;
  List<String> iCECheckboxValues;
  List<String> exhaustCheckboxValues;
  List<String> washWipeCheckboxValues;
  List<String> mirrorsCheckboxValues1;
  List<String> mirrorsCheckboxValues2;
  List<String> checkboxGroupValues1;
  List<String> checkboxGroupValues2;
  List<String> checkboxGroupValues3;
  List<String> checkboxGroupValues4;
  List<String> checkboxGroupValues5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    chassisidtfController = TextEditingController();
    ffidtfController = TextEditingController();
  }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Chassis Number:',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Open Sans Condensed',
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                        TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'chassisidtfController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          controller: chassisidtfController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'HG32',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon: chassisidtfController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => chassisidtfController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          'FF ID:',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Open Sans Condensed',
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                        TextFormField(
                          controller: ffidtfController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'FF123',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
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
                                    ChipData(
                                        'In Cab Checks', Icons.train_outlined),
                                    ChipData('External Checks')
                                  ],
                                  onChanged: (val) => setState(
                                      () => choiceChipsValue = val.first),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xFF323B45),
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
                                    backgroundColor: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans Condensed',
                                          color: Color(0xFF323B45),
                                        ),
                                    iconColor: Color(0xFF323B45),
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
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((choiceChipsValue) == 'In Cab Checks')
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'In-Cab Checks :',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Steering:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected:
                                      steeringCheckboxValues != null
                                          ? steeringCheckboxValues
                                          : [],
                                  options: ['Working as expected', 'Faulty']
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => steeringCheckboxValues = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Brakes:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected:
                                      brakesCheckboxValues != null
                                          ? brakesCheckboxValues
                                          : [],
                                  options: ['Working as expected', 'Faulty']
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => brakesCheckboxValues = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'In-Cab \nElectronics:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected: iCECheckboxValues != null
                                      ? iCECheckboxValues
                                      : [],
                                  options: ['Working as expected', 'Faulty']
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => iCECheckboxValues = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Exhaust:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected:
                                      exhaustCheckboxValues != null
                                          ? exhaustCheckboxValues
                                          : [],
                                  options: ['Working as expected', 'Faulty']
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => exhaustCheckboxValues = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Wipers &\nWashers:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected:
                                      washWipeCheckboxValues != null
                                          ? washWipeCheckboxValues
                                          : [],
                                  options: ['Working as expected', 'Faulty']
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => washWipeCheckboxValues = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Mirrors:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected:
                                      mirrorsCheckboxValues1 != null
                                          ? mirrorsCheckboxValues1
                                          : [],
                                  options: ['No Damage', 'Damage'].toList(),
                                  onChanged: (val) => setState(
                                      () => mirrorsCheckboxValues1 = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        if ((choiceChipsValue) == 'In Cab Checks')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Glass:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans Condensed',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Expanded(
                                child: FlutterFlowCheckboxGroup(
                                  initiallySelected:
                                      mirrorsCheckboxValues2 != null
                                          ? mirrorsCheckboxValues2
                                          : [],
                                  options: ['No Damage', 'Damage'].toList(),
                                  onChanged: (val) => setState(
                                      () => mirrorsCheckboxValues2 = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final inspectionsCreateData =
                                    createInspectionsRecordData(
                                  chassisID: chassisidtfController.text,
                                  ffid: ffidtfController.text,
                                );
                                await InspectionsRecord.collection
                                    .doc()
                                    .set(inspectionsCreateData);
                                setState(() {
                                  chassisidtfController.clear();
                                  ffidtfController.clear();
                                });
                              },
                              text: 'Submit',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((choiceChipsValue) == 'External Checks')
                                  Text(
                                    'External Cab Checks:',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowCheckboxGroup(
                                    initiallySelected:
                                        checkboxGroupValues1 != null
                                            ? checkboxGroupValues1
                                            : [],
                                    options: ['Option 1', ''].toList(),
                                    onChanged: (val) => setState(
                                        () => checkboxGroupValues1 = val),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    checkColor: Colors.white,
                                    checkboxBorderColor: Color(0xFF95A1AC),
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowCheckboxGroup(
                                    initiallySelected:
                                        checkboxGroupValues2 != null
                                            ? checkboxGroupValues2
                                            : [],
                                    options: ['Option 1', ''].toList(),
                                    onChanged: (val) => setState(
                                        () => checkboxGroupValues2 = val),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    checkColor: Colors.white,
                                    checkboxBorderColor: Color(0xFF95A1AC),
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowCheckboxGroup(
                                    initiallySelected:
                                        checkboxGroupValues3 != null
                                            ? checkboxGroupValues3
                                            : [],
                                    options: ['Option 1', ''].toList(),
                                    onChanged: (val) => setState(
                                        () => checkboxGroupValues3 = val),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    checkColor: Colors.white,
                                    checkboxBorderColor: Color(0xFF95A1AC),
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowCheckboxGroup(
                                    initiallySelected:
                                        checkboxGroupValues4 != null
                                            ? checkboxGroupValues4
                                            : [],
                                    options: ['Option 1', ''].toList(),
                                    onChanged: (val) => setState(
                                        () => checkboxGroupValues4 = val),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    checkColor: Colors.white,
                                    checkboxBorderColor: Color(0xFF95A1AC),
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowCheckboxGroup(
                                    initiallySelected:
                                        checkboxGroupValues5 != null
                                            ? checkboxGroupValues5
                                            : [],
                                    options: ['Option 1', ''].toList(),
                                    onChanged: (val) => setState(
                                        () => checkboxGroupValues5 = val),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    checkColor: Colors.white,
                                    checkboxBorderColor: Color(0xFF95A1AC),
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
