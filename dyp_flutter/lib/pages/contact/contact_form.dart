import 'package:dyp/components/constants.dart';
import 'package:dyp/components/default_button.dart';
import 'package:dyp/logic/remote_services.dart';
import 'package:dyp/models/project_email.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _projectDescriptionController =
      new TextEditingController();
  TextEditingController _clientEmailController = new TextEditingController();
  TextEditingController _clientNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: _clientNameController,
              onChanged: (value) {},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                //labelText: "Your Name",
                hintText: 'Ingrese su nombre',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return ('Por favor ingrese su nombre');
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: _clientEmailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              decoration: InputDecoration(
                //labelText: "Email Address",
                hintText: 'Ingrese su dirección de correo',
              ),
              validator: (value) {
                print(_clientEmailController.text);
                if (value.isEmpty) {
                  return ('Por favor ingrese su email');
                } else if (!EmailValidator.validate(
                    _clientEmailController.text)) {
                  return ('Por favor ingrese un email válido');
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            child: TextFormField(
              controller: _projectDescriptionController,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
              decoration: InputDecoration(
                // labelText: "Description",
                hintText: 'Descripción del Proyecto',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return ('Por favor ingrese una descripción');
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: 'Enviar',
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _sendEmail(
                      _clientNameController.text,
                      _clientEmailController.text,
                      _projectDescriptionController.text,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _sendEmail(
    String clientName,
    String clientEmail,
    String projectDescription,
  ) async {
    Email email = new Email();
    email.client = new Client();
    email.client.clientEmail = clientEmail;
    email.client.clientName = clientName;
    email.client.projectDescription = projectDescription;
    email.client.projectName = 'DYP';
    email.ishtml = true;
    email.mailto = ['bbrizolara7@gmail.com'];
    email.subject = 'Arkam Software Contact Form';

    await RemoteServices.sendEmail(email);
    Fluttertoast.showToast(
        msg: 'Email enviado!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        webPosition: "center",
        fontSize: 16.0);

    _clientEmailController.text = '';
    _clientNameController.text = '';
    _projectDescriptionController.text = '';
  }
}
