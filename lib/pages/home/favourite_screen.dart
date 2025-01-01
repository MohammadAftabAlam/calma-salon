import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(appBar: AppBar(title: Text("My Favourites"),),
     body: ListView.builder(
       itemCount: 1,
       itemBuilder: (context, int index) { return Text("Nothing to show"); },

     ),
    );
  }
}
