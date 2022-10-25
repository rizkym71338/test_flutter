import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_status_controller.dart';

class DetailStatusView extends GetView<DetailStatusController> {
  Faker faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My status'),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      backgroundImage: NetworkImage(
                        "https://picsum.photos/id/${index}/300/300",
                      ),
                    ),
                    title: Text(
                      Random().nextInt(100).toString() + " views",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(faker.date.time()),
                    trailing: PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.green[800],
                        ),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("Forward"),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text("Share..."),
                                value: 2,
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                value: 3,
                              ),
                            ],
                        onSelected: (value) {
                          if (value == 3) {
                            Get.snackbar("Status deleted",
                                "Succes to delete your status",
                                backgroundColor: Colors.white,
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ));
                          }
                        }),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Text(
                    "Your status update will disappear after 24 hours.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
