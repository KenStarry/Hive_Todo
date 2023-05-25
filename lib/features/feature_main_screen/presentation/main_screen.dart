import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/main_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.deepOrange.shade100,
          systemNavigationBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Colors.deepOrange.shade100,
        appBar: mainAppBar(),
      ),
    );
  }
}
