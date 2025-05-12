import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/colors/custom_colors.dart';

class LoadingCircle extends StatelessWidget {
  final Widget child;
  final RxBool isLoading;
  final double size;

  const LoadingCircle({
    Key? key,
    required this.child,
    required this.isLoading,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>
    Column(
      children: [
      
        if (isLoading.value)
          Padding(
            padding: const EdgeInsets.only( bottom: 5),
            child: SizedBox(
              height: size,
              child: DotLoadingAnimation(size: size),
            ),
          ),
            child,
      ],
    )
    ) ;
  }
}

class DotLoadingAnimation extends StatefulWidget {
  final double size;
  const DotLoadingAnimation({Key? key, this.size = 20}) : super(key: key);

  @override
  _DotLoadingAnimationState createState() => _DotLoadingAnimationState();
}

class _DotLoadingAnimationState extends State<DotLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: Dot(index: index, animation: _animation),
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final int index;
  final Animation<double> animation;
  const Dot({Key? key, required this.index, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double delay = index * 0.2;
        double value = (animation.value - delay);
        value = value < 0 ? 0 : value > 1 ? 1 : value;

        return Opacity(
          opacity: value,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.deepPurple,
            ),
          ),
        );
      },
    );
  }
}
