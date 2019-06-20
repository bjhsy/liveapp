import 'package:flutter/material.dart';
import 'package:liveapp/components/LoadingHeader.dart';
import 'package:liveapp/views/main/widgets/Panel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
      floatingActionButton: SpeedDial(
        closeManually: false,
        curve: Curves.bounceIn,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        elevation: 8.0,
        child: Icon(Icons.add),
        children: [
          SpeedDialChild(
            child: Icon(Icons.games),
            backgroundColor: Colors.red,
            label: '活动',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('FIRST CHILD'),
          ),
          SpeedDialChild(
            child: Icon(Icons.shopping_basket),
            backgroundColor: Colors.blue,
            label: '二手',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),
          SpeedDialChild(
            child: Icon(Icons.new_releases),
            backgroundColor: Colors.green,
            label: '帖子',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: NestedScrollView(
          headerSliverBuilder: (context, e) => [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Panel(
                      child: Text('filter'),
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ]),
                ),
              ],
          body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () async {
              await Future.delayed(
                  const Duration(milliseconds: 1000)); // 等待异步操作
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              await Future.delayed(const Duration(milliseconds: 1000));
              _refreshController.loadComplete();
            },
            header: LoadingHeader(),
            child: ListView.builder(
              itemCount: 100,
              primary: false,
              itemBuilder: (context, index) => Panel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/main/9_07head.png'),
                                height: 44,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '主标题',
                                  style: Theme.of(context).textTheme.subhead,
                                ),
                                Text(
                                  '副标题',
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('内容'),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
