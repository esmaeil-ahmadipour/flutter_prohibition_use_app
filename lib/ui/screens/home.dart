import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_prohibition_use_app/util/constants.dart';
import 'package:flutter_prohibition_use_app/util/ip_from_iran.dart';
import 'package:flutter_prohibition_use_app/ui/loading_widget.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:go_router/go_router.dart';

///# [HomePage] Class Documentation
/// A Flutter widget representing the main page of the application.
///
/// The `HomePage` widget is responsible for displaying the application's main content.
///
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// A [_streamController] for managing the IP stream.
  late final StreamController<String> _streamController =
      StreamController<String>();

  /// A [_ipStream] The IP stream to monitor and display.
  late Stream<String> _ipStream;

  @override
  void initState() {
    super.initState();
    _streamController.addStream(ipStream());
    _ipStream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: StreamBuilder<String>(
          stream: _ipStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (isUserIPInRange(snapshot.data!, iranIpList)) {
                Future.delayed(const Duration(seconds: 0), () {
                  context.goNamed(failScreenRoute);
                });
              } else {
                Future.delayed(const Duration(seconds: 0), () {
                  context.goNamed(succeedScreenRoute);
                });
              }
            }
            if (snapshot.hasError) {
              if ("${snapshot.error}" == networkError) {
                restartStream();
              }
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  ///# [restartStream] Method Documentation
  /// Restart the IP stream.
  ///
  /// This method is responsible for restarting the IP stream when an error occurs.
  /// It fetches the current IP address and adds it to the stream, allowing the
  /// application to continue monitoring the IP.
  restartStream() async {
    String? currentIP;
    try {
      currentIP = await IpAddress().getIpAddress();
    } catch (e) {
      if (e == networkError) {
        restartStream();
      }
    }
    if (currentIP != null) {
      _streamController.add(currentIP);
      _streamController.addStream(ipStream());
      _ipStream = _streamController.stream;
    }
  }

  ///# [ipStream] Method Documentation
  /// Generate an IP stream.
  ///
  /// This method generates a stream that periodically fetches the current IP address.
  /// It yields the current IP address as long as it is available and waits for
  /// a specified duration before fetching the IP again.
  Stream<String> ipStream() async* {
    while (true) {
      String? currentIP;
      try {
        currentIP = await IpAddress().getIpAddress();
      } catch (e) {
        if (e == networkError) {
          restartStream();
        }
      }
      if (currentIP != null) {
        yield currentIP;
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
