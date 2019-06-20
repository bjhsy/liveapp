import 'package:flutter/material.dart';
import 'package:liveapp/components/widgets/ListTileItem.dart';

class ListTileGroup extends StatelessWidget {
  final List<ListTileItem> children;
  final WidgetBuilder renderDivider;

  ListTileGroup({Key key, @required this.children, this.renderDivider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = List<Widget>();
    this.children.forEach((item) {
      list.add(item);
      if (this.renderDivider != null) {
        list.add(this.renderDivider(context));
      }
    });

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: this.renderDivider != null
            ? list.take(list.length - 1).toList()
            : list,
      ),
    );
  }
}
