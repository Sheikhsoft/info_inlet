import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/common/styles.dart';
import 'package:provider_example/store/store.dart';
import 'package:provider_example/widgets/payment_option.dart';

class PaymentMethodView extends StatefulWidget {
  @override
  _PaymentMethodViewState createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _genderHasError = false;

  final ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Store>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: iPrimaryColor,
          ),
        ),
        title: Text('Medical', style: TextStyle(color: Colors.black)),
        elevation: 8,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                autovalidateMode: AutovalidateMode.disabled,

                skipDisabled: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Payment Method - By User",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    PaymentOption()
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () => _showMyDialog(context, model.cartTotal),
                  style: ElevatedButton.styleFrom(
                    primary: iPrimaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context, double amountPaid) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/payment.png"),
                  ),
                  Text(
                    "Payment Successfull!!",
                    style: TextStyle(color: iPrimaryColor),
                  ),
                  Text("Tranjection Number: 12345"),
                  Text("_____________________"),
                  Text("Amount Paid ${amountPaid.toStringAsFixed(2)}"),
                  Text("Order Number : 151456"),
                ],
              ),
            ),
          ),
          actions: <Widget>[],
        );
      },
    );
  }
}
