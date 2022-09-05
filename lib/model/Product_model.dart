import 'package:equatable/equatable.dart';

class Product extends Equatable {

  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;


  const Product({
    required this.name,
    required this.category,
    required this.imgUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });


  @override
  List<Object?> get props =>
      [name, category, imgUrl, price, isRecommended, isPopular];
  static List<Product> product = [
    const Product(name: "Sunkist Fruit Punch",
        category: 'Soft Drinks',
        imgUrl: 'https://www.eatthis.com/wp-content/uploads/sites/4/2020/05/sunkist-fruit-punch.jpg',
        price: 120,
        isRecommended: true,
        isPopular: true),
    const Product(name: "Limca",
        category: 'Soft Drinks',
        imgUrl: 'https://www.bigbasket.com/media/uploads/p/l/70700_1-limca-regular-soft-drink.jpg',
        price: 100,
        isRecommended: false,
        isPopular: true),
    const Product(name: "Sunkist Pineapple",
        category: 'Soft Drinks',
        imgUrl: 'https://www.eatthis.com/wp-content/uploads/sites/4/2019/07/sunkist-pineapple-soda.jpg',
        price: 120,
        isRecommended: true,
        isPopular: false),
    const Product(name: "7up",
        category: 'Soft Drinks',
        imgUrl: 'https://www.rd.com/wp-content/uploads/2018/02/novyy-urengoy-russia-november-7-2018-aluminium-can-of-the-7up-lemon-lime-isolated-over-white-background.jpg',
        price: 80,
        isRecommended: true,
        isPopular: false),
    const Product(name: "Sprite",
        category: 'Soft Drinks',
        imgUrl: 'https://5.imimg.com/data5/SELLER/Default/2021/6/PD/OF/HI/26602448/51anijprujl-sl1000--1000x1000.jpg',
        price: 80,
        isRecommended: false,
        isPopular: true),
    Product(name: "Black Current",
        category: 'Ice Cream',
        imgUrl: 'https://insanelygoodrecipes.com/wp-content/uploads/2020/07/Homemade-Ube-Ice-Cream.jpg',
        price: 60,
        isRecommended: false,
        isPopular: true),
    Product(name: "Vanilla",
        category: 'Ice Cream',
        imgUrl: 'https://post.healthline.com/wp-content/uploads/2020/07/509595-13-Healthy-Ice-Cream-Brands_732x549-thumbnail.jpg',
        price: 40,
        isRecommended: false,
        isPopular: false),
    Product(name: "African Chocolate",
        category: 'Ice Cream',
        imgUrl: 'https://4.imimg.com/data4/HI/DG/MY-4575115/chocolate-icecream-flavour-500x500.jpg',
        price: 80,
        isRecommended: true,
        isPopular: true),
    Product(name: "Cookies And Cream",
        category: 'Ice Cream',
        imgUrl: 'https://nypost.com/wp-content/uploads/sites/2/2022/07/cookies-and-cream-1.jpg',
        price: 50,
        isRecommended: true,
        isPopular: true),
    Product(name: "Strawberry",
        category: 'Ice Cream',
        imgUrl: 'https://b.zmtcdn.com/data/dish_photos/a32/6150f110387b9e6e6d7235b5d6434a32.jpg',
        price: 80,
        isRecommended: false,
        isPopular: true),
    Product(name: "A Cappuccino",
        category: 'Coffee',
        imgUrl: 'https://www.thespruceeats.com/thmb/UA_NNtGiS5n6CI07kJVOMkSqYEA=/2942x2942/smart/filters:no_upscale()/how-to-make-cappuccinos-766116-hero-01-a754d567739b4ee0b209305138ecb996.jpg',
        price: 250,
        isRecommended: true,
        isPopular: true),
    Product(name: "Mocha Coffee",
        category: 'Coffee',
        imgUrl: 'https://www.thespruceeats.com/thmb/AcqgenobBS1vjzmnDMa7B7Q4RN8=/1345x1345/smart/filters:no_upscale()/mocha-4797918-05-f664d7225d5a4b14abdeacd2bf48471f.jpg',
        price: 280,
        isRecommended: true,
        isPopular: true),
    Product(name: "Americano Coffee",
        category: 'Coffee',
        imgUrl: 'https://c8.alamy.com/comp/K08XEP/iced-americano-coffee-in-take-away-cup-plastic-glass-on-the-wood-table-K08XEP.jpg',
        price: 180,
        isRecommended: true,
        isPopular: true),
    Product(name: "Cafe Latte",
        category: 'Coffee',
        imgUrl: 'https://www.thespruceeats.com/thmb/x7I8C5ZULZdDah4KgxqFT4WCAlI=/4200x2800/filters:fill(auto,1)/how-to-make-caffe-latte-765372-hero-01-2417e49c4a9c4789b3abdd36885f06ab.jpg',
        price: 300,
        isRecommended: true,
        isPopular: true),
  ];

}