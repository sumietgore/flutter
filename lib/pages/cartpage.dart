import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const CircleBorder()),
                    onPressed: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.chevron_left_rounded,
                      ),
                    )),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: ElevatedButton(
                  onPressed: () => print('asd'), child: Text("Pay Now")),
            )
          ]),
        ));
  }
}
