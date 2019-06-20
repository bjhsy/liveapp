import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final Widget leading;

  final Widget title;

  final Widget subtitle;

  final Widget trailing;

  final bool isThreeLine;

  final bool dense;

  final EdgeInsetsGeometry contentPadding;

  final bool enabled;

  final GestureTapCallback onTap;

  final GestureLongPressCallback onLongPress;

  final bool selected;

  final Color color;

  const ListTileItem({
    Key key,
    this.color = Colors.white,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      child: ListTile(
        contentPadding: this.contentPadding,
        enabled: this.enabled,
        dense: this.dense,
        isThreeLine: this.isThreeLine,
        key: this.key,
        leading: this.leading,
        onLongPress: this.onLongPress,
        onTap: this.onTap,
        selected: this.selected,
        subtitle: this.subtitle,
        title: this.title,
        trailing: this.trailing,
      ),
    );
  }
}
