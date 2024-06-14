import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:go_router/go_router.dart";
import "package:lottie/lottie.dart";

class WelcomeSplashScreen extends StatefulWidget {
  const WelcomeSplashScreen({super.key});

  @override
  State<WelcomeSplashScreen> createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
        vsync: this,
    );

    Future.delayed(const Duration(seconds: 3), () {
      context.go('/welcome');
    });
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/splash bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network("https://lottie.host/477c5dd8-342d-4416-ae9a-1d9226413d13/qGmpCi9CXG.json",
                width: 300,
                height: 300,
                fit: BoxFit.contain,
                controller: _controller,
                frameRate: FrameRate.max,
                onLoaded: (composition) {
                  _controller
                    ..duration = Duration(milliseconds: (composition.duration.inMilliseconds*2.5).round())
                    ..repeat();
                }
            ),
            const SizedBox(height: 20),
            const Text("Green Cycle",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
