class PersonItem {//Класс человека
  String imageUrl;//Картинка
  String name;//имя
  String subName;//мини описание или типо того
  int favoriteCount;//количество сердечек
  bool isFavorite;//поставлена ли сердце
  String desc;//Полное описание
  List<Map> actions;//характеристики

  PersonItem(this.imageUrl, this.name, this.subName, this.favoriteCount,
      this.isFavorite, this.desc,this.actions);//Конструктор
}
