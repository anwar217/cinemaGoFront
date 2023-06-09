import 'package:cinemamovie/Screens/cartScreen.dart';
import 'package:cinemamovie/Screens/movieDetail.dart';
import 'package:cinemamovie/functions.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final movieData;
  const BookingScreen({Key? key, required this.movieData}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var cinemas = ["Cinema 1", "Cinema 2", "Cinema 3", "Cinema 4", "Cinema 5", "Cinema 6", "Cinema 7", "Cinema 8"];
  var times = ["11:00 PM", "09:00 PM", "7:00 PM", "12:00 AM", "10:00 AM"];

  List<int> unavailableSeats = [0, 11, 18, 22, 29, 34, 35, 37, 12, 40, 41];
  List<int> selectedSeats = [30];

  int selectedCinIdx = 0;
  int selectedTimeIdx = 0;

  Color set_seat_color(int index) {
    if(unavailableSeats.contains(index)) return Colors.grey;
    if(selectedSeats.contains(index)) return Colors.yellow;

    return Colors.white;
  }

  void toggle_seat(int index) {
    if(unavailableSeats.contains(index)) return;

    setState(() {
      if(selectedSeats.contains(index)) selectedSeats.remove(index);
      else selectedSeats.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        width: MediaQuery.of(context).size.width,

        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220.0,
                  width: (MediaQuery.of(context).size.width - 50.0),
                  margin: const EdgeInsets.only(left: 25.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF2b2a3a),
                  ),

                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10.0, 0, 20.0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            width: 130.0,
                            height: 200.0,
                            child: Image.network(widget.movieData["image"], fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              widget.movieData["title"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              widget.movieData["type"],
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              widget.movieData["categorie"],
                              style: const TextStyle(
                                  color: Color(0xFFD2BE07)
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              widget.movieData["cinema"],
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              parseDate(widget.movieData["date"]),
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 50.0),
                  margin: const EdgeInsets.fromLTRB(25.0, 25.0, 0, 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFF2b2a3a),
                  ),

                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: const Text(
                          "Select Your Seats",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            width: ((MediaQuery.of(context).size.width - 50.0) / 2) - 30.0,
                            height: 125.0,
                            margin: const EdgeInsets.only(bottom: 30.0),

                            child: Center(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 24,

                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 5.0,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      toggle_seat(index);
                                    },
                                    child: Icon(
                                      Icons.event_seat,
                                      color: set_seat_color(index),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          Container(
                            width: ((MediaQuery.of(context).size.width - 50.0) / 2) - 30.0,
                            height: 125.0,
                            margin: const EdgeInsets.only(bottom: 30.0),

                            child: Center(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 24,

                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 5.0,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      toggle_seat(index + 24);
                                    },
                                    child: Icon(
                                      Icons.event_seat,
                                      color: set_seat_color(index + 24),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),

                      child: Row(
                        children: const [
                          Icon(
                            Icons.circle,
                            color: Colors.grey,
                          ),

                          Text(
                            "Reserved",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(right: 10.0),

                      child: Row(
                        children: const [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),

                          Text(
                            "Available",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),

                        Text(
                          "Selected",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Positioned(
              top: -15.0,
              left: 5,
              child: IconButton(
                onPressed: () {
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
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFF2b2a3a),
                  borderRadius: BorderRadius.circular(20.0),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15.0),
                          child: const Text(
                            "Select Location, Date and Time",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0
                            ),
                          ),
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                  width: 15.0,
                                ),

                                Row(
                                  children: cinemas.asMap().entries.map((entry) =>
                                      Container(
                                        margin: const EdgeInsets.only(right: 15.0),

                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedCinIdx = entry.key;
                                            });
                                          },

                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ((selectedCinIdx == entry.key) ? const Color(0xFFD2BE07) : const Color(0xFF939194)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                          ),

                                          child: Column(
                                            children: [
                                              Text(
                                                entry.value,
                                                style: const TextStyle(
                                                    fontSize: 17.0
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ).toList(),
                                ),
                              ]
                          ),
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 10.0,
                                width: 15.0,
                              ),

                              Row(
                                children: times.asMap().entries.map((entry) =>
                                    Container(
                                      margin: const EdgeInsets.only(right: 15.0),

                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedTimeIdx = entry.key;
                                          });
                                        },

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ((selectedTimeIdx == entry.key) ? const Color(0xFFD2BE07) : const Color(0xFF939194)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                        ),

                                        child: Column(
                                          children: [
                                            Text(
                                              entry.value,
                                              style: const TextStyle(
                                                  fontSize: 17.0
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ).toList(),
                              )
                            ]
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(bottom: 15.0),


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15.0),

                            child: Column(
                              children: [
                                const Text(
                                  "Total Price",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  margin: const EdgeInsets.only(top: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),

                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.star_rate,
                                        color: Color(0xFFD2BE07),

                                      ),

                                      Text(
                                        "60 dt",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 200.0,
                            height: 40.0,
                            margin: const EdgeInsets.only(left: 15.0),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xfff64c18), Color(0xffff8a1b)],
                                stops: [0.0, 1.0],
                              ),
                            ),

                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const CartScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),

                              child: const Text("Book A Ticket"),
                            ),
                          ),
                        ],
                      ),
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
