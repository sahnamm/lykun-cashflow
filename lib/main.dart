import 'package:flutter/material.dart';
import 'package:lykun_cashflow/screen/HistoryScreen.dart';
import 'package:lykun_cashflow/screen/InProgressScreen.dart';
import 'utils/ScreenList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.green.shade900,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Arial',
                fontSizeDelta: 1.5,
              ),
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
        appBar: AppBar(
          title: Text(
            _selectedIndex == 0
                ? "PENGAMBILAN"
                : _selectedIndex == 1
                    ? "IN PROGRESS"
                    : "HISTORY",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: _selectedIndex == 1
              ? const EdgeInsets.only(
                  top: 5.0,
                  left: 32.0,
                  right: 32.0,
                )
              : _selectedIndex == 2
                  ? const EdgeInsets.symmetric(vertical: 5.0)
                  : const EdgeInsets.only(
                      top: 32.0,
                      left: 32.0,
                      right: 32.0,
                    ),
          child: _selectedIndex == 0
              ? PengambilanScreen()
              : _selectedIndex == 1
                  ? InProgressScreen()
                  : HistoryScreen(),
        ),
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
