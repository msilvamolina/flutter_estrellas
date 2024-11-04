import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class RemoteConfigLayout extends StatefulWidget {
  const RemoteConfigLayout({super.key, required this.child});
  final Widget child;

  @override
  State<RemoteConfigLayout> createState() => _RemoteConfigLayoutState();
}

class _RemoteConfigLayoutState extends State<RemoteConfigLayout> {
  StreamSubscription? subscription;
  RemoteConfigUpdate? update;
  bool maintenance = false;
  String forceUpdate = '0';
  String lastVersion = '0';

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      // Using zero duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();

      setState(() {
        maintenance = remoteConfig.getBool('maintenance');
        forceUpdate = remoteConfig.getString('force_update');
        lastVersion = remoteConfig.getString('last_version');
      });
    } on PlatformException catch (exception) {
      // Fetch exception.
      print(exception);
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RemoteConfigLayoutView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            maintenance.toString(),
            style: TextStyle(fontSize: 20),
          ),
          Text(
            forceUpdate,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            lastVersion,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
