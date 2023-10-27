import 'package:flutter/material.dart';

///# [FailWidget] Class Documentation
/// A Flutter widget to display a "Fail" message with a warning icon.
///
/// This widget is designed to show a failure message with a red background
/// and a warning icon when a certain action or process fails or an error occurs.
///
class FailWidget extends StatelessWidget {
  const FailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
          alignment: AlignmentDirectional.center,
          color: Colors.red,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning, size: 64, color: Colors.white),
              Text(
                "This IP Is Blocked !",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
