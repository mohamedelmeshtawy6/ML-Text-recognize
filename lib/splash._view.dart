import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mesht_ocr/core/utili/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    initSliderAnimation();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(
        AppRouter.homeview,
      );
    });
  }

  void initSliderAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: const Offset(0, 30), end: const Offset(0, 0))
        .animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Image.asset('assets/images/imagetext.png',width: 150,
        height: 150,),
          const SizedBox(
            height: 4,
          ),
          AnimatedText(animation: animation),
          TextFormField(onChanged: (d){},)
        ],
      ),
    );
}

}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => SlideTransition(
        position: animation,
        child: const Text(
          style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 17, 16, 16)),
          'Photo to Text converter',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
