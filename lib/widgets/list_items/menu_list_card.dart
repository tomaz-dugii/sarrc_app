import 'package:flutter/material.dart';
import 'package:sarrc_app/utils/flutter_flow_util.dart';

class MenuListCard extends StatelessWidget {
  const MenuListCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.url,
  });
  final String title;
  final IconData leadingIcon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrlHelperWeb(url);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Icon(
                leadingIcon,
                color: Theme.of(context).disabledColor,
                size: 24.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
