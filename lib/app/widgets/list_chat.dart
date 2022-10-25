import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/modules/home/controllers/home_controller.dart';

class ListChat extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  Faker faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        onLongPress: () => homeController.isSelected.value = true,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(
              "https://picsum.photos/id/${index}/300/300",
            ),
          ),
          title: Text(
            faker.person.name(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.blue,
                size: 18,
              ),
              SizedBox(
                width: 5,
              ),
              Text(faker.lorem.toString())
            ],
          ),
          trailing: Text(faker.date.time()),
        ),
      ),
    );
  }
}
