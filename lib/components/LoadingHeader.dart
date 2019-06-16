import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LoadingHeader extends RefreshIndicator {
  @override
  State<StatefulWidget> createState() => _LoadingHeaderState();
}

class _LoadingHeaderState extends State<LoadingHeader> {
  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
      idleText: '下拉刷新',
      completeText: '已刷新',
      releaseText: '释放进行刷新',
      refreshingText: '刷新中...',
    );
  }
}
