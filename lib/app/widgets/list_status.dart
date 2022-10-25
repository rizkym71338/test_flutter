import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/modules/detail_status/views/detail_status_view.dart';

class ListStatus extends StatelessWidget {
  Faker faker = new Faker();

  dynamic handleMute() {
    Get.defaultDialog(
      title: "Mute this status update?",
      middleText:
          "New status update from this status won`t appear under recent updates anymore.",
      confirm: InkWell(
        onTap: () {
          Get.back();
          Get.snackbar(
            "Status Muted",
            "Succes to mute this status",
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Text(
            "MUTE",
            style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      cancel: InkWell(
        onTap: () => Get.back(),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Text(
            "CANCEL",
            style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      radius: 10,
      contentPadding: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      titlePadding: EdgeInsets.symmetric(
        vertical: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://picsum.photos/seed/picsum/200/300",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                "My Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Tap to add status update"),
              trailing: IconButton(
                onPressed: () => Get.to(DetailStatusView(),
                    transition: Transition.rightToLeftWithFade),
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.green[800],
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Recent updates",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onLongPress: handleMute,
              onTap: () {},
              child: ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://picsum.photos/id/${20 + index}/200/300",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white),
                            color: Colors.grey[300]),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  faker.person.name(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(faker.date.time()),
              ),
            ),
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Viewed Updates",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onLongPress: handleMute,
              onTap: () {},
              child: ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://picsum.photos/id/${index}/200/300",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white),
                            color: Colors.grey[300]),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  faker.person.name(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(faker.date.time()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
