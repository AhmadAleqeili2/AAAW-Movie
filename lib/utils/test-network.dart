
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_movie/view/initial_page.dart';
import 'package:just_movie/widgets/error_message.dart';
import 'dart:developer' as developer;
class UtilsTestNetwok extends StatefulWidget {
  const UtilsTestNetwok({super.key});

  @override
  State<UtilsTestNetwok> createState() => _VTestNetwokState();
}

class _VTestNetwokState extends State<UtilsTestNetwok> {
   List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    // ignore: avoid_print
    print('Connectivity changed: $_connectionStatus');
  }


  Widget view() {
    if (_connectionStatus[0] == ConnectivityResult.none) {
      return WErrorMassage(
        massage:"error no network",
        callback: () {
          setState(() {});
        },
      );
    }
    else{
    return const InitialPage();}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view(),
    );
  }
}