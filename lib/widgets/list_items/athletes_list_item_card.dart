import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sarrc_app/router/router.gr.dart';

class AthletListCard extends StatefulWidget {
  const AthletListCard({super.key, required this.listViewParticipantsRowList});
  final List listViewParticipantsRowList;

  @override
  State<AthletListCard> createState() => _AthletListCardState();
}

class _AthletListCardState extends State<AthletListCard> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.listViewParticipantsRowList.length,
      itemBuilder: (context, listViewIndex) {
        final listViewParticipantsRow = widget.listViewParticipantsRowList[listViewIndex];
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: GestureDetector(
            onTap: () {
              context.navigateTo(const AthletesDetailsRoute());
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.5,
                    color: Theme.of(context).dividerColor,
                    offset: const Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: SizedBox(
                        width: 55,
                        child: Text(
                          listViewParticipantsRow.bibID.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'David' + " " + 'Clarke',
                          listViewParticipantsRow.firstName! + " " + listViewParticipantsRow.lastName!,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
