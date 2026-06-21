import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const ShakkaApp());

class ShakkaApp extends StatelessWidget {
  const ShakkaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFFF0033),
        colorScheme: const ColorScheme.dark(primary: Color(0xFFFF0033)),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('SHAKKA',
          style: TextStyle(
            fontSize: 48, fontWeight: FontWeight.w900,
            color: const Color(0xFFFF0033), letterSpacing: 4,
            shadows: [Shadow(blurRadius: 20, color: Colors.redAccent.shade700), Shadow(blurRadius: 40, color: Colors.red.shade900)],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _i = 2;
  final pages = const [FeedPage(), SearchPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_i],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFFF0033),
        unselectedItemColor: Colors.white54,
        currentIndex: _i,
        onTap: (i) => setState(() => _i = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Feed - Coming Soon', style: TextStyle(color: Colors.white70)));
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Search - Coming Soon', style: TextStyle(color: Colors.white70)));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 45, backgroundColor: Color(0xFFFF0033), child: Text('𓄂', style: TextStyle(fontSize: 40, color: Colors.black))),
          const SizedBox(height: 12),
          const Text('SOLO | SHAKA ⃤', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('@hyy._fluxyy_', style: TextStyle(color: Colors.white54)),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
            _Stat('Posts','0'), _Stat('Followers','1.2K'), _Stat('Following','7'),
          ]),
          const SizedBox(height: 30),
          const Expanded(child: Center(child: Text('Your photos will appear here', style: TextStyle(color: Colors.white38)))),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label; final String value;
  const _Stat(this.label, this.value);
  @override
  Widget build(BuildContext context) => Column(children: [
    Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFF0033))),
    Text(label, style: const TextStyle(color: Colors.white54)),
  ]);
}
