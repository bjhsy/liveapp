import 'package:flutter/material.dart';
import 'package:liveapp/components/LoadingHeader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    return NestedScrollView(
      headerSliverBuilder: (context, s) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(),
          ),
        ];
      },
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1000)); // 等待异步操作
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
          _refreshController.loadComplete();
        },
        header: LoadingHeader(),
        child: Container(
          child: Text('aaa'),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('社区论坛'),
    //     centerTitle: false,
    //   ),
    //   body: Center(
    //     child: Text('消息列表'),
    //   ),
    // );
  }
}
