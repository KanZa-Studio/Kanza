import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanza/data/services/database_service.dart';

import './widgets/custom_fab.dart';
import './widgets/task_item.dart';
import './widgets/time_item.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../widgets/kanza_drawer.dart';
import '../../widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );

    animationController.forward();

    scrollController.addListener(() {
      setState(() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          animationController.forward();
        } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          animationController.reverse();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: KanzaDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(title: 'kanza'),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TimeItem(
                    title: AppLocalizations.of(context).today,
                    backgroundColor: Theme.of(context).todayItemBackgroundColor,
                    onClicked: () {},
                    margin: const EdgeInsets.only(left: 1, right: 4),
                    selected: true,
                  ),
                  TimeItem(
                    title: AppLocalizations.of(context).tomorrow,
                    backgroundColor:
                        Theme.of(context).tomorrowItemBackgroundColor,
                    onClicked: () {},
                  ),
                  TimeItem(
                    title: AppLocalizations.of(context).pickDate,
                    backgroundColor:
                        Theme.of(context).pickDateItemBackgroundColor,
                    onClicked: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).tasks,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).filter,
                        style: Theme.of(context).textTheme.overline.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).filterTextColor,
                            ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        Assets.icons.filter,
                        color: Theme.of(context).filterIconColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: CustomScrollView(
            //       controller: scrollController,
            //       slivers: [
            //         const SliverToBoxAdapter(child: SizedBox(height: 20)),
            //         SliverList(
            //           delegate: SliverChildBuilderDelegate(
            //             (context, i) => TaskItem(
            //               task: Task(
            //                 id: 1,
            //                 title: 'Title',
            //                 details: 'Details',
            //                 archived: false,
            //                 completed: i == 1,
            //                 timeColor: 'FFffdede',
            //                 createdAt: DateTime.now(),
            //               ),
            //             ),
            //             childCount: 10,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 39, right: 15),
          child: CustomFab(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
