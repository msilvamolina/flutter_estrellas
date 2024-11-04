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
  late FirebaseRemoteConfig remoteConfig;
  StreamSubscription? subscription;
  RemoteConfigUpdate? update;
  bool maintenance = false;
  String forceUpdate = '0';
  String lastVersion = '0';

  @override
  void initState() {
    initialize();
    listenData();
    super.initState();
  }

  Future<void> initialize() async {
    try {
      remoteConfig = FirebaseRemoteConfig.instance;
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

  Future<void> listenData() async {
    try {
      if (subscription != null) {
        await subscription!.cancel();
        setState(() {
          subscription = null;
        });
      }
      setState(() {
        subscription = remoteConfig.onConfigUpdated.listen((event) async {
          // Make new values available to the app.
          await remoteConfig.activate();

          setState(() {
            update = event;
          });
        });
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
          Text(
            update != null ? 'Updated keys: ${update?.updatedKeys}' : 'No data',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
