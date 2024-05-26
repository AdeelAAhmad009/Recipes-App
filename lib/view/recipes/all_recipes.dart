import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../controller/recipes_controller.dart";
import "../../utils/gradient_text.dart";
import "detail_screen.dart";

class AllRecipes extends StatefulWidget {
  const AllRecipes({super.key});

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: GetBuilder(
          init: RecipesController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.isSearchOn = false;
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_outlined, size: 30, color: Colors.white)),
                      const SizedBox(width: 10),
                      GradientText(
                        'ENJOY RECIPES',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        gradient: LinearGradient(colors: [Colors.blue.shade400, Colors.blue.shade900, Colors.deepPurpleAccent]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    onChanged: (value) {
                      controller.isSearchOn = true;
                      controller.searchFunction(value);
                      controller.update();
                    },
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white, size: 40),
                      labelText: "Search",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 30),
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
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Limit:  ${controller.searchModel?.limit}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                controller.searchLoading
                    ? Center(child: CircularProgressIndicator())
                    : controller.isSearchOn
                        ? searchData(controller)
                        : withoutSearchData(controller),
              ],
            );
          }),
    );
  }

  Expanded withoutSearchData(RecipesController controller) {
    return Expanded(
        child: GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 15.0,
        // mainAxisExtent: 300,
        childAspectRatio: 0.65,
      ),
      itemCount: controller.recipesModel!.recipes!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(const DetailScreen(), transition: Transition.upToDown, duration: const Duration(seconds: 1));
          },
          child: Container(
            width: 350,
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      controller.recipesModel!.recipes![index].image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${controller.recipesModel!.recipes![index].name}",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Difficulty: ${controller.recipesModel!.recipes![index].difficulty}",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Rating: ${controller.recipesModel!.recipes![index].rating.toString()}",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  Expanded searchData(RecipesController controller) {
    return Expanded(
        child: GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 15.0,
        // mainAxisExtent: 300,
        childAspectRatio: 0.65,
      ),
      itemCount: controller.searchModel?.recipes?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(const DetailScreen(), transition: Transition.upToDown, duration: const Duration(seconds: 1));
          },
          child: Container(
            width: 350,
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      controller.searchModel!.recipes![index].image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${controller.searchModel!.recipes![index].name}",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Difficulty: ${controller.searchModel!.recipes![index].difficulty}",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Rating: ${controller.searchModel!.recipes![index].rating.toString()}",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
