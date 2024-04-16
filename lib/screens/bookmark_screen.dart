import 'package:flutter/material.dart';
import 'package:tasks_list/components/bookmark_card.dart';
import 'package:tasks_list/model/bookmark_model.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (
            context,
            index,
          ) {
            if (index.isOdd) {
              return const Divider();
            }

            return BookmarkCard(
              bookmark: BookmarkModel(title: 'bookmark $index'),
            );
          },
          itemCount: 50,
        ),
        Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ))
      ],
    );
  }
}
