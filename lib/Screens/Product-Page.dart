import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopobae/Widgets.dart';

String dropdownvalueproduct = '--Select--';

List Category = ['--Select--', 'x', 'y', 'z'];
TextEditingController PriceController = TextEditingController();
TextEditingController BrandController = TextEditingController();

TextEditingController NameController = TextEditingController();
TextEditingController CategoryController = TextEditingController();
late String codeDialog;
late String valueText;

List<Widget> _cardList = [];

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFC107),
        child: FittedBox(
          alignment: Alignment.center,
          child: TextStyle1(
            "Add\nProduct",
            10,
            Colors.black,
            FontWeight.bold,
            TextAlign.center,
            FontStyle.normal,
          ),
        ),
        onPressed: () {
          showBottomSheet(context: , builder: builder)
          // AddCard(context);
        },
      ),
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Center(
        child: Column(
          children: [CardListView()],
        ),
      ),
    );
  }

  Future<void> AddCard(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AddTripDialogue(),
          );
        });
  }

  Widget AddTripDialogue() {
    return AlertDialog(
      title: TextStyle1('Product Details', 20, Colors.black, FontWeight.bold,
          TextAlign.center, FontStyle.normal),
      content: DropdownButton(
          elevation: 10,
          value: dropdownvalueproduct,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: Category.map((dynamic Category) {
            return DropdownMenuItem(
              value: Category,
              child: TextStyle1(Category, 18, Colors.black, FontWeight.w500,
                  TextAlign.center, FontStyle.normal),
            );
          }).toList(),
          onChanged: (dynamic newValue) {
            setState(() {
              dropdownvalueproduct = newValue!;
            });
          }),
      actions: <Widget>[
        Column(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: TextStyle1("Details", 20, Colors.black, FontWeight.bold,
                    TextAlign.center, FontStyle.normal)),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
                controller: NameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
                controller: BrandController,
                decoration: const InputDecoration(hintText: "Brand"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
                controller: PriceController,
                decoration: const InputDecoration(hintText: "Price"),
              ),
            )
          ],
        ),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {
            setState(
              () {
                String Name = NameController.text;
                String Price = PriceController.text;
                String Brand = BrandController.text;
                String Category = CategoryController.text;

                userdata.write('Category', Category);
                userdata.write('Brand', Brand);
                userdata.write('Name', Name);
                userdata.write('Price', Price);

                codeDialog = valueText;
                _cardList.add(_card());
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    );
  }

  Widget CardListView() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _cardList.length,
      itemBuilder: (context, index) {
        return _cardList[index];
      },
    );
  }

  Widget _card() {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 20,
      color: Colors.deepPurple.shade100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyle1(
                    userdata.read(
                      'Brand',
                    ),
                    20,
                    Colors.black,
                    FontWeight.bold,
                    TextAlign.center,
                    FontStyle.normal),
                TextStyle1(userdata.read('Category'), 20, Colors.black,
                    FontWeight.bold, TextAlign.center, FontStyle.normal),
                TextStyle1(userdata.read('Price'), 20, Colors.black,
                    FontWeight.bold, TextAlign.center, FontStyle.normal),
                TextStyle1(userdata.read('Name'), 20, Colors.black,
                    FontWeight.bold, TextAlign.center, FontStyle.normal),
              ],
            ),
          )
        ],
      ),
    );
  }
}
