import 'package:andersgym/src/delegates/residentHeaderDelegate.dart';
import 'package:andersgym/src/pages/home/widgets/resident_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:andersgym/src/pages/home/home_viewmodel.dart';
import 'package:andersgym/src/widgets/sidebar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SideBarWidget _sidebar;
  List<Text> year = [
    Text('Demographics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    Text('Personal Contacts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    Text('Payor Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    Text('Contacts & Insurance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    Text('Doctors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
  ];

  @override
  void initState() {
    super.initState();

    _sidebar = const SideBarWidget();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context, listen: false);
    // return Scaffold(
    //   backgroundColor: Color.fromRGBO(179, 220, 230, 1),
    //   appBar: AppBar(
    //     backgroundColor:Color.fromRGBO(179, 220, 230, 1),
    //     elevation: 0,
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     leading: Builder(
    //       builder: (context) => IconButton(
    //         color: Color.fromRGBO(68, 111, 126, 1),
    //         icon: const Icon(Icons.menu),
    //         onPressed: () => Scaffold.of(context).openDrawer(),
    //       ),
    //     ),
    //   ),
    //   drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.30,
    //   drawer: _sidebar,

      // --dont use--
      // body: Column(
      //   children: <Widget>[
      //     ResidentHeader(),
      //     Container(
      //       height: 450.0,
      //       color: Colors.transparent,
      //       child: new Container(
      //         decoration: new BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: new BorderRadius.only(
      //             topLeft: const Radius.circular(40.0),
      //             topRight: const Radius.circular(40.0),
      //             )
      //           ),
      //           child: Container(
      //             padding: EdgeInsets.only(top: 20, left:20),
      //             child: Swiper(
      //               itemBuilder: (BuildContext context, int index) {
      //                 return year[index];
      //               },
      //               itemCount: year.length,
      //               viewportFraction: 1,
      //               scale: 1,
      //             ),
      //           )
      //         ),
      //       )
      //   ],
      // ),
      // --dont use--

    // --new code--
    //   body: Stack(
    //     children: <Widget>[
    //       ResidentHeader(),
    //       SizedBox.expand(
    //         child: DraggableScrollableSheet(
    //           initialChildSize: 0.7,
    //           minChildSize: 0.7,
    //           maxChildSize: .9,
    //           builder: (BuildContext context, ScrollController scrollController) {
    //             return Container(
    //               color: Colors.transparent,
    //               child: Container(
    //                 padding: EdgeInsets.only(top: 20, left:20),
    //                 decoration: new BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: new BorderRadius.only(
    //                   topLeft: const Radius.circular(40.0),
    //                   topRight: const Radius.circular(40.0),
    //                   )
    //                 ),
    //                 child: ListView.builder(
    //                   controller: scrollController,
    //                   itemCount: 25,
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return ListTile(title: Text('Item $index'));
    //                   },
    //                 ),
    //               )
    //             );
    //           },
    //         ),
    //       ),
    //     ]
    //   )
    // );
    // --new code--

    return Scaffold(
      backgroundColor:Color.fromRGBO(179, 220, 230, 1),
      body:CustomScrollView(
        
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:Color.fromRGBO(179, 220, 230, 1),
            pinned: true,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                color: Color.fromRGBO(68, 111, 126, 1),
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            floating: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: ResidentHeaderDelegate(
              minExtent: 60.0,
              maxExtent: 150.0
            )
          ),
          SliverFillRemaining(
            hasScrollBody: true,
          ),
        ],
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.30,
      drawer: _sidebar,
    );
  }
}
