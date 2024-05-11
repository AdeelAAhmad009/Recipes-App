import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
                    child: const CircleAvatar(radius: 80),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 15,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.4)),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
