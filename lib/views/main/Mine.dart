import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liveapp/components/LoadingHeader.dart';
import 'package:liveapp/components/widgets/ListTileGroup.dart';
import 'package:liveapp/components/widgets/ListTileItem.dart';
import 'package:liveapp/views/about/Index.dart';
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
            SliverList(
              delegate: SliverChildListDelegate([
                ListTileTheme(
                  dense: true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      ListTileGroup(
                        renderDivider: (context) => Divider(height: 1),
                        children: [
                          ListTileItem(
                            leading: Icon(Icons.library_books),
                            title: Text('我的订单'),
                            trailing: Icon(Icons.chevron_right),
                          ),
                          ListTileItem(
                            leading: Icon(Icons.credit_card),
                            title: Text("我的一卡通"),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                      ListTileGroup(
                        renderDivider: (context) => Divider(height: 1),
                        children: [
                          ListTileItem(
                            leading: Icon(Icons.forum),
                            title: Text("我的帖子"),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                      ListTileGroup(
                        renderDivider: (context) => Divider(height: 1),
                        children: [
                          ListTileItem(
                            leading: Icon(Icons.settings),
                            title: Text("设置"),
                            trailing: Icon(Icons.chevron_right),
                          ),
                          ListTileItem(
                            leading: Icon(Icons.info),
                            title: Text("关于我们"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Index()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
