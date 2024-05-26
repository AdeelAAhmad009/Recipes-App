import 'package:api_project/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    )),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(authController.profileModel!.image!),
                    ),
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
              Positioned(
                left: 20,
                bottom: 20,
                child: Text(
                  "Name: ${authController.profileModel!.firstName} ${authController.profileModel!.lastName}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              )
            ],
          ),
          SizedBox(height: 50),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Email: ${authController.profileModel!.email}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "User Name: ${authController.profileModel!.username}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Gender: ${authController.profileModel!.gender}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
