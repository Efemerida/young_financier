import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:young_financier/pages/home_screen/home_screen.dart';
import 'package:young_financier/pages/profile_screen/profile_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('name_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  final List _pages =[

    const HomeScreen(),

    ProfilePage()


  ];

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Главная"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Профиль")
        ],
      ),
      body:
        _pages[_selectedIndex],
    );
  }
}
