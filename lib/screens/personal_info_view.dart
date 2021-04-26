import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/common/styles.dart';
import 'package:provider_example/store/store.dart';

class PersonalInfoView extends StatefulWidget {
  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _genderHasError = false;
  bool _phoneHasError = false;
  bool _emailHasError = false;
  bool _countryHasError = false;
  bool _cityHasError = false;
  bool _addressHasError = false;
  bool _nidHasError = false;

  final ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];
  var countryOptions = ['Bangladesh', 'India', 'Pakistan', 'USA'];
  var cityOptions = ['Dhaka', 'Dubai', 'Satkhira', 'Khulna'];

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff00a3dc),
          ),
        ),
        title: Text('Medical', style: TextStyle(color: Colors.black)),
        elevation: 8,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
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
                    Text(
                      "Personal Information - By User",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      name: 'name',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        prefixIcon: Icon(Icons.person, color: iPrimaryColor),
                        labelText: 'Name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: iPrimaryColor),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey
                                  .currentState?.fields['name']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 6),
                        FormBuilderValidators.maxLength(context, 30),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FormBuilderDropdown<String>(
                      // autovalidate: true,
                      name: 'gender',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        prefixIcon: Icon(Icons.person_add_alt_1_outlined,
                            color: iPrimaryColor),
                      ),
                      // initialValue: 'Male',
                      allowClear: true,
                      hint: Text('Gender'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                      items: genderOptions
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (val) {
                        print(val);
                        setState(() {
                          _genderHasError = !(_formKey
                                  .currentState?.fields['gender']
                                  ?.validate() ??
                              false);
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      name: 'phone',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        prefixIcon: Icon(Icons.call, color: iPrimaryColor),
                        labelText: 'Phone',
                        suffixIcon: _phoneHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: iPrimaryColor),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _phoneHasError = !(_formKey
                                  .currentState?.fields['phone']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 10),
                        FormBuilderValidators.maxLength(context, 12),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      name: 'email',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        prefixIcon: Icon(Icons.mail, color: iPrimaryColor),
                        labelText: 'Email',
                        suffixIcon: _emailHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: iPrimaryColor),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _emailHasError = !(_formKey
                                  .currentState?.fields['email']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 200,
                            child: FormBuilderDropdown<String>(
                              // autovalidate: true,
                              name: 'country',
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                prefixIcon: Icon(Icons.location_on,
                                    color: iPrimaryColor),
                              ),
                              // initialValue: 'Male',
                              allowClear: true,
                              hint: Text('Country'),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              items: countryOptions
                                  .map((gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                print(val);
                                setState(() {
                                  _countryHasError = !(_formKey
                                          .currentState?.fields['country']
                                          ?.validate() ??
                                      false);
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            width: 200,
                            child: FormBuilderDropdown<String>(
                              // autovalidate: true,
                              name: 'city',
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                prefixIcon: Icon(Icons.location_on,
                                    color: iPrimaryColor),
                              ),
                              // initialValue: 'Male',
                              allowClear: true,
                              hint: Text('City'),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              items: cityOptions
                                  .map((gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                print(val);
                                setState(() {
                                  _cityHasError = !(_formKey
                                          .currentState?.fields['city']
                                          ?.validate() ??
                                      false);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      maxLines: 2,
                      autovalidateMode: AutovalidateMode.disabled,
                      name: 'address',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        prefixIcon:
                            Icon(Icons.location_on, color: iPrimaryColor),
                        labelText: 'Address',
                        suffixIcon: _addressHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: iPrimaryColor),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _addressHasError = !(_formKey
                                  .currentState?.fields['address']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 5),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      name: 'nid',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        prefixIcon:
                            Icon(Icons.card_travel, color: iPrimaryColor),
                        labelText: 'NId/Passport Number',
                        suffixIcon: _nidHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: iPrimaryColor),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nidHasError = !(_formKey.currentState?.fields['nid']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 5),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Add Photo"),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: iPrimaryColor,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {},
                        icon: Text("Uplod Photo"),
                        label: Icon(Icons.cloud_upload))
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
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      print(_formKey.currentState?.value);
                      model.navigateToPayment(context);
                    } else {
                      print(_formKey.currentState?.value);
                      print('validation failed');
                    }
                  },
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
}
