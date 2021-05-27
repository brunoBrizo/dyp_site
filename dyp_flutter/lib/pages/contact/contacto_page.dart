import 'package:dyp/components/Navbar.dart';
import 'package:dyp/components/constants.dart';
import 'package:dyp/components/sub_menu.dart';
import 'package:dyp/pages/contact/contact_form.dart';
import 'package:dyp/pages/footer/footer.dart';
import 'package:flutter/material.dart';

class ContactoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double containerPadding =
        width > 1300 ? kDefaultPadding * 2 : kDefaultPadding * 2;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white54, Colors.white70]),
          ),
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: SubMenu(),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: width * 0.7,
                child: Material(
                  elevation: 15,
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: width),
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    padding: EdgeInsets.all(containerPadding),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '¿Tienes un proyecto? No dudes en consultarnos',
                          style: TextStyle(
                            fontSize: 24,
                            /*  color: themeProvider.getTheme == Themes.lightTheme
                      ? Colors.black
                      : Colors.grey[100]*/
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ContactForm(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
