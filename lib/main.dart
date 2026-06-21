
import 'package:flutter/material.dart';

void main() => runApp(ShakkaApp());

List<Map> posts = [];
List<Map> chats = [];
List<String> stories = [];

class ShakkaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF6A11CB), Color(0xFF9B00FF), Color(0xFFFF2D95)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.pinkAccent, blurRadius: 30)]), child: Text('👨🏻‍💼 💗 ⭐ 🌷 🕊️ عبداللہ ڈار چک لشکری آڑ', style: TextStyle(fontSize: 20, color: Colors.white))),
            SizedBox(height: 30),
            Text('SHAKKA', style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.white, shadows: [Shadow(color: Colors.pinkAccent, blurRadius: 40), Shadow(color: Colors.white, blurRadius: 15)])),
            Text('DI INSTA', style: TextStyle(fontSize: 36, letterSpacing: 5, color: Colors.white70)),
          ]),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget { @override _HomeScreenState createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> {
  int idx = 0;
  final pages = [FeedPage(), SearchPage(), PostPage(), ChatsPage(), ProfilePage()];
  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF1A0033), Color(0xFF3D0066)], begin: Alignment.topCenter, end: Alignment.bottomCenter)), child: pages[idx]),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black87, type: BottomNavigationBarType.fixed, selectedItemColor: Colors.pinkAccent, unselectedItemColor: Colors.white54, currentIndex: idx, onTap: (i) => setState(() => idx = i), items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Post'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]),
    );
  }
}

// FEED + STORIES
class FeedPage extends StatefulWidget { @override _FeedPageState createState() => _FeedPageState(); }
class _FeedPageState extends State<FeedPage> {
  @override Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
      Container(height: 100, child: ListView(scrollDirection: Axis.horizontal, children: [
        Padding(padding: EdgeInsets.all(8), child: Column(children: [CircleAvatar(radius: 30, backgroundColor: Colors.white24, child: Icon(Icons.add, color: Colors.white)), Text('Your Story', style: TextStyle(fontSize: 12))])),
       ...stories.map((s) => Padding(padding: EdgeInsets.all(8), child: Column(children: [CircleAvatar(radius: 30, backgroundColor: Colors.pinkAccent, child: Text(s[0])), Text(s, style: TextStyle(fontSize: 12))]))),
      ])),
      Expanded(child: posts.isEmpty? Center(child: Text('No posts yet - Post karo!', style: TextStyle(color: Colors.white54))) : ListView.builder(itemCount: posts.length, itemBuilder: (_, i) => Card(color: Colors.white10, margin: EdgeInsets.all(8), child: ListTile(title: Text(posts[i]['user']), subtitle: Text(posts[i]['caption']), leading: CircleAvatar(backgroundColor: Colors.pinkAccent, child: Icon(Icons.person))))),
    ]));
  }
}

// POST
class PostPage extends StatefulWidget { @override _PostPageState createState() => _PostPageState(); }
class _PostPageState extends State<PostPage> {
  final ctrl = TextEditingController();
  @override Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.all(20), child: Column(children: [
      Text('New Post', style: TextStyle(fontSize: 24, color: Colors.pinkAccent, shadows: [Shadow(blurRadius: 20, color: Colors.pink)])),
      SizedBox(height: 20),
      TextField(controller: ctrl, decoration: InputDecoration(hintText: 'Caption likho...', filled: true, fillColor: Colors.white12, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))), maxLines: 3),
      SizedBox(height: 20),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent), onPressed: () { if (ctrl.text.isNotEmpty) { setState(() { posts.insert(0, {'user': '@hyy._fluxyy_', 'caption': ctrl.text}); stories.add('You'); }); ctrl.clear(); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Posted!'))); } }, child: Text('POST KARO')),
    ])));
  }
}

// SEARCH
class SearchPage extends StatelessWidget { @override Widget build(BuildContext context) => SafeArea(child: Center(child: Text('Search - @username type karo', style: TextStyle(color: Colors.white70, fontSize: 18)))); }

// CHATS + GC + NOTES
class ChatsPage extends StatefulWidget { @override _ChatsPageState createState() => _ChatsPageState(); }
class _ChatsPageState extends State<ChatsPage> {
  final notes = ['🎵 feeling alone', '💔 sad', '🔥 new post'];
  @override Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
      Container(height: 70, child: ListView(scrollDirection: Axis.horizontal, children: notes.map((n) => Container(margin: EdgeInsets.all(8), padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.pinkAccent.withOpacity(0.5))), child: Center(child: Text(n)))).toList())),
      ListTile(leading: Icon(Icons.group_add, color: Colors.pinkAccent), title: Text('Create Group Chat'), onTap: () { setState(() => chats.add({'name': 'GC ${chats.length+1}', 'msg': 'Group bana diya'})); }),
      Expanded(child: ListView.builder(itemCount: chats.length, itemBuilder: (_, i) => ListTile(leading: CircleAvatar(backgroundColor: Colors.purple), title: Text(chats[i]['name']), subtitle: Text(chats[i]['msg']), onTap: () {}))),
    ]));
  }
}

// PROFILE
class ProfilePage extends StatefulWidget { @override _ProfilePageState createState() => _ProfilePageState(); }
class _ProfilePageState extends State<ProfilePage> {
  String bio = 'Shakka Owner 🩷';
  @override Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
      SizedBox(height: 30),
      CircleAvatar(radius: 50, backgroundColor: Colors.white, child: Icon(Icons.person, size: 50, color: Colors.black38)), // default white
      SizedBox(height: 10),
      Text('SOLO | SHAKA 🤍', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(color: Colors.pinkAccent, blurRadius: 20)])),
      Text('@hyy._fluxyy_', style: TextStyle(color: Colors.white70)),
      TextButton(onPressed: () async { var b = await showDialog(context: context, builder: (_) { var c = TextEditingController(text: bio); return AlertDialog(title: Text('Edit Bio'), content: TextField(controller: c), actions: [TextButton(onPressed: () => Navigator.pop(context, c.text), child: Text('Save'))]); }); if (b!= null) setState(() => bio = b); }, child: Text(bio, style: TextStyle(color: Colors.pinkAccent))),
      SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ _stat('0','Posts'), _stat('0','Followers'), _stat('0','Following') ]),
    ]));
  }
  Widget _stat(n,l) => Column(children: [Text(n, style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)), Text(l, style: TextStyle(color: Colors.white54))]);
}
