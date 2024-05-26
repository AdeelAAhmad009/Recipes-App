import 'package:api_project/controller/recipes_controller.dart';
import 'package:api_project/models/recipes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final Recipes? recipe;
  const DetailScreen({super.key, this.recipe});

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
                    child: Image.network(widget.recipe!.image!, fit: BoxFit.cover),
                  ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${widget.recipe!.name!}",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Difficulty: ${widget.recipe!.difficulty!}",
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
                  Row(
                    children: [
                      Text(
                        "Cuisine:",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        widget.recipe!.cuisine!,
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
                          Text(
                            textAlign: TextAlign.center,
                            "Prepare Time\n${widget.recipe!.prepTimeMinutes!} Minutes",
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
                          Text(
                            textAlign: TextAlign.center,
                            "Cook Time\n${widget.recipe!.cookTimeMinutes!} Minutes",
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
                          Text(
                            textAlign: TextAlign.center,
                            "Servings\n${widget.recipe!.servings!}",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  //TODO Calories Per Serving
                  Text(
                    "Calories Per Serving: ${widget.recipe!.caloriesPerServing!.toString()}",
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
                        widget.recipe!.ingredients!.length,
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
                            SizedBox(
                              width: 300,
                              child: Text(
                                widget.recipe!.ingredients![index],
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
                      widget.recipe!.ingredients!.length,
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
                          SizedBox(
                            width: 300,
                            child: Text(
                              widget.recipe!.ingredients![index],
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
                      widget.recipe!.mealType!.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Text(
                          widget.recipe!.mealType![index],
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
                        initialRating: widget.recipe!.rating,
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
                      Text(
                        widget.recipe!.rating.toString(),
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
                      widget.recipe!.tags!.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: Text(
                          "#${widget.recipe!.tags![index]}",
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
