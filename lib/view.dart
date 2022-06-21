import 'package:animation_sample/favoriteButton.dart';
import 'package:animation_sample/shareButton.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FavoriteButton(),
            ShareButton(),
            loadingButton(),
          ],
        ),
      ),
    );
  }
}
