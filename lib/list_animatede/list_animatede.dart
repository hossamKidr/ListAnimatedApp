import 'package:flutter/material.dart';

import '../data/list_item.dart';
import '../model/model.dart';
import '../widget/list_item_widget.dart';
class ListAnimatede extends StatefulWidget {
  const ListAnimatede({Key? key}) : super(key: key);

  @override
  State<ListAnimatede> createState() => _ListAnimatedeState();
}
final listkey = GlobalKey<AnimatedListState>();
final List<ListItem> item = List.from(listitem);

class _ListAnimatedeState extends State<ListAnimatede> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animated'),
        centerTitle: true,
      ),
      body: AnimatedList(
        key: listkey,
        initialItemCount: item.length,
        itemBuilder: (context , index , animation) =>ListItemWidgit(
          item: item[index],
            animation: animation,
          onClicked : () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: insertItem,
        child: const Icon(Icons.add),
      ) ,
    );
  }
 void insertItem(){
    final newIndex = 0;
    final newItem = (List.of(listitem)..shuffle()).first;
    
    item.insert(newIndex, newItem);
    listkey.currentState!.insertItem(newIndex,
    duration: Duration(milliseconds: 700));
  }


 void removeItem(int index) {
    final removeItem = item[index];
    item.removeAt(index);
    listkey.currentState!.removeItem(
      index,
        (context, animation) => ListItemWidgit(
            item: removeItem,
            animation: animation,
            onClicked: (){}
        ),
      duration: Duration(milliseconds: 700),
    );
  }
}
