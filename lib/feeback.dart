import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// ignore: camel_case_types
class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Customer Feedback'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rating: $rating',
             style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            buildRating(),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () => showRating(),
              child: const Text("Show Dialog"),
            ),
          ],
        ),
     ),
    );
  }
Widget buildRating() => RatingBar.builder(
      initialRating: rating,
      itemSize: 45,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
      updateOnDrag: true,
      minRating: 1,
      maxRating: 5,
      //allowHalfRating: true,
      itemBuilder: (context, _) {
        return const Icon(Icons.star, color: Colors.amber);
      },
      onRatingUpdate: (rating) {
        setState(() {
          this.rating = rating;
        });
      });
  void showRating() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Rate this App"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Please leave a star rating",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 30),
            buildRating(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
