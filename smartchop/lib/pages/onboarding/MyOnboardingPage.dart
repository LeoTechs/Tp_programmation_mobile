import 'package:flutter/material.dart';
import 'package:smartchop/pages/onboarding/container_images.dart';
import 'package:smartchop/pages/auth/myLoginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyOnboardingPage extends StatefulWidget {
  const MyOnboardingPage({super.key});

  @override
  State<MyOnboardingPage> createState() => _MyOnboardingPageState();
}

class _MyOnboardingPageState extends State<MyOnboardingPage> {
  final PageController controller = PageController();
  bool isLastPage = false;
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
              });
            },
            children: [
              // Page 1
              buildImageContainer(
                  Colors.white,
                  "Bienvenue sur SmartChop",
                  "Organisez vos repas facilement et mangez sain grâce à smartchop.",
                  "../assets/images/slide_1.png"),

              // Page 2
              buildImageContainer(
                  Colors.white,
                  "Suivi de la Nutrition",
                  "Suivez votre apport nutritionnel quotidien..",
                  "../assets/images/slide_3.png"),
              // Page 3
              buildImageContainer(
                  Colors.white,
                  "Calcul de l'IMC",
                  "Obtenez des informations sur votre santé.",
                  "../assets/images/slide_2.png"),
              // Page 4
              buildImageContainer(
                  Colors.white,
                  "Statistiques",
                  "Analysez vos habitudes alimentaires.",
                  "../assets/images/slide_5.png"),
            ]),
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.red,
                      maximumSize: const Size.fromHeight(70)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyLoginPage()));
                  },
                  child: const Text(
                    "Commencer",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(3);
                    },
                    child: const Text(
                      "Ignorer",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),

                  // Add SmoothPageIndicator
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: Colors.red,
                        dotColor: const Color.fromARGB(255, 245, 105, 105),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Suivant",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
