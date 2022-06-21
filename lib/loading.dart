import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class loadingButton extends StatefulWidget {
  const loadingButton({Key? key}) : super(key: key);

  @override
  State<loadingButton> createState() => _loadingButtonState();
}

class _loadingButtonState extends State<loadingButton> {
  ButtonState state = ButtonState.idle;
  @override
  Widget build(BuildContext context) {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: const IconedButton(
            text: "Login",
            icon: Icon(Icons.send, color: Colors.white),
            color: Colors.black),
        ButtonState.loading:
            const IconedButton(text: "Loading", color: Colors.black),
        ButtonState.fail: IconedButton(
            text: "Failed",
            icon: const Icon(Icons.cancel, color: Colors.white),
            color: Colors.red.shade300),
        ButtonState.success: IconedButton(
            text: "Success",
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            color: Colors.green.shade400)
      },
      onPressed: () {
        setState(() {
          state = ButtonState.success;
        });
      },
      state: state,
    );
  }
}
