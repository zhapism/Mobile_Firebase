import 'package:firebase/app/modules/login/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selamat datang di Aplikasi',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () async {
                await _signOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginView(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
