import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Favourites extends StatefulWidget {
  bool isFavourite;
  Color color;
  double height;
  Favourites({super.key, this.isFavourite = false, this.color = Colors.white, this.height = 34});

  @override
  State<Favourites> createState() => _FavouritesState();

}
class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isFavourite = !widget.isFavourite;
        });
      },
      child: Container(
        height: widget.height,
        width: widget.height,
        decoration: const BoxDecoration(
            color: Colors.white, shape: BoxShape.circle,
        ),
        child:  Icon(
            widget.isFavourite ? Iconsax.heart5 : Iconsax.heart,
            color:
            widget.isFavourite ? Colors.red : Colors.black,
          ),
      ),
    );
  }
}

