import 'package:flutter/material.dart';

//Кнопка "нравится" и его функционал
class FavoriteWidget extends StatefulWidget {
  
  int favoriteCount;//количество сердечек
  bool isFavorite;//есть ли сердце

  FavoriteWidget(this.favoriteCount,this.isFavorite);//Конструктор


  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(//Кнопка сердечки
          child: IconButton(
            icon: (widget.isFavorite
                ? Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  )
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(//Количество сердечек
          width: 40,
          child: Container(
            child: Text("${widget.favoriteCount}"),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {//Функционал "лайка"
    setState(() {
      if (widget.isFavorite) {
        widget.isFavorite = false;
        widget.favoriteCount -= 1;
      } else {
        widget.isFavorite = true;
        widget.favoriteCount += 1;
      }
    });
  }
}
