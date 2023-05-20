import 'package:flutter/material.dart';
import 'constant/lists.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shop App',
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.grey,
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            )
          ],
        ),
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: ktheItems.length,
          itemBuilder: (context, index) {
            var item = ktheItems[index];
            return Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: item["isFavourite"]
                              ? const Icon(
                                  Icons.favorite_outlined,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              item["isFavourite"] = !item["isFavourite"];
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item["image"]),
                          fit: BoxFit.cover,
                          //alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Text(
                      item["price"],
                      style: const TextStyle(color: Colors.deepOrangeAccent),
                    ),
                    Text(
                      item["name"],
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                    const Divider(
                      color: Colors.red,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.shopping_basket),
                        Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
