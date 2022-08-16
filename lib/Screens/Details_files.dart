import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {

  final String title;
  final String url;

  DetailsScreen({
    required this.title,
    required this.url
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: NetworkImage("${url}"),
          )
        ),
        child: Column(
          children: [
            Center(child: Text("${title}"))
          ],
        ),
      )
    );
  }
}
