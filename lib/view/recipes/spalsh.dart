import 'package:api_project/controller/auth_controller.dart';
import 'package:api_project/view/recipes/home_screen.dart';
import 'package:api_project/view/recipes/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utils/gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());
  String? data;
  Future<void> checkUserData() async {
    data = await authController.getUserDate();
  }

  @override
  void initState() {
    checkUserData();
    Future.delayed(const Duration(seconds: 6), () {
      // data != null
      //     ?
      Get.to(const HomeScreen(), transition: Transition.upToDown, duration: const Duration(milliseconds: 800));
      // : Get.to(LoginScreen(), transition: Transition.upToDown, duration: const Duration(milliseconds: 800));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Lottie.asset('assets/lottie_json/ff.json', repeat: false),
            GradientText(
              'Love & Lemon',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              gradient: LinearGradient(colors: [Colors.blue.shade400, Colors.blue.shade900, Colors.deepPurpleAccent]),
            ),
            const Text(
              "What are you cooking today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3)
          ],
        ),
      ),
    );
  }
}
