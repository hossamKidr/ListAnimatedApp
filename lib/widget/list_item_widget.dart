import 'package:flutter/material.dart';

import '../list_animatede/list_animatede.dart';
import '../model/model.dart';

class ListItemWidgit extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  ListItemWidgit(
      {required this.item,
      required this.animation,
      required this.onClicked,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        key: ValueKey(
          item.urlImage,
        ),
        sizeFactor: animation,
        child: buildItem(),
      );

  Widget buildItem() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.black54),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(item.urlImage),
        ),
        title: Text(
          item.title,
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: onClicked,
          icon: Icon(
            Icons.delete,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
