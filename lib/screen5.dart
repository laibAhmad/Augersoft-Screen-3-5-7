import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class Screen5 extends StatefulWidget {
  const Screen5({Key key}) : super(key: key);

  @override
  _Screen5State createState() => _Screen5State();
}

String countryValue = 'Select Country';
TextEditingController _streetController = TextEditingController();
TextEditingController _flatController = TextEditingController();
TextEditingController _cityController = TextEditingController();
TextEditingController _stateController = TextEditingController();
TextEditingController _postcodeController = TextEditingController();

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 165, 46, 177),
                  Color.fromARGB(255, 112, 43, 172)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              height: size.height * 0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(CupertinoIcons.back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          'Confirm your address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            textFields(size, context),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text:
                                          "We'll only share your address with guests who are booked as outlined in our ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Privacy Policy.",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: _stateController.text.isEmpty ||
                                        _cityController.text.isEmpty ||
                                        _stateController.text.isEmpty ||
                                        _postcodeController.text.isEmpty
                                    ? Colors.grey[400]
                                    : Color(0xffe51e4e),
                                elevation: 0,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Screen5()));
                            },
                            child: Text(
                              "Look's good",
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding textFields(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Column(
          children: [
            ///    street field
            Container(
              height: size.height * 0.07,
              child: CupertinoTextField(
                controller: _streetController,
                placeholder: 'Street *',
                placeholderStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.red[800],
                ),
                cursorHeight: 25,
                cursorColor: Colors.grey,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.red[800],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.red[50],
                ),
              ),
            ),

            ///    flat,suite field
            Container(
              height: size.height * 0.07,
              child: CupertinoTextField(
                controller: _flatController,
                placeholder: 'Flat, suite, etc. (Optional)',
                cursorHeight: 25,
                cursorColor: Colors.grey,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    right: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            ///    city field
            Container(
              height: size.height * 0.07,
              child: CupertinoTextField(
                controller: _cityController,
                placeholder: 'City *',
                placeholderStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.red[800],
                ),
                cursorHeight: 25,
                cursorColor: Colors.grey,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: Colors.red[800],
                    ),
                    right: BorderSide(
                      width: 1,
                      color: Colors.red[800],
                    ),
                    top: BorderSide(
                      width: 1,
                      color: Colors.red[800],
                    ),
                  ),
                  color: Colors.red[50],
                ),
              ),
            ),
            Row(
              children: [
                ///    state field
                Container(
                  width: size.width * 0.452,
                  height: size.height * 0.07,
                  child: CupertinoTextField(
                    controller: _stateController,
                    placeholder: 'State *',
                    placeholderStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.red[800],
                    ),
                    cursorHeight: 25,
                    cursorColor: Colors.grey,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: Colors.red[800],
                        ),
                        top: BorderSide(
                          width: 1,
                          color: Colors.red[800],
                        ),
                        left: BorderSide(
                          width: 1,
                          color: Colors.red[800],
                        ),
                      ),
                      color: Colors.red[50],
                    ),
                  ),
                ),

                ///    postcode  field
                Container(
                  width: size.width * 0.46,
                  height: size.height * 0.07,
                  child: CupertinoTextField(
                    controller: _postcodeController,
                    placeholder: 'Postcode *',
                    placeholderStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.red[800],
                    ),
                    cursorHeight: 25,
                    cursorColor: Colors.grey,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: Colors.red[800],
                        ),
                        top: BorderSide(
                          width: 1,
                          color: Colors.red[800],
                        ),
                        //
                      ),
                      color: Colors.red[50],
                    ),
                  ),
                ),
              ],
            ),

            ///    country drop down
            InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  onSelect: (Country country) {
                    setState(() {
                      countryValue = '${country.displayNameNoCountryCode}';
                    });
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country/Region',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            countryValue,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
