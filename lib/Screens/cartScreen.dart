import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartMovies = [];
  void get_movies() async {
    var res = await get(Uri.parse("http://192.168.1.27:5000/api/movies/getMovies"));

    setState(() {
      cartMovies = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    get_movies();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100.0,
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height - 200.0),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: cartMovies.map((movie) =>
                  Container(
                    alignment: Alignment.center,
                    width: (MediaQuery.of(context).size.width - 50.0),
                    height: 230.0,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    margin: const EdgeInsets.only(bottom: 10.0),

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255,2,1,17),
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SizedBox(
                              width: 130.0,
                              height: 200.0,
                              child: Image.network(movie["image"], fit: BoxFit.cover),
                            ),
                          ),
                        ),

                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(
                                        movie["title"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        movie["type"],
                                        style: const TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        movie["cinema"],
                                        style: const TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10.0),
                                      child: const Text(
                                        "40 D",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Container(
                              height: 230,
                              width: (MediaQuery.of(context).size.width - 225.0),
                              alignment: Alignment.centerRight,

                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )
                                    ),

                                    const Text(
                                      "2",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),

                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),

          Positioned(
            top: 30.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              alignment: Alignment.center,

              child: const Text(
                "My Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),

          Positioned(
            top: 30.0,
            left: 10.0,
            child: IconButton(
              onPressed: () {
                //_controller.pause();
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255,2,1,17),
              width: MediaQuery.of(context).size.width,

              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: const [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),

                        Text(
                            "120 dt",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    width: 200.0,
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(vertical: 15.0),

                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        backgroundColor: const Color(0xffd3be01)
                      ),

                      child: const Text(
                        "Check Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
