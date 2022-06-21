import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isOpen = false;

  _toggleShare() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          width: isOpen ? 240 : 48,
          height: 48,
          decoration: ShapeDecoration(
            color: Colors.grey[400],
            shape: const StadiumBorder(),
          ),
        ),
        Container(
          width: 40,
          margin: const EdgeInsets.only(left: 4),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 450),
            //ボタンが押される前
            firstChild: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _toggleShare(),
            ),
            secondChild: IconButton(
              //ボタンが押される後
              icon: const Icon(Icons.close),
              onPressed: () => _toggleShare(),
            ),
            crossFadeState:
                !isOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
        AnimatedOpacity(
          opacity: isOpen ? 1 : 0,
          duration: const Duration(milliseconds: 450),
          child: Container(
            width: 240,
            //メインボタンの位置を確保するため
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.ios_share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.iso_sharp),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
