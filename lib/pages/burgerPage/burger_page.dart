import 'package:catho_app_food_truck/pages/burgerPage/ArgumentsBurgerPage.dart';
import 'package:flutter/material.dart';
import 'package:catho_app_food_truck/client/entity/cart_items_bloc.dart';

class BurgerPage extends StatefulWidget {
  static const routeName = "/burgerPage";

  const BurgerPage({Key? key}) : super(key: key);

  @override
  _BurgerPageState createState() {
    return _BurgerPageState();
  }
}

class _BurgerPageState extends State<BurgerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArgumentsBurgerPage;
    Size size = MediaQuery.of(context).size;
    //int quantity = bloc.numberOfitemProduct(args.produit);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 15,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/pexels-pixabay-34534.png"),
                radius: 13,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  args.produit.nom,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const Text(
                  "Deliver Me Burger. Fast Delivery & great service",
                  style: TextStyle(fontSize: 14, color: Colors.white54),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Image.network(
                      args.produit.url_image,
                      height: 130,
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                            args.produit.prix.toString() + " €",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            for (var i = 0; i < args.produit.note; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                            for (var i = 0; i < 5 - args.produit.note; i++)
                              const Icon(
                                Icons.star_border,
                                color: Colors.white,
                              ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.teal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(45),
            ),
            child: Container(
              width: size.width,
              color: const Color.fromRGBO(240, 240, 240, 1),
              height: size.height / 1.6,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          args.produit.description,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // HAMBERGER
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity != 0) {
                                      quantity = quantity - 1;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove_circle),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity = quantity + 1;
                                  });
                                },
                                icon: const Icon(Icons.add_circle),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                              color: (quantity > 0)
                                  ? Theme.of(context).colorScheme.secondary
                                  : Colors.white24,
                              onPressed: () {
                                if (quantity > 0) {
                                  setState(() {
                                    bloc.addToCart(args.produit, quantity);
                                  });
                                  Navigator.pushNamed(
                                    context,
                                    '/',
                                  );
                                }
                              },
                              child: const Text(
                                "Buy now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
            ),
          );
        },
      ),
    );
  }
}
