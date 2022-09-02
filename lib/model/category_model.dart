import 'package:equatable/equatable.dart';

class Categoryscreen extends Equatable {
  final String name;
  final String imgUrl;

  const Categoryscreen({
    required this.name,
    required this.imgUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imgUrl];

  static List<Categoryscreen> categori = [
    Categoryscreen(
        name: 'Soft Drinks',
        imgUrl:
            'https://www.aahaarexpert.com/wp-content/uploads/2018/04/what-are-the-harmful-effects-of-cold-drinks.png'),
    Categoryscreen(
        name: 'Ice Cream',
        imgUrl:
            'https://thumbs.dreamstime.com/b/various-varieties-ice-cream-cones-mint-blueberry-strawberry-pistachio-cherry-chocolate-isolated-white-background-158155276.jpg'),
    Categoryscreen(
        name: 'Coffee',
        imgUrl:
            'https://res.cloudinary.com/grohealth/image/upload/f_auto,fl_lossy,q_auto/v1581688713/DCUK/Content/iStock-938993594-1000x600.jpg')
  ];
}
