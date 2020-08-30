import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './widgets/custom_fab_button.dart';
import '../../../data/mocks.dart';
import '../../widgets/custom_drawer.dart';
import 'widgets/home_top_bar.dart';
import './widgets/todo_item.dart';
import './widgets/time_item.dart';
import '../../values/colors.dart';

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
      drawer: CustomDrawer(),
      body: Column(
        children: [
          const HomeTopBar(),
          const SizedBox(height: 24),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TimeItem(
                  title: 'TODAY',
                  backgroundColor: todayTimeItemBackground,
                  onClicked: () {},
                  margin: const EdgeInsets.only(left: 15, right: 4),
                ),
                TimeItem(
                  title: 'TOMORROW',
                  backgroundColor: tomorrowTimeItemBackground,
                  onClicked: () {},
                ),
                TimeItem(
                  title: 'PICK A DATE',
                  backgroundColor: pickADateTimeItemBackground,
                  onClicked: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) =>
                  TodoItem(todo: mockTodoList[index]),
              itemCount: mockTodoList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: CustomFabButton(),
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
