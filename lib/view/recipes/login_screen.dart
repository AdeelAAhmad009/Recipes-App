import 'package:api_project/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utils/gradient_text.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            GradientText(
              'WELL COME',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              gradient: LinearGradient(colors: [Colors.blue.shade400, Colors.blue.shade900, Colors.deepPurpleAccent]),
            ),
            const SizedBox(height: 20),
            Lottie.asset('assets/lottie_json/f.json'),
            const SizedBox(height: 50),
            TextField(
              controller: authController.userName,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.blueGrey),
                labelText: "User name",
                labelStyle: const TextStyle(color: Colors.blueGrey),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: authController.password,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.blueGrey),
                labelText: "Password",
                labelStyle: const TextStyle(color: Colors.blueGrey),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GetBuilder<AuthController>(builder: (cont) {
              return cont.loading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : InkWell(
                      onTap: () {
                        cont.loginController();
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
