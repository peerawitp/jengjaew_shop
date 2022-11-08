import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jengjaew_shop/themes/color.dart';
import 'package:jengjaew_shop/widgets/input_decoration.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();
  String? productCategory,
      productName,
      productPrice,
      productQuantity,
      productDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: kColorsWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add Product  ',
            style: Theme.of(context).textTheme.headline3,
          ),
          shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: kColorsPurple,
          actions: [
            IconButton(
              onPressed: () {},
              icon:
                  SvgPicture.asset('assets/icons/msg.svg', color: kColorsWhite),
            ),
            IconButton(
              onPressed: () {},
              icon:
                  SvgPicture.asset('assets/icons/me.svg', color: kColorsWhite),
            )
          ],
        ),
        body: ListView(
          children: [
            Form(
                key: formKey,
                child: Column(children: [
                  CreateProductName(),
                  CreateProductPrice(),
                  CreateProductQuantity(),
                  CreateProductDescription()
                ])),
          ],
        ));
  }

  Widget CreateProductName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product name';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Name')),
    );
  }

  Widget CreateProductPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product price';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Price')),
    );
  }

  Widget CreateProductQuantity() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product quantity';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Quantity')),
    );
  }

  Widget CreateProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product description';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Description')),
    );
  }
}
