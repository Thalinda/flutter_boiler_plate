import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NotInternetConnection extends StatelessWidget {
  const NotInternetConnection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Column(
          children: [
            Image.asset(
              'assets/images/signal-satellite.png',
              width: MediaQuery.of(context).size.width / 1.4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const AutoSizeText(
              "No Interntet :( ",
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const AutoSizeText(
                "Please Check your internet connection your internet connection is not working",
                style: TextStyle(fontSize: 20, color: Colors.grey),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
