import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_and_reminder_app/method/load_data.dart';
import 'package:todo_and_reminder_app/method/save_data.dart';
import 'package:todo_and_reminder_app/views/screens/home_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode = await loadThemeMode();
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  MyApp({required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void _toggleThemeMode(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
    saveThemeMode(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Homescreen(onThemeModeChanged: _toggleThemeMode),
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Homescreen(),
//     );
//   }
// }

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
  // int _selected_index = 0;
  // void _onItemTaped(int index) {
  //   setState(() {
  //     _selected_index = index;
  //   });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Homescreen"),
//       ),
//       body: Row(
//         children: <Widget>[
//           NavigationRail(
//             onDestinationSelected: _onItemTaped,
//             selectedIndex: _selected_index,
//             labelType: NavigationRailLabelType.selected,
//             destinations: <NavigationRailDestination>[
//               NavigationRailDestination(
//                 icon: Icon(Icons.home),
//                 label: Text("Home"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.search),
//                 label: Text("Search "),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.person),
//                  label: Text("Profile "),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Center(
//               child:Text("")
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: "Home",
            
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//             ),

//             label: "search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//             ),
//             label: "Profile",
//           ),
//         ],
//         currentIndex: _selected_index,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTaped,
//       ),
//     );
//   }
// }

