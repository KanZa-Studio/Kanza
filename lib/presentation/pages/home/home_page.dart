import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kanza/data/services/database_service.dart';
import 'package:kanza/presentation/pages/home/widgets/top_bar.dart';

import './widgets/time_item.dart';
import 'widgets/task_item.dart';
import '../../values/colors.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 24),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TimeItem(
                    title: today.tr(),
                    backgroundColor: LightThemeColor.todayTimeItemBackground,
                    onClicked: () {},
                    margin: const EdgeInsets.only(left: 15, right: 4),
                  ),
                  TimeItem(
                    title: tomorrow.tr(),
                    backgroundColor: LightThemeColor.tomorrowTimeItemBackground,
                    onClicked: () {},
                  ),
                  TimeItem(
                    title: pickDate.tr(),
                    backgroundColor:
                        LightThemeColor.pickADateTimeItemBackground,
                    onClicked: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 33),
            Row(children: [Text('Tasks')]),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => TaskItem(
                        task: Task(
                          id: 0,
                          title: 'Test Task Title',
                          details: 'Test Task Details',
                          archived: false,
                          completed: true,
                          createdAt: DateTime.now(),
                          timeColor: 'FF000000',
                        ),
                      ),
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: SizedBox(),
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
