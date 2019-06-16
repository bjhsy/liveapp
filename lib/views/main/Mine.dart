import 'package:flutter/material.dart';
import 'package:liveapp/components/LoadingHeader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MineState();
}

class _MineState extends State<Mine> {
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: LoadingHeader(),
        enablePullUp: true,
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1000)); // 等待异步操作
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
          _refreshController.loadComplete();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/main/9_07head.png'),
                    ),
                    Text('aaa'),
                  ],
                ),
              ),
              expandedHeight: 120,
            ),
            SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildListDelegate([
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
                Text('aa'),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
