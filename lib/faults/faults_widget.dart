import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaultsWidget extends StatefulWidget {
  const FaultsWidget({Key key}) : super(key: key);

  @override
  _FaultsWidgetState createState() => _FaultsWidgetState();
}

class _FaultsWidgetState extends State<FaultsWidget> {
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
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomePage'),
              ),
            );
          },
          child: Text(
            'Faults',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22,
                ),
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
              Expanded(
                child: StreamBuilder<List<InspectionsRecord>>(
                  stream: queryInspectionsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: Color(0xFFE87021),
                          ),
                        ),
                      );
                    }
                    List<InspectionsRecord> listViewInspectionsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewInspectionsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewInspectionsRecord =
                            listViewInspectionsRecordList[listViewIndex];
                        return StreamBuilder<List<InspectionsRecord>>(
                          stream: queryInspectionsRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFE87021),
                                  ),
                                ),
                              );
                            }
                            List<InspectionsRecord>
                                listTileInspectionsRecordList = snapshot.data;
                            return ListTile(
                              leading: Icon(
                                Icons.error,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              title: Text(
                                dateTimeFormat('d/M H:mm',
                                    listViewInspectionsRecord.inspectionTime),
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                listTileInspectionsRecordList.length.toString(),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              dense: false,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
