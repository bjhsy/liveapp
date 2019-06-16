import 'package:flutter/material.dart';
import 'package:liveapp/components/LoadingHeader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'CommunitySearch.dart';

class Community extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('社区'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CommunitySearch(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("FloatingActionButton"),
        child: Icon(Icons.add),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1000)); // 等待异步操作
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
          _refreshController.loadComplete();
        },
        header: LoadingHeader(),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => Text('aaa ' + index.toString()),
          physics: AlwaysScrollableScrollPhysics(),
        ),
        // child: Container(
        //   child: Text('aaa'),
        // ),
      ),
    );
    // return NestedScrollView(
    //   headerSliverBuilder: (context, s) {
    //     return [
    //       SliverAppBar(
    //         pinned: true,
    //         expandedHeight: 120,
    //         flexibleSpace: FlexibleSpaceBar(),
    //       ),
    //     ];
    //   },

    // );
  }
}
