import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class SideBarProvider {
  List<dynamic> opciones = [];

  SideBarProvider() {
    loadData();
  }
  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/sidebar_routes.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['routes'];

    return opciones;
  }
}

final sidebarProvider = new SideBarProvider();
