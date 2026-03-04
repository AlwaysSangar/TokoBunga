import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const ProductPage({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Rumus Totalan
    final double priceValue =
        double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    final double total = quantity * priceValue;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F9),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Foto Produk
          Stack(
            children: [
              Image.asset(
                "assets/images/${widget.image}",
                width: double.infinity,
                height: 330,
                fit: BoxFit.cover,
              ),
              // Tombol tutup
              Positioned(
                top: 40,
                right: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Detail Produk
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama dan Harga Produk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E6FB2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Rating dan Availability
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Availability",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      "In Stock",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rating",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const Divider(thickness: 1, color: Color(0xFFE5E5E5)),
                const SizedBox(height: 12),

                // Jumlah Produk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          // Tombol minus
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.black54),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                          ),

                          // Angka jumlah
                          Container(
                            width: 28,
                            height: 28,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          // Tombol tambah
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.black54),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Totalan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E6FB2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // tombol add to cart 
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${widget.name} added to cart'),
                            backgroundColor: const Color(0xFF8E6FB2),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E6FB2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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