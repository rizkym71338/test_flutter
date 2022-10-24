import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setState(() {
              _activeTab = tabController.index;
            });
          }
        });
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Chat Apps',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              backgroundColor: Colors.green[800],
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text("New group")),
                    PopupMenuItem(child: Text("New broadcast")),
                    PopupMenuItem(child: Text("Starred messages")),
                    PopupMenuItem(child: Text("Settings")),
                  ],
                )
              ],
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text(
                      "CHATS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "STATUS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "CALLS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  child: listChat(),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                        title: Text(
                          "My Status",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Tap to add status update"),
                        trailing: PopupMenuButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.green[800],
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(child: Text("Forward")),
                            PopupMenuItem(child: Text("Share ...")),
                            PopupMenuItem(child: Text("Delete")),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Viewed Updates",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                )),
                            title: Text(
                              "Nama Orang",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "31 minutes ago",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                          title: Text(
                            "Nama Orang",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "31 minutes ago",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                          title: Text(
                            "Nama Orang",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "31 minutes ago",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Center(
                  child: listCall(),
                ),
              ],
            ),
            floatingActionButton: _activeTab == 0
                ? FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.green[800],
                    child: Icon(Icons.message),
                  )
                : _activeTab == 1
                    ? Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        children: [
                          Container(
                              height: 44,
                              width: 44,
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey[900],
                                ),
                              )),
                          SizedBox(height: 20),
                          Container(
                              child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.green[800],
                            child: Icon(Icons.camera_alt),
                          ))
                        ],
                      )
                    : FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.green[800],
                        child: Icon(Icons.add_ic_call),
                      ));
      }),
    );
  }
}

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainView();
  }
}

class listChat extends StatelessWidget {
  const listChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.white,
              )),
          title: Text(
            "Nama Orang",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Isi Chat ...")
            ],
          ),
          trailing: Text("11.00"),
        ),
      ),
    );
  }
}

class listCall extends StatelessWidget {
  const listCall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.white,
              )),
          title: Text(
            "Nama Orang",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.call_received,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text("October 20, 13:59")
            ],
          ),
          trailing: Icon(
            Icons.call,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
