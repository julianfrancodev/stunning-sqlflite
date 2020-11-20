import 'package:flutter/material.dart';
import 'package:parcial_02/src/pages/create_page.dart';
import 'package:parcial_02/src/pages/home_page.dart';
import 'package:parcial_02/src/pages/student_detail_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (_) => HomePage(),
  '/create': (_) => CreatePage(),
  '/detail':(_)=> StudentDetailPage(),
};
