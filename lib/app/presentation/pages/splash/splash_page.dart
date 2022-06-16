import 'package:flutter/material.dart';
import 'package:travel_organizer/app/core/navigation/app_navigator.dart';
import 'package:travel_organizer/app/core/services/device_information_service.dart';
import 'package:travel_organizer/app/presentation/animations/package_animations/lottie_animations.dart';
import 'package:travel_organizer/app/presentation/images/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    double screenPerimeter = DeviceInformationService.screenPerimeter(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 3000),
              tween: Tween<double>(
                  begin: -MediaQuery.of(context).size.width -
                      screenPerimeter * 0.1,
                  end: MediaQuery.of(context).size.width),
              builder: (context, double value, child) {
                return Stack(
                  children: [
                    SizedBox(
                      height: screenPerimeter * 0.8,
                      width: MediaQuery.of(context).size.width,
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(milliseconds: 1500),
                        child: PackageAnimations.cloudsAnimation,
                        onEnd: () {
                          AppNavigation.navigateToNamed(context, "/loginPage",
                              NavigationType.pushNamedAndRemoveUntil);
                        },
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 2 -
                          (screenPerimeter * 0.01),
                      left: value / 2 - (screenPerimeter * 0.1),
                      child: SizedBox(
                        height: screenPerimeter * 0.02,
                        width: screenPerimeter * 0.2,
                        child: Center(
                          child: Text(
                            "Your Travel",
                            style: TextStyle(
                              fontSize: screenPerimeter * 0.015,
                              color: Colors.black87,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 2 -
                          (screenPerimeter * 0.02),
                      left: value + screenPerimeter * 0.1,
                      child: SizedBox(
                        height: screenPerimeter * 0.04,
                        width: screenPerimeter * 0.08,
                        child: AppImages.airPlaneImage,
                      ),
                    ),
                  ],
                );
              },
              onEnd: () {
                opacity = 1;
              },
            ),
          )
        ],
      ),
    );
  }
}
