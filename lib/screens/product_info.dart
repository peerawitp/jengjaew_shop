import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jengjaew_shop/themes/color.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: kColorsPurple,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: kColorsWhite,
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                SvgPicture.asset('assets/icons/edit.svg', color: kColorsPurple),
          ),
          IconButton(
            onPressed: () {},
            icon:
                SvgPicture.asset('assets/icons/msg.svg', color: kColorsPurple),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_product');
            },
            icon: SvgPicture.asset('assets/icons/me.svg', color: kColorsPurple),
          )
        ],
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(color: kColorsCream),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Book', style: Theme.of(context).textTheme.headline4),
                Text('Product name',
                    style: Theme.of(context).textTheme.headline2),
                Text('\$ price', style: Theme.of(context).textTheme.subtitle1),
                Text('Quantity: 2',
                    style: Theme.of(context).textTheme.subtitle1),
                Text('Description',
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
