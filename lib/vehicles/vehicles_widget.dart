import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../new_vehicle/new_vehicle_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehiclesWidget extends StatefulWidget {
  const VehiclesWidget({Key key}) : super(key: key);

  @override
  _VehiclesWidgetState createState() => _VehiclesWidgetState();
}

class _VehiclesWidgetState extends State<VehiclesWidget> {
  List<VehiclesRecord> algoliaSearchResults1 = [];
  TextEditingController searchFieldController;
  List<VehiclesRecord> algoliaSearchResults2 = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
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
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomePage'),
              ),
            );
          },
        ),
        title: Text(
          'Vehicles',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans Condensed',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'searchFieldController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            onFieldSubmitted: (_) async {
                              setState(() => algoliaSearchResults1 = null);
                              await VehiclesRecord.search(
                                term: searchFieldController.text,
                              )
                                  .then((r) => algoliaSearchResults1 = r)
                                  .onError(
                                      (_, __) => algoliaSearchResults1 = [])
                                  .whenComplete(() => setState(() {}));
                            },
                            controller: searchFieldController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Vehicle Search...',
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
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          setState(() => algoliaSearchResults2 = null);
                          await VehiclesRecord.search(
                            term: searchFieldController.text,
                          )
                              .then((r) => algoliaSearchResults2 = r)
                              .onError((_, __) => algoliaSearchResults2 = [])
                              .whenComplete(() => setState(() {}));
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (algoliaSearchResults1 == null) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final vehicles =
                                algoliaSearchResults1?.toList() ?? [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: vehicles.length,
                              itemBuilder: (context, vehiclesIndex) {
                                final vehiclesItem = vehicles[vehiclesIndex];
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.network(
                                              'https://picsum.photos/seed/111/600',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'Chassis ID: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FutureBuilder<
                                                    List<VehiclesRecord>>(
                                                  future: VehiclesRecord.search(
                                                    term:
                                                        vehiclesItem.chassisID,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<VehiclesRecord>
                                                        textVehiclesRecordList =
                                                        snapshot.data;
                                                    return Text(
                                                      vehiclesItem.chassisID,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'Vehicle Description: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FutureBuilder<
                                                    List<VehiclesRecord>>(
                                                  future: VehiclesRecord.search(
                                                    term: vehiclesItem.desc,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<VehiclesRecord>
                                                        textVehiclesRecordList =
                                                        snapshot.data;
                                                    return Text(
                                                      vehiclesItem.desc,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'Status: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FutureBuilder<
                                                    List<VehiclesRecord>>(
                                                  future: VehiclesRecord.search(
                                                    term: vehiclesItem.status,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<VehiclesRecord>
                                                        textVehiclesRecordList =
                                                        snapshot.data;
                                                    return Text(
                                                      vehiclesItem.status,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewVehicleWidget(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.add_box,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Text(
                          'Add Vehicle',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
