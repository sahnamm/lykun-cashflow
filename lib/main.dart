import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'utils/ScreenList.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getSuggestionsDummy(String pattern) {
    return ["Test", "Test 2"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("LYKUN CASHFLOW"),
        //   centerTitle: true,
        // ),
        body: Center(
          child: Container(
            child: Text("selected index is ${_selectedIndex.toString()}"),
          ),
        ),
        // body: Center(
        //   child: Container(
        //     width: double.maxFinite,
        //     child: TypeAheadField(
        //       itemBuilder: (context, suggestion) {
        //         return ListTile(
        //           leading: Icon(Icons.shopping_cart),
        //           title: Text(suggestion['name']),
        //           subtitle: Text('\$${suggestion['price']}'),
        //         );
        //       },
        //       onSuggestionSelected: (suggestion) {},
        //       suggestionsCallback: (String pattern) {},
        //     ),
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 30),
          selectedItemColor: Colors.amberAccent,
          mouseCursor: SystemMouseCursors.grab,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.green.shade900,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_business_outlined,
                // color: Colors.white,
              ),
              label: 'Submit',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.multitrack_audio_outlined,
                // color: Colors.white,
              ),
              label: 'In Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history_sharp,
                // color: Colors.white,
              ),
              label: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
