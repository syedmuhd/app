import 'package:app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    authController.me();

    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Ionicons.notifications_outline),
            onPressed: () => debugPrint("ASD"),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child:
                    Obx(() => Text(authController.user.value.name.toString()))),
            ListTile(
              title: const Text('Log out'),
              onTap: () => authController.logout(),
            ),
          ],
        ),
      ),
      body: const Center(
          child: Text(
        'You have ',
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
