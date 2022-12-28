import 'package:flutter/material.dart';
import 'package:salesapp251/functions/auth.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  bool isUserExist = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    width: 300,
                    height: 230.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            isUserExist
                                ? Container()
                                : const Text(
                                    "email or password is incorrect",
                                    style: TextStyle(color: Colors.red),
                                  ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  // if (value.length > 10) {
                                  //   value = _phoneController - 1;
                                  // }
                                },
                                textInputAction: TextInputAction.next,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    hintText: 'Phone',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length > 10) {
                                    return "Please enter the phone correctly";
                                  }

                                  //phone = value;
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.go,
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder()),
                                style: const TextStyle(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter password correctly!";
                                  }

                                  // password = value;
                                  return null;
                                },
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                      // onPrimary:
                                      //     Theme.of(context).colorScheme.secondary,

                                      )
                                  .copyWith(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xfff8de3f)),
                                      shape: MaterialStateProperty.all<
                                          OutlinedBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                      ),
                                      elevation:
                                          ButtonStyleButton.allOrNull(0.0)),
                              onPressed: () async {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Loading...')),
                                  );
                                  String? resultEmail = await signin(
                                      _emailController.text,
                                      _passwordController.text);
                                  if (resultEmail != null) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(email: resultEmail)),
                                        (route) => false);
                                  }
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
