import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ====== COLOR THEME PINK IMUT ======
const Color kPinkSoft = Color(0xFFFFF0F5);
const Color kPinkPrimary = Color(0xFFFF8FAB);
const Color kPinkAccent = Color(0xFFFF69B4);
const Color kPinkLight = Color(0xFFFFE4E9);

void main() {
  runApp(const JurnalKelasApp());
}

class JurnalKelasApp extends StatelessWidget {
  const JurnalKelasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnal Kelas Digital',
      theme: ThemeData(
        primaryColor: kPinkPrimary,
        scaffoldBackgroundColor: kPinkSoft,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPinkAccent,
          primary: kPinkPrimary,
          secondary: kPinkAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kPinkPrimary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPinkAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: kPinkLight,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: kPinkAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

// ================== MAIN PAGE ==================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardTab(),
    const JournalListTab(),
    const AnnouncementTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Jurnal'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: 'Info'),
        ],
      ),
    );
  }
}

// ================== DASHBOARD ==================
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 8),
            Text("Dashboard"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.local_florist, color: kPinkAccent, size: 26),
                        SizedBox(width: 6),
                        Text(
                          "Jurnal Hari Ini",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kPinkAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd MMM yyyy').format(DateTime.now()),
                      style: const TextStyle(fontSize: 16, color: kPinkPrimary),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Buat Jurnal Baru"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================== LIST JURNAL ==================
class JournalListTab extends StatelessWidget {
  const JournalListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 8),
            Text("Daftar Jurnal"),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.local_florist, color: kPinkPrimary),
              title: const Text("Belajar Flutter UI"),
              subtitle: Text(DateFormat('dd MMM yyyy').format(DateTime.now())),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// ================== ANNOUNCEMENT ==================
class AnnouncementTab extends StatelessWidget {
  const AnnouncementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 8),
            Text("Pengumuman"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ListTile(
            leading: const Icon(
              Icons.local_florist,
              color: kPinkAccent,
              size: 28,
            ),
            title: const Text(
              "Besok upacara Hari Senin\nSemua siswa wajib hadir!",
              style: TextStyle(color: kPinkPrimary),
            ),
            subtitle: Text(
              DateFormat('dd MMM yyyy').format(DateTime.now()),
              style: const TextStyle(color: kPinkAccent),
            ),
          ),
        ),
      ),
    );
  }
}
