import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jengjaew_shop/themes/color.dart';
import 'package:jengjaew_shop/widgets/input_decoration.dart';
import 'package:jengjaew_shop/widgets/main_btn_widget.dart';

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
            'Add Product',
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
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    CreateProductCategory(),
                    CreateProductName(),
                    CreateProductPrice(),
                    CreateProductQuantity(),
                    CreateProductDescription()
                  ])),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
                child: MainBtnWidget(
                    colorBtn: kColorsPurple,
                    textBtn: 'Confirm',
                    isTransparent: false,
                    haveIcon: false),
              ),
            )),
          ],
        ));
  }

  Widget CreateProductCategory() {
    List<String> category = [
      'Pen',
      'Book',
      'Paper',
      'Eraser',
      'Marker',
      'Folder'
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: InputDecorator(
          decoration: InputDecoration(
              labelText: 'Category',
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
                borderSide: BorderSide(color: kColorsGrey, width: 1),
              ),
              errorStyle: Theme.of(context).textTheme.bodyText2),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: productCategory,
                icon: SvgPicture.asset('assets/icons/down.svg',
                    color: kColorsGrey),
                elevation: 3,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: kColorsPurple),
                items: category.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    productCategory = value.toString();
                  });
                }),
          ),
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
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          autofocus: false,
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
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          autofocus: false,
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
          autofocus: false,
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
