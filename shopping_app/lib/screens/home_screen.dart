import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/data/global_variables.dart';
import 'package:shopping_app/pages/product_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = const ["All", "Addidas", "Nike", "Bata"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters[index];
                          });
                        },
                        child: Chip(
                          backgroundColor:
                              selectedFilter == filters[index]
                                  ? Theme.of(context).primaryColor
                                  : const Color.fromARGB(255, 195, 220, 232),
                          label: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              filters[index],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: filters.length,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailsPage(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product["title"] as String,
                      price: product["price"] as double,
                      imageUrl: product["imageUrl"] as String,
                      backgroundColor:
                          index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
