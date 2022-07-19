import 'package:flutter/material.dart';
import 'package:travel_organizer/app/core/navigation/app_navigator.dart';
import 'package:travel_organizer/app/core/services/device_information_service.dart';
import 'package:travel_organizer/app/presentation/presentation_resources/images/app_images.dart';

enum ActionAnimation {
  animate,
  stoped,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

ValueNotifier<ActionAnimation> animatedButtonListenable =
    ValueNotifier<ActionAnimation>(ActionAnimation.stoped);

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenPerimeter = DeviceInformationService.screenPerimeter(context);
    return Scaffold(
      backgroundColor: const Color(0xAA322F40),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenPerimeter * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: screenPerimeter * 0.01),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: screenPerimeter * 0.03,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenPerimeter * 0.05),
            const AppTextFormField(hintText: "email"),
            SizedBox(height: screenPerimeter * 0.01),
            const AppTextFormField(hintText: "senha"),
            SizedBox(height: screenPerimeter * 0.04),
            const AnimatedButtonLoginPage(),
          ],
        ),
      ),
    );
  }
}

class AppTextFormField extends StatelessWidget {
  final String hintText;
  const AppTextFormField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenPerimeter = DeviceInformationService.screenPerimeter(context);
    return Container(
      width: screenPerimeter * 0.13,
      height: screenPerimeter * 0.025,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: const Color(0xAA322F40),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xAA322F40),
              ),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

class AnimatedButtonLoginPage extends StatelessWidget {
  const AnimatedButtonLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenPerimeter = DeviceInformationService.screenPerimeter(context);

    return ValueListenableBuilder<ActionAnimation>(
      valueListenable: animatedButtonListenable,
      builder: (context, actionAnimation, _) {
        if (actionAnimation == ActionAnimation.animate) {
          return SizedBox(
            height: screenPerimeter * 0.03,
            width: MediaQuery.of(context).size.width,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1500),
              tween: Tween<double>(
                begin: MediaQuery.of(context).size.width / 2 -
                    (screenPerimeter * 0.02),
                end: MediaQuery.of(context).size.width + screenPerimeter * 0.04,
              ),
              builder: (context, double value, child) {
                return Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2 -
                          (screenPerimeter * 0.04),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        height: screenPerimeter * 0.03,
                        width: screenPerimeter * 0.08,
                      ),
                    ),
                    Positioned(
                      left: value,
                      child: SizedBox(
                        height: screenPerimeter * 0.03,
                        width: screenPerimeter * 0.04,
                        child: AppImages.airPlaneImage,
                      ),
                    ),
                  ],
                );
              },
              onEnd: () {
                AppNavigation.navigateToNamed(
                    context, "/home", NavigationType.pushToNamed);
              },
            ),
          );
        } else {
          return AnimatedOpacity(
            opacity: 1,
            duration: const Duration(seconds: 1),
            child: GestureDetector(
              onTap: () {
                animatedButtonListenable.value = ActionAnimation.animate;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: screenPerimeter * 0.03,
                width: screenPerimeter * 0.08,
                child: const Center(
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
