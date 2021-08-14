import 'package:flutter/material.dart';
import 'package:layout/modules/person_item.dart';
import 'package:layout/widgets/favorite_widget.dart';

class PersonWidget extends StatelessWidget {
  List<PersonItem> persons = [//Список людей

    PersonItem(
      'assets/images/person.jpg',
      'name 1',
      'sub name 1',
      12,
      false,
      'Дональд Трамп - описание',
      [
        {
          'title': 'person 1',
          'icon': Icons.person,
        },
      ],
    ),

  ];

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Япония, команда №1'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(//Основной Widget совмещающий всё в единое целое
        children: persons//перебор свех людей
            .map((e) => Column(
                  children: [
                    _buildTopImage("${e.imageUrl}"),//Виджет картинки принимает String url
                    Center(//то что ниже картинки
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(//name и subName
                              margin: EdgeInsets.all(5),
                              child: _buildRating("${e.name}", "${e.subName}",
                                  e.favoriteCount, e.isFavorite)//_buildRating это слой между картинкой и характеристиками (name,subName,favorite button and favorite count),
                            ),
                            Card(//Характеристики
                              elevation: 5,
                              margin: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: _buildAction(e.actions)//это характеристики человека получает List
                                                              //внутри которого Map (title - название характеристики;icon иконка),
                              ),
                            ),
                            Container(//Описание
                              margin: EdgeInsets.all(5),
                              child: _buildDesc(e.desc),//Виджет описание получает описание String
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
            .toList(),
      );

  Widget _buildTopImage(String imageUrl) => Container(//Виджет верхней картинки
        child: Card(
          elevation: 5,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildRating(//виждет имени и рейтинга
          String name, String subName, int favoriteCount, bool isFavorite) =>
      ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subName,
          style: TextStyle(fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <FavoriteWidget>[
            FavoriteWidget(favoriteCount, isFavorite),
          ],
        ),
      );

  Widget _buildAction(List actions) => Row(//Характеристик
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actions
            .map((e) => _buildButton(e['title'], e['icon'], Colors.black))
            .toList(),
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(//виджет одной характеристики
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );

  Widget _buildDesc(String desc) => Text(//виждет описания
        desc,
        softWrap: true,
        style: TextStyle(
          fontSize: 16,
        ),
      );
}
