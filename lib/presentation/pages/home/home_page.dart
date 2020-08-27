import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kanza/data/services/database_service.dart';
import 'package:kanza/presentation/pages/home/widgets/todo_item.dart';

import './widgets/custom_fab_button.dart';
import '../../../data/mocks.dart';
import '../../widgets/custom_drawer.dart';
import 'widgets/category_item.dart';
import 'widgets/home_top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  AnimationController animationController;
  Animation animation;

  final TodoDao todoDao = TodoDao(KanzaDatabase());

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
          SizedBox(
            height: 53,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => CategoryItem(
                todoCategory: mockCategories[i],
                isAddButton: i == 0,
              ),
              itemCount: mockCategories.length,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<List<TodoWithCategory>>(
              stream: todoDao.watchAllTodo(),
              builder: (context, todoListSnapshot) {
                final allTodoWithCategory = todoListSnapshot.data ?? List();

                return ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) =>
                      TodoItem(todo: allTodoWithCategory[index].todoData),
                  itemCount: allTodoWithCategory.length,
                );
              },
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
