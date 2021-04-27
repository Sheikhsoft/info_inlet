import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/common/styles.dart';
import 'package:provider_example/store/store.dart';

/// This is the stateful widget that the main application instantiates.
class PaymentOption extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<PaymentOption> {
  bool _stripeCardNumberHasError = false;
  final List<Item> _data = [
    Item(
        id: 0,
        headerValue: "Pay online via Stripe",
        expandedWidget: Text("Stripe")),
    Item(
        id: 1,
        headerValue: "Pay online via Payple",
        expandedWidget: Text("Payple")),
    Item(
        id: 2,
        headerValue: "Payment via RazorPay",
        expandedWidget: Text("RazorPay")),
    Item(
        id: 3,
        headerValue: "Payment via SSlCommerz",
        expandedWidget: Text("SSlCommerz")),
    Item(
        id: 4,
        headerValue: "Pay On Alivel",
        expandedWidget: Text("Pay On Alivel")),
    Item(
        id: 5,
        headerValue: "Bank Transfer",
        expandedWidget: Text("Bank Transfer")),
  ];

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Store>(context);
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return _stripeWidget();
      case 1:
        return Container(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Pay With Payple",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: iPrimaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        );
      case 2:
        return Container(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Pay via PozorPay",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: iPrimaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        );
      case 3:
        return Container(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Pay via SSLCommerz",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: iPrimaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        );
      case 4:
        return Container(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Cash On Delevery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: iPrimaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        );
      case 5:
        return Container(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Bank Transfer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: iPrimaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        );

      default:
        return _stripeWidget();
    }
  }

  Widget _stripeWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilder(
              // enabled: false,
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              child: Column(
                children: [
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'strapi_card_number',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon:
                          Icon(Icons.card_giftcard, color: iPrimaryColor),
                      labelText: 'Card Number',
                    ),
                    onChanged: (val) {},
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.min(context, 10),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    // initialValue: '12',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'strapi_name',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon: Icon(Icons.person, color: iPrimaryColor),
                      labelText: 'Full Name',
                    ),
                    onChanged: (val) {},
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.min(context, 10),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    // initialValue: '12',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.disabled,
                          name: 'strapi_ex',
                          decoration: InputDecoration(
                            icon: Image.asset(
                              'assets/images/calendar.jpg',
                              width: 40.0,
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            labelText: 'MM/YY',
                          ),
                          onChanged: (val) {},
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                          // initialValue: '12',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.disabled,
                          name: 'strapi_cvc',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            labelText: 'CVC',
                          ),
                          onChanged: (val) {},
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                          // initialValue: '12',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      elevation: 0,
      initialOpenPanelValue: 0,
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
            canTapOnHeader: true,
            value: item.id,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item.headerValue,
                  style: TextStyle(fontSize: 18),
                ),
                leading: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: iPrimaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  width: 20,
                  height: 20,
                  child: Radio(
                    onChanged: null,
                    activeColor: isExpanded ? iPrimaryColor : Colors.grey,
                    groupValue: null,
                    value: null,
                  ),
                ),
              );
            },
            body: getViewForIndex(item.id));
      }).toList(),
    );
  }

  // stores ExpansionPanel state information

}

enum PaymentType { stripe, paypal, tutorialandexample }

class Item {
  Item({
    required this.id,
    required this.expandedWidget,
    required this.headerValue,
  });

  int id;
  Widget expandedWidget;
  String headerValue;
}
