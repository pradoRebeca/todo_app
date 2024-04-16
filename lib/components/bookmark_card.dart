import 'package:flutter/material.dart';
import 'package:tasks_list/model/bookmark_model.dart';

class BookmarkCard extends StatefulWidget {
  final BookmarkModel bookmark;
  const BookmarkCard({super.key, required this.bookmark});

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.bookmark.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.error,
                    ))
              ],
            )
          ],
        ));
  }
}
