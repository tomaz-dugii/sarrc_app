import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarrc_app/backend/api_requests/api_calls.dart';
import 'package:sarrc_app/backend/supabase/database/tables/participants.dart';
import 'package:sarrc_app/widgets/list_items/athletes_list_item_card.dart';
import '../utils/flutter_flow_util.dart';
import '/backend/supabase/supabase.dart';

@RoutePage()
class EventAthletesPage extends ConsumerStatefulWidget {
  const EventAthletesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventAthletesPageState();
}

class _EventAthletesPageState extends ConsumerState<EventAthletesPage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool searchList = false;

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SearchAthletByIDName)] action in TextField widget.
  ApiCallResponse? apiResulty7f;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex => tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState() {
    super.initState();
    textController ??= TextEditingController();
    tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    textController?.dispose();
    tabBarController?.dispose();
  }

  void searchTrigeger() {
    return EasyDebounce.debounce(
      '_model.textController',
      const Duration(milliseconds: 300),
      () async {
        List<String> params = textController.text.split(" ");
        apiResulty7f = await SearchAthletByIDNameCall.call(firstName: params[0], lastName: params.length > 1 ? params[1] : "").then((value) {
          searchList = textController.text != '' ? true : false;
          setState(() {});
          return value;
        });
        // setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Athletes',
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(
                    color: const Color(0xFFE0E3E7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                          child: SizedBox(
                            width: 200.0,
                            child: TextFormField(
                              focusNode: unfocusNode,
                              textInputAction: TextInputAction.done,
                              controller: textController,
                              onFieldSubmitted: (value) => searchTrigeger(),
                              onChanged: (_) => searchTrigeger(),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Search by Name',
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                hintStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                suffixIcon: textController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          unfocusNode.unfocus();
                                          textController.text = "";
                                          searchList = false;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Theme.of(context).disabledColor,
                                          size: 20.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                              cursorColor: Theme.of(context).primaryColor,
                              validator: textControllerValidator.asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (searchList)
              getJsonField((apiResulty7f?.jsonBody ?? ''), r'''$[:].BibID''') != null ||
                      (getJsonField((apiResulty7f?.jsonBody ?? ''), r'''$[0].BibID''') != getJsonField((apiResulty7f?.jsonBody ?? ''), r'''$[:].BibID'''))
                  ? FutureBuilder<List<ParticipantsRow>>(
                      future: ParticipantsTable().queryRows(
                        queryFn: (q) => q.inFilter(
                          'BibID',
                          SearchAthletByIDNameCall.bibID(
                            (apiResulty7f?.jsonBody ?? ''),
                          ),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          );
                        }

                        List<ParticipantsRow> listViewParticipantsRowList = snapshot.data!;
                        return Expanded(
                            child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 24.0, 8.0, 0.0),
                          child: AthletListCard(listViewParticipantsRowList: listViewParticipantsRowList),
                        ));
                      },
                    )
                  : const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 44),
                        child: Text("The athlete with this name was not found."),
                      ),
                    ),

            // Tabs ------
            if (!searchList)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: Material(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: TabBar(
                            labelColor: Theme.of(context).textTheme.bodyMedium?.color,
                            unselectedLabelColor: Theme.of(context).disabledColor,
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
                            indicatorColor: Theme.of(context).primaryColor,
                            tabs: const [
                              Tab(
                                text: '   PREPD\nMarathon',
                              ),
                              Tab(
                                text: 'PREPD Half\nMarathon',
                              ),
                              Tab(
                                text: 'Saucony\n    10k',
                              ),
                              Tab(
                                text: 'Saucony\n      5k',
                              ),
                            ],
                            controller: tabBarController,
                            onTap: (value) => setState(() {}),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabBarController,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                              child: FutureBuilder<List<ParticipantsRow>>(
                                future: ParticipantsTable().queryRows(
                                  queryFn: (q) => q.inFilter(
                                    'SubEvent',
                                    SubEventCategory.marathon.subEventCategory,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return AthletListCard(listViewParticipantsRowList: snapshot.data!);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                              child: FutureBuilder<List<ParticipantsRow>>(
                                future: ParticipantsTable().queryRows(
                                  queryFn: (q) => q.inFilter(
                                    'SubEvent',
                                    SubEventCategory.halfMarathon.subEventCategory,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  return AthletListCard(listViewParticipantsRowList: snapshot.data!);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                              child: FutureBuilder<List<ParticipantsRow>>(
                                future: ParticipantsTable().queryRows(
                                  queryFn: (q) => q.inFilter(
                                    'SubEvent',
                                    SubEventCategory.tenK.subEventCategory,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ParticipantsRow> listViewParticipantsRowList = snapshot.data!;
                                  return AthletListCard(listViewParticipantsRowList: listViewParticipantsRowList);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                              child: FutureBuilder<List<ParticipantsRow>>(
                                future: ParticipantsTable().queryRows(
                                  queryFn: (q) => q.inFilter(
                                    'SubEvent',
                                    SubEventCategory.fiveK.subEventCategory,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return AthletListCard(listViewParticipantsRowList: snapshot.data!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

extension TextValidationExtensions on String? Function(BuildContext, String?)? {
  String? Function(String?)? asValidator(BuildContext context) => this != null ? (val) => this!(context, val) : null;
}
