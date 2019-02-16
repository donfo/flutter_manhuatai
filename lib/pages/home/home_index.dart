import 'package:flutter/material.dart';

class HomeIndex extends StatefulWidget {
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 9);
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Container(
            height: 30.0,
            color: Colors.grey,
          ),
          // flexibleSpace: Container(
          //   color: Colors.greenAccent,
          // ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Container(
              color: Colors.blue,
              height: 30.0,
              child: TabBar(
                controller: tabController,
                labelPadding: const EdgeInsets.symmetric(horizontal: 12.5),
                labelStyle: TextStyle(fontSize: 16.0),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text('排行'),
                  ),
                  Tab(
                    child: Text('推荐'),
                  ),
                  Tab(
                    child: Text('日更'),
                  ),
                  Tab(
                    child: Text('后宫'),
                  ),
                  Tab(
                    child: Text('萝莉'),
                  ),
                  Tab(
                    child: Text('玄幻'),
                  ),
                  Tab(
                    child: Text('漫改'),
                  ),
                  Tab(
                    child: Text('社会'),
                  ),
                  Tab(
                    child: Text('生活'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          RefreshIndicator(
            onRefresh: () async {
              return Future.delayed(const Duration(milliseconds: 2000)).then((res) {
                print('下拉刷新成功');
              });
            },
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) => Text(
                    '这是排行的TabBarItem $index',
                    style: TextStyle(color: Colors.red),
                  ),
            ),
          ),
          Text(
            '这是推荐的TabBarItem',
            style: TextStyle(color: Colors.green),
          ),
          Text(
            '这是日更的TabBarItem',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            '这是后宫的TabBarItem',
            style: TextStyle(color: Colors.cyan),
          ),
          Text(
            '这是萝莉的TabBarItem',
            style: TextStyle(color: Colors.pink),
          ),
          Text(
            '这是玄幻的TabBarItem',
            style: TextStyle(color: Colors.purple),
          ),
          Text(
            '这是漫改的TabBarItem',
            style: TextStyle(color: Colors.orange),
          ),
          Text(
            '这是社会的TabBarItem',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '这是生活的TabBarItem',
            style: TextStyle(color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}