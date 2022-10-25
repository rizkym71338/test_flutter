import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ListCall extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[800],
                child: Icon(
                  Icons.link,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Create call link",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Share a link for your Chat Apps call"),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Recent",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ),
            ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                    faker.person.name(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.call_received,
                        color: Colors.red,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(faker.date.time())
                    ],
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
