import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO The upper part
            Stack(
              children: [
                //TODO IMAGE
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(70)),
                      child: Image.asset(
                        "assets/images/ff.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                //TODO BACK ARROW
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
                //TODO NAME
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // height: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(70),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.5),
                          Colors.white.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: Classic Margherita Pizza",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Difficulty:",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //TODO DETAIL
            //TODO The lower part
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  //TODO Cuisine
                  const Row(
                    children: [
                      Text(
                        "Cuisine:",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        " Italian",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  //TODO serving
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Image.asset("assets/images/clock.png", height: 40, color: Colors.white),
                          const Text(
                            textAlign: TextAlign.center,
                            "Prepare Time\n20 Minutes",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ]),
                      ),
                      Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Image.asset("assets/images/clock1.png", height: 40, color: Colors.white),
                          const Text(
                            textAlign: TextAlign.center,
                            "Cook Time\n20 Minutes",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ]),
                      ),
                      Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Image.asset("assets/images/man.png", height: 40, color: Colors.white),
                          const Text(
                            textAlign: TextAlign.center,
                            "Servings\n2",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  //TODO Calories Per Serving
                  const Text(
                    "Calories Per Serving: 300",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10), //TODO Ingredients
                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(
                              width: 300,
                              child: Text(
                                "Fresh mozzarella cheese",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //TODO Instructions
                  const Text(
                    "Instructions",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const SizedBox(
                            width: 300,
                            child: Text(
                              "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //TODO Meal Type
                  const Text(
                    "Meal Type",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 10,
                    children: List.generate(
                      2,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: const Text(
                          "Dinner",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), //TODO Rating
                  Row(
                    children: [
                      const Text(
                        "Rating:",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const Spacer(),
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.orange),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "3.2",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  //TODO Tags
                  Wrap(
                    spacing: 6,
                    runSpacing: 10,
                    children: List.generate(
                      4,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: const Text(
                          "#Italian",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
