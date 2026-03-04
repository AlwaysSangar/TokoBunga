import 'package:flutter/material.dart';
import 'home_page.dart';
import 'product_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {"image": "Impression.jpg", "name": "Impression", "price": "\$85"},
      {"image": "Authentic.jpg", "name": "Authentic", "price": "\$60"},
      {"image": "Spark.jpg", "name": "Spark", "price": "\$90"},
      {"image": "Magic.jpg", "name": "Magic", "price": "\$75"},
      {"image": "White.jpg", "name": "White", "price": "\$75"},
      {"image": "Soft.jpg", "name": "Soft", "price": "\$60"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F9), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7F9),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 20),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomePage(),
                transitionsBuilder: (_, animation, __, child) =>
                    FadeTransition(opacity: animation, child: child),
                transitionDuration: const Duration(milliseconds: 250),
              ),
            );
          },
        ),
        title: const Text(
          "Bridal Bouquet",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.search, color: Colors.black87),
          SizedBox(width: 16),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Catalog",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),

            SliverPadding(
              padding: const EdgeInsets.only(bottom: 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio:
                      MediaQuery.of(context).size.width > 400 ? 0.75 : 0.68,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products[index];
                    return _buildProductCard(
                      context,
                      product["image"]!,
                      product["name"]!,
                      product["price"]!,
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ),
          ],
        ),
      ),

      
    );
  }

  Widget _buildProductCard(
      BuildContext context, String image, String title, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              image: image,
              name: title,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            // Info Produk
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                        const Icon(
                          Icons.shopping_cart_outlined,
                          size: 18,
                          color: Color(0xFF8E6FB2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
