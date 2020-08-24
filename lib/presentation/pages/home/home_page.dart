import 'package:flutter/material.dart';
import './home_top_bar.dart';
import '../../values/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Column(
        children: [
          const HomeTopBar(),
          const SizedBox(height: 20),
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => Container(
                width: 100,
                margin: EdgeInsets.only(left: i == 0 ? 16 : 8, right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: i % 2 == 0
                      ? category1
                      : (i % 3 == 0 ? category2 : category3),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Center(
                  child: Text(
                    i % 2 == 0 ? 'WORK' : (i % 3 == 0 ? 'PERSONAL' : 'CINEMA'),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
              ),
              itemCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 35,
          semanticLabel: 'Add To-do',
        ),
      ),
    );
  }
}
