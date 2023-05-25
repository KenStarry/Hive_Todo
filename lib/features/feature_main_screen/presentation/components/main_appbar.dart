import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget mainAppBar() => AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.deepOrange.shade100,
    statusBarIconBrightness: Brightness.dark,
  ),
  backgroundColor: Colors.deepOrange.shade100,
  title: const Text(
    "Hive Todo",
    style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
  ),
  elevation: 0,
  centerTitle: true,
);