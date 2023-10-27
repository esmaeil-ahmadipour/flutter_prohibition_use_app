import 'package:flutter/material.dart';

///# [SucceedWidget] Class Documentation
/// A Flutter widget to display a "Success" message with a checkmark icon.
///
/// This widget is designed to show a success message with a green background
/// and a checkmark icon when a certain action or process is successfully completed.
class SucceedWidget extends StatelessWidget {
  const SucceedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
          alignment: AlignmentDirectional.center,
          color: Colors.green,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 64, color: Colors.white),
              Text(
                "Enjoy !\nYour Are Connected.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
