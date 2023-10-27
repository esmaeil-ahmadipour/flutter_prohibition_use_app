import 'package:flutter/material.dart';

///# [LoadingWidget] Class Documentation
/// A Flutter widget to display a loading indicator.
///
/// This widget is designed to show a circular loading indicator (a spinning wheel)
/// to indicate that some process or action is in progress.
///
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
