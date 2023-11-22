import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  SigninView({Key? key}) : super(key: key);
  final SigninController _authController = Get.put(SigninController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGNIN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZYZRnFinCRXJw89SIRVXYnX27jjH5CmpqEgxAaKUfAGyD7kACvXutDSl51VPBaSPlLTE&usqp=CAU'),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                        _authController.registerUser(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Daftar'),
              );
            }),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "Sudah Punya Akun?",
            //       style: TextStyle(fontSize: 16),
            //     ),
            //     const SizedBox(
            //       width: 6,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Get.toNamed("/login");
            //       },
            //       child: const Text("Log In",
            //           style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.blue)),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
