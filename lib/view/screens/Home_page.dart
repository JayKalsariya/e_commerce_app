import 'package:e_commerce_app/utils/products.dart';
import 'package:e_commerce_app/view/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> brands = [];

  @override
  void initState() {
    brands = products
        .map((e) => e['brand'].toString().toLowerCase())
        .toSet()
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //appbar
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade200),
                      ),
                      icon: const Icon(Icons.menu),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade200),
                      ),
                      icon: const Icon(Icons.shopping_bag),
                    ),
                  ],
                ),
              ),
              //greetings
              const Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome to Laza...",
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              //searchbar
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Search here...',
                            prefixIcon: Icon(Icons.search_rounded),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white60,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff9775FA),
                        ),
                        child: const Icon(
                          Icons.mic,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //choose brand
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choose Brand",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff8F959E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        brands.length,
                        (index) => Container(
                          // height: 90,
                          // width: 150,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          margin: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(3.0, 3.0),
                                // spreadRadius: 1,
                              ),
                            ],
                            border: Border.all(
                              width: 2,
                              color: Colors.primaries[index],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              brands[index].toLowerCase().replaceFirst(
                                    brands[index][0],
                                    brands[index][0].toUpperCase(),
                                  ),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //New Arrival
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New Arrival",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      products.length ~/ 2,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: size.height * 30 / 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size.height * 18 / 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                products[index * 2]
                                                    ['thumbnail']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index * 2]['title'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "\$ ${products[index * 2]['price']}/-"
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red.shade500,
                                              ),
                                            ),
                                            SmoothStarRating(
                                              starCount: 5,
                                              size: 12,
                                              allowHalfRating: true,
                                              borderColor: Colors.grey,
                                              color: Colors.yellow,
                                              rating: products[index * 2]
                                                  ['rating'],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: size.height * 30 / 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size.height * 18 / 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                products[index * 2 + 1]
                                                    ['thumbnail']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index * 2 + 1]['title'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "\$ ${products[index * 2 + 1]['price']}/-"
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red.shade500,
                                              ),
                                            ),
                                            SmoothStarRating(
                                              starCount: 5,
                                              size: 12,
                                              allowHalfRating: true,
                                              borderColor: Colors.grey,
                                              color: Colors.yellow,
                                              rating: products[index * 2 + 1]
                                                  ['rating'],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
