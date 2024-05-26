import 'package:api_project/controller/auth_controller.dart';
import 'package:api_project/controller/recipes_controller.dart';
import 'package:api_project/view/recipes/detail_screen.dart';
import 'package:api_project/view/recipes/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/gradient_text.dart';
import 'all_recipes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  AuthController authController = Get.put(AuthController());
  RecipesController recipesController = Get.put(RecipesController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipesController.recipes();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipesController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.2),
          body: controller.loading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70), //TODO Header
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(ProfileScreen());
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(authController.profileModel!.image!),
                                ),
                                const SizedBox(width: 10),
                                GradientText(
                                  '${authController.profileModel!.firstName} ${authController.profileModel!.lastName} ',
                                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  gradient: LinearGradient(
                                      colors: [Colors.blue.shade400, Colors.blue.shade900, Colors.deepPurpleAccent]),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Total Recipes: ${recipesController.recipesModel!.total.toString()}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          Text(
                            "Limit: ${recipesController.recipesModel!.limit.toString()}",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // TODO Title
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: Colors.grey.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular Recipes",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(const AllRecipes(),
                                transition: Transition.upToDown, duration: const Duration(milliseconds: 800)),
                            child: const Row(
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward_ios_outlined, color: Colors.white)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.recipesModel?.recipes?.length ?? 0,
                        separatorBuilder: (context, index) => SizedBox(width: 10.w),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                              pageController.animateToPage(currentIndex,
                                  duration: const Duration(milliseconds: 500), curve: Curves.ease);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(controller.recipesModel!.recipes![index].image!),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  controller.recipesModel!.recipes![index].name!,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    //TODO Page View
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemCount: controller.recipesModel?.recipes?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  DetailScreen(
                                    recipe: controller.recipesModel?.recipes?[index],
                                  ),
                                  transition: Transition.upToDown,
                                  duration: const Duration(seconds: 1));
                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              height: 500,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(controller.recipesModel!.recipes![index].image!),
                                ),
                              ),
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withOpacity(0.5),
                                      Colors.black.withOpacity(0.9),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "Name: ${controller.recipesModel!.recipes![index].name!}",
                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Difficulty: ${controller.recipesModel!.recipes![index].difficulty!}",
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    //TODO Controller
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_circle_left_outlined, size: 50, color: Colors.white),
                            onPressed: () {
                              if (currentIndex <= 0) {
                                Get.snackbar("Error", "You are already at 1st page");
                              } else {
                                setState(() {
                                  pageController.previousPage(duration: const Duration(seconds: 1), curve: Curves.slowMiddle);
                                });
                              }
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "Current Recipes Number",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                (currentIndex + 1).toString(),
                                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_circle_right_outlined, size: 50, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ));
    });
  }
}
