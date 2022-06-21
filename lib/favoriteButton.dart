import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (_controller.isCompleted) {
          _controller.reset();
        } else {
          _controller.forward();
        }
      },
      backgroundColor: Colors.white,
      child: Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
        controller: _controller,
        repeat: true,
        onLoaded: (composition) {
          _controller.duration = composition.duration;
        },
      ),
    );
  }
}
