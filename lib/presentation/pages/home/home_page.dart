import 'package:flutter/material.dart';
import 'package:kanza/presentation/widgets/custom_drawer.dart';

import './widgets/custom_fab_button.dart';
import './widgets/todo_item.dart';
import '../../../data/mocks.dart';
import 'widgets/category_item.dart';
import 'widgets/home_top_bar.dart';

class HomePage extends StatelessWidget {
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
                title: mockCategories[i].title,
                color: mockCategories[i].color,
                isAddButton: i == 0,
              ),
              itemCount: mockCategories.length,
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: const SizedBox(height: 32)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => TodoItem(
                      title: 'Title $i',
                      subtitle: 'Subtitle: $i',
                    ),
                    childCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFabButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
