// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/product/utility/theme/colors.dart';

// ignore: must_be_immutable
class FavoriteButton extends StatefulWidget {
  final VoidCallback onTap;
  bool isSelected;

  FavoriteButton({
    Key? key,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return _favoriteButton(widget.onTap);
  }

  Widget _favoriteButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
        setState(() {
          // TODO : Will be deleted it is temporary (will be added )
          widget.isSelected = !widget.isSelected;
        });
      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: mlPrimaryColor,
        child: Icon(
          widget.isSelected
              ? CupertinoIcons.suit_heart_fill
              : CupertinoIcons.suit_heart,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
