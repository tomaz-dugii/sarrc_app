import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sarrc_app/widgets/list_items/menu_list_card.dart';

@RoutePage()
class EventMenuPage extends ConsumerStatefulWidget {
  const EventMenuPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventMenuPageState();
}

class _EventMenuPageState extends ConsumerState<EventMenuPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initPackageInfo();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Menu',
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 8),
                  child: Text(
                    'Information',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const MenuListCard(
                  title: 'Race Day Information',
                  leadingIcon: Icons.calendar_month_rounded,
                  url: "https://adelaidemarathon.com.au/race-day/",
                ),
                const MenuListCard(
                  title: 'Course Map',
                  leadingIcon: Icons.map_outlined,
                  url: "https://adelaidemarathon.com.au/wp-content/uploads/2023/08/2023-AMF-42Km-Course-Map-Port-Rd-Start-1.pdf",
                ),
                const MenuListCard(
                  title: 'PREPD Marathon 42.2k Information',
                  leadingIcon: Icons.info_outline_rounded,
                  url: "https://adelaidemarathon.com.au/adelaide-marathon-42-2km-race/",
                ),
                const MenuListCard(
                  title: 'PREPD Half Marathon 21.1k Information',
                  leadingIcon: Icons.info_outline_rounded,
                  url: "https://adelaidemarathon.com.au/adelaide-marathon-21-1km-race/",
                ),
                const MenuListCard(
                  title: 'Saucony 10k Information',
                  leadingIcon: Icons.info_outline_rounded,
                  url: "https://adelaidemarathon.com.au/adelaide-marathon-10km-race/",
                ),
                const MenuListCard(
                  title: 'Saucony 5k Information',
                  leadingIcon: Icons.info_outline_rounded,
                  url: "https://adelaidemarathon.com.au/adelaide-marathon-5km-race/",
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).dividerColor,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 8),
                  child: Text(
                    'Participants info',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const MenuListCard(
                  title: '2023 Results',
                  leadingIcon: Icons.list_alt_rounded,
                  url: "https://eventstrategies.racetecresults.com/results.aspx?CId=90&RId=496",
                ),
                const MenuListCard(
                  title: 'Pace Runners',
                  leadingIcon: Icons.run_circle_outlined,
                  url: "https://adelaidemarathon.com.au/pacers/",
                ),
                const MenuListCard(
                  title: 'Elite Athletes',
                  leadingIcon: Icons.diamond_outlined,
                  url: "https://adelaidemarathon.com.au/elite-athletes/",
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).dividerColor,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 8),
                  child: Text(
                    'Policies',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const MenuListCard(
                  title: 'Privacy Policy',
                  leadingIcon: Icons.policy_outlined,
                  url: "https://adelaidemarathon.com.au/privacy-policy/",
                ),
                const MenuListCard(
                  title: 'Other Policies',
                  leadingIcon: Icons.policy_outlined,
                  url: "https://sarrc.org.au/about-us/constitution-policies",
                ),
                const Spacer(),
                Center(child: Text("v.${_packageInfo.version}")),
                Center(child: Text(_packageInfo.buildNumber)),
              ],
            )),
      ),
    );
  }
}
