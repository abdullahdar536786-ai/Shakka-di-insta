
import 'package:flutter/material.dart';

void main() => runApp(ShakkaApp());

List<Map> posts = [];
List<Map> chats = [];
List<String> stories = ['You'];

class ShakkaApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget { @override _SplashState createState() => _SplashState(); }
class _SplashState extends State<SplashScreen> {
  @override void initState() { super.initState(); Future.delayed(Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()))); }
  @override Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF6A11CB), Color(0xFF9B00FF), Color(0xFFFF2D95)], begin: Alignment.topLeft, end: Alignment.bottomRight)), child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.pinkAccent, blurRadius: 30)]), child: Text('👨🏻‍💼 💗 ⭐ عبداللہ ڈار چک لشکری آڑ', style: TextStyle(color: Colors.white, fontSize: 18))),
      SizedBox(height: 30),
      Text('SHAKKA', style: TextStyle(fontSize: 58, fontWeight: FontWeight.w900, color: Colors.white, shadows: [Shadow(color: Colors.pinkAccent, blurRadius: 35)])),
      Text('DI INSTA', style: TextStyle(fontSize: 32, letterSpacing: 4, color: Colors.white70)),
    ]))));
  }
}

class HomeScreen extends StatefulWidget { @override _HomeState createState() => _HomeState(); }
class _HomeState extends State<HomeScreen> {
  int idx = 0;
  final pages = [FeedPage(), SearchPage(), PostPage(), ChatsPage(), ProfilePage()];
  @override Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF1A0033), Color(0xFF3D0066)], begin: Alignment.topCenter, end: Alignment.bottomCenter)), child: pages[idx]),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black87, type: BottomNavigationBarType.fixed, selectedItemColor: Colors.pinkAccent, unselectedItemColor: Colors.white54, currentIndex: idx, onTap: (i) => setState(() => idx = i), items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Post'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]));
  }
}

class FeedPage extends StatelessWidget { @override Widget build(BuildContext context) {
  return SafeArea(child: Column(children: [
    Container(height: 90, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: stories.length, itemBuilder: (_, i) => Padding(padding: EdgeInsets.all(8), child: Column(children: [CircleAvatar(radius: 28, backgroundColor: Colors.pinkAccent, child: Icon(Icons.person, color: Colors.white)), SizedBox(height: 4), Text(stories[i], style: TextStyle(fontSize: 11, color: Colors.white70))])))),
    Expanded(child: posts.isEmpty? Center(child: Text('No posts yet', style: TextStyle(color: Colors.white54))) : ListView.builder(itemCount: posts.length, itemBuilder: (_, i) => Card(color: Colors.white10, margin: EdgeInsets.all(8), child: ListTile(leading: CircleAvatar(backgroundColor: Colors.pink), title: Text(posts[i]['user'], style: TextStyle(color: Colors.white)), subtitle: Text(posts[i]['caption'], style: TextStyle(color: Colors.white70))))),
  ]));
}}

class PostPage extends StatefulWidget { @override _PostState createState() => _PostState(); }
class _PostState extends State<PostPage> {
  final c = TextEditingController();
  @override Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.all(20), child: Column(children: [
      Text('New Post', style: TextStyle(fontSize: 24, color: Colors.pinkAccent)),
      SizedBox(height: 20),
      TextField(controller: c, decoration: InputDecoration(h
