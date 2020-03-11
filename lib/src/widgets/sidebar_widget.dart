import 'package:andersgym/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:andersgym/src/providers/sidebar_provider.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.black87,
          child: _createRoutes(context),
        ),
      ),
    );
  }

  Widget _createRoutes(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: sidebarProvider.loadData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                color: Colors.black,
                height: size.height * 0.08,
                width: size.width,
                child: const DrawerHeader(
                  child: const Text(
                    'MENU',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: _createListItems(snapshot.data, context),
              ),
            ],
          );
        });
  }

  List<Widget> _createListItems(List<dynamic> data, context) {
    final text = const TextStyle(color: Colors.white, fontSize: 14);
    final iconColor = Colors.amber;
    final _colorTrail = Colors.grey;
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text'], style: text),
        leading: getIcon(opt['icon'], iconColor),
        trailing: Icon(Icons.keyboard_arrow_right, color: _colorTrail),
        onTap: () {
          if (opt['route'] == 'logout') {
            _logOut(context);
          }
          Navigator.popAndPushNamed(context, opt['route']);
        },
      );

      options.add(widgetTemp);
    });

    return options;
  }

  void _logOut(context) async {

    Navigator.pop(context, true); 
  }
}
