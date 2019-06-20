import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final Color color;

  Panel({
    Key key,
    @required this.child,
    this.margin = const EdgeInsets.only(bottom: 10),
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: this.margin,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: this.child,
    );
  }
}
