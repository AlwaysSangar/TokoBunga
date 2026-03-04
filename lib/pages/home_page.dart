import 'package:flutter/material.dart';
import 'catalog_page.dart';
import 'chat_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar Halaman 
  final List<Widget> _pages = [
    const HomeContent(),
    const CatalogPage(),
    const ChatPage(),
    const CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F9),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),

      // Bottom navbar tetap disemua halaman
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: const Color(0xFFF8F7F9),
        iconSize: 26,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        ],
      ),
    );
  }
}

// Isi Halaman Home
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "FLORIST",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_outline, size: 28),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Tombol Kategori
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildCategoryButton("Wedding", true),
              _buildCategoryButton("Decor", false),
              _buildCategoryButton("Gift", false),
            ],
          ),
          const SizedBox(height: 20),

          // Banner
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 168, 111, 194),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Need help?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Make an appointment or chat with us.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.calendar_today, color: Colors.white, size: 30),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Ikon
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryIcon("All", "all2.jpg"),
                _buildCategoryIcon("Bouquet", "baouqet.jpg"),
                _buildCategoryIcon("Table", "table.jpg"),
                _buildCategoryIcon("Aisle", "aisle.jpg"),
                _buildCategoryIcon("Accessories", "accessories.jpg"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Popularity
          const Text(
            "Popularity",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),

          // Horizontal scroll product cards
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildProductCard("Spark.jpg", "Spark", "\$90", 5),
                _buildProductCard("Impression.jpg", "Impression", "\$85", 4),
                _buildProductCard("Authentic.jpg", "Authentic", "\$60", 5),
                _buildProductCard("Magic.jpg", "Magic", "\$75", 4),
                _buildProductCard("White.jpg", "White", "\$75", 5),
                _buildProductCard("Soft.jpg", "Soft", "\$60", 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Help
  static Widget _buildCategoryButton(String title, bool selected) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selected ? const Color.fromARGB(255, 168, 111, 194) : Colors.grey[200],
            foregroundColor: selected ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          onPressed: () {},
          child: Text(title),
        ),
      ),
    );
  }

  static Widget _buildCategoryIcon(String label, String imageName) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/images/$imageName"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _buildProductCard(
      String image, String title, String price, int rating) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              "assets/images/$image",
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF7A4EBF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.black)),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border_outlined,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
