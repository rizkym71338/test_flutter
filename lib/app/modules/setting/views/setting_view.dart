import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: false,
        backgroundColor: Colors.green[800],
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.5, color: Colors.grey.shade200),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Rizky Maulana",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Available"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.green[800],
                ),
              ),
            ),
          ),
          ListMenu(
            title: "Account",
            subtitle: "Privcay, security, change number",
            leading: Icons.vpn_key,
          ),
          ListMenu(
            title: "Chats",
            subtitle: "Theme, wallpapers, chat history",
            leading: Icons.message,
          ),
          ListMenu(
            title: "Notifications",
            subtitle: "Message, group, & call tones",
            leading: Icons.add_alert,
          ),
          ListMenu(
            title: "Storage and data",
            subtitle: "Network usage, auto download",
            leading: Icons.storage,
          ),
          ListMenu(
            title: "App language",
            subtitle: "English (phone`s language)",
            leading: Icons.language,
          ),
          ListMenu(
            title: "Help",
            subtitle: "Help center, contact us, privacy policy",
            leading: Icons.help_outline,
          ),
          ListMenu(
            title: "Invite a friend",
            subtitle: " ",
            leading: Icons.people,
          ),
        ],
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  const ListMenu({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leading,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(leading),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
