import 'package:book_repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/macro.dart';
import 'package:flutter_project/screens/home/views/cart_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final Book book;
  const DetailsScreen(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Book Detailed', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - (40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 5
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    book.picture
                  )
                )
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 5
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            book.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${(book.price - (book.price * book.discount / 100)).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary
                                  ),
                                ),
                                Text(
                                  "\$${book.price}.00",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        MyMacroWidget(
                          title: "Horror",
                          value: book.macros.horror,
                          icon: FontAwesomeIcons.ghost,
                        ),
                        const SizedBox(width: 10,),
                        MyMacroWidget(
                          title: "Fun",
                          value: book.macros.fun,
                          icon: FontAwesomeIcons.umbrellaBeach,
                        ),
                        const SizedBox(width: 10,),
                        MyMacroWidget(
                          title: "Romance",
                          value: book.macros.romance,
                          icon: FontAwesomeIcons.heart,
                        ),
                        const SizedBox(width: 10,),
                        MyMacroWidget(
                          title: "Score",
                          value: book.macros.score,
                          icon: FontAwesomeIcons.star,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => CartScreen(book)));
                        },
                        style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        child: const Text(
                          "Buy / Read now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}