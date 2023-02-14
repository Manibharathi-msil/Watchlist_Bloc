import 'package:flutter/material.dart';

class Strings {
  static const String title = "Watchlist";
  static const String error = "Error";
  static const String network = "No Internet connection";
  static const String data = "No data Available";
  static const String exception = "Error occured while Communication with Server with StatusCode :";

  static const List<Tab> name = <Tab>[
    Tab(child: (Text("Contact1", style: TextStyle(fontSize: 14),))),
    Tab(child: (Text("Contact2", style: TextStyle(fontSize: 14),))),
    Tab(child: (Text("Contact3", style: TextStyle(fontSize: 14),))),
    Tab(child: (Text("Contact4", style: TextStyle(fontSize: 14),))),
  ];
}