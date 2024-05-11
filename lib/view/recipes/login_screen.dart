import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/gradient_text.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              SizedBox(height: 20),
              Lottie.asset('assets/lottie_json/f.json'),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.blueGrey),
                  labelText: "Email",
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
              SizedBox(height: 15),
              TextField(
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
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Get.to(const HomeScreen(), transition: Transition.upToDown, duration: const Duration(milliseconds: 800));
                },
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 25),
                  decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
