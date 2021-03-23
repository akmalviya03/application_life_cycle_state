import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: AppLifeCycleFlutter(),
    ),
  );
}

class AppLifeCycleFlutter extends StatefulWidget {
  @override
  _AppLifeCycleFlutterState createState() =>
      _AppLifeCycleFlutterState();
}

class _AppLifeCycleFlutterState extends State<AppLifeCycleFlutter>
    with WidgetsBindingObserver {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    //Binding observers are notified when various application events occur.
    WidgetsBinding.instance.addObserver(this);
    //WidgetsBinding.instance.addObserver(_AppLifeCycleStateFlutterState());
  }

  @override
  void dispose() {
    //Unregisters the given observer.
    WidgetsBinding.instance.removeObserver(this);
    //WidgetsBinding.instance.removeObserver(_AppLifeCycleStateFlutterState());
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //The application is visible and responding to user input.
      print('Resumed ${++counter}');
    } else if (state == AppLifecycleState.paused) {
      //Application is not currently visible to the user input, not responding to user input, and running in the background.
      print('Paused ${++counter}');
    } else if (state == AppLifecycleState.inactive) {
      //Application is not receiving user input.
      print('Inactive ${++counter}');
    } else if (state == AppLifecycleState.detached) {
      //Called When Application is hosted on a Flutter Engine but is detached from any host views.
      print('Disposed ${++counter}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.amber,
          width: size.width,
          height: size.height,
          child: Text(
            'Application LifeCycle State',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
