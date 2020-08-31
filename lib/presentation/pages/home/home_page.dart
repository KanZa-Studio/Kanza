import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kanza/data/services/database_service.dart';
import 'package:kanza/presentation/pages/home/widgets/task_item.dart';

import './widgets/time_item.dart';
import './widgets/top_bar.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../../utils/extensions/translator.dart';
import '../../../utils/extensions/theme_extension.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const TopBar(),
              const SizedBox(height: 20),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TimeItem(
                      title: today.tr(),
                      backgroundColor:
                          Theme.of(context).todayItemBackgroundColor,
                      onClicked: () {},
                      margin: const EdgeInsets.only(left: 1, right: 4),
                      selected: true,
                    ),
                    TimeItem(
                      title: tomorrow.tr(),
                      backgroundColor:
                          Theme.of(context).tomorrowItemBackgroundColor,
                      onClicked: () {},
                    ),
                    TimeItem(
                      title: pickDate.tr(),
                      backgroundColor:
                          Theme.of(context).pickDateItemBackgroundColor,
                      onClicked: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 31),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tasks', style: Theme.of(context).textTheme.bodyText1),
                  Row(
                    children: [
                      Text(
                        'Filter',
                        style: Theme.of(context).textTheme.overline.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).filterTextColor,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.filter_list),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => TaskItem(
                          task: Task(
                            id: 1,
                            title: 'Title',
                            details: 'Details',
                            archived: false,
                            completed: i == 1,
                            timeColor: 'FFffdede',
                            createdAt: DateTime.now(),
                          ),
                        ),
                        childCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
