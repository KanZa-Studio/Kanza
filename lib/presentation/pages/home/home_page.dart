import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './widgets/custom_fab_button.dart';
import '../../../data/mocks.dart';
import '../../widgets/custom_drawer.dart';
import 'widgets/category_item.dart';
import 'widgets/home_top_bar.dart';
import '../../../blocs/category_cubit/category_cubit.dart';
import '../../../data/services/database_service.dart';
import './widgets/todo_item.dart';

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
          SizedBox(height: 53, child: _buildCategoriesWidget()),
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

  /// builds horizontal [categories] list of [HomePage]
  Widget _buildCategoriesWidget() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        /// for [Add] button
        final categories = [TodoCategoryEntity(name: null)];

        if (state.categoryStatus == CategoryStatus.success) {
          return StreamBuilder<List<TodoCategoryEntity>>(
              stream: state.allCategoriesStream,
              builder: (context, snapshot) {
                /// loads [add button] and [all other items]
                categories.removeWhere((element) => element.name != null);
                categories.addAll(snapshot.data ?? []);

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => CategoryItem(
                    todoCategory: categories[i],
                  ),
                  itemCount: categories.length,
                );
              });
        } else {
          /// when the [state] is [initial]
          return SizedBox();
        }
      },
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
