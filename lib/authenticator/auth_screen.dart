import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // --------------- Valuation---------------
  final _formKey = GlobalKey<FormState>();
  var _username = "";
  var _email = "";
  var _password = "";
  bool isLoginPage = false;
  bool _isObscure = true;
  // ----------------------------------------

  // --------------- Valuation---------------

  startauthentication() async {
    final validity = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validity) {
      _formKey.currentState!.save();
      submitForm(_email, _password, _username);
    }
  }

  submitForm(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLoginPage) {
        authResult = await auth.signInWithEmailAndPassword(
            email: username, password: password);
      } else {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = authResult.user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "username": username,
          "email": email,
          "password": password,
        });
      }
    } catch (err) {
      print(err);
    }
  }

  // ----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome to Project-WaveD"),
            const Divider(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  if (!isLoginPage)
                    // Username Portal
                    TextFormField(
                      keyboardType: TextInputType.text,
                      key: const ValueKey("username"),
                      // Validation
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      // onSave
                      onSaved: (value) {
                        _username = value!;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Enter Your Username Address"),
                    ),
                  // </>
                  const SizedBox(height: 20),
                  // Email Portal
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: const ValueKey("email"),
                    // Validation
                    validator: (value) {
                      if (value!.isEmpty | !value.contains("@")) {
                        return "Email not validated";
                      }
                      return null;
                    },
                    // onSave
                    onSaved: (value) {
                      _email = value!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Enter Your Email Address"),
                  ),
                  // </>
                  const SizedBox(height: 20),
                  // Passwork Portal
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    key: const ValueKey("password"),
                    // Validation
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      // else if (value.length < 4) {
                      //   return "Passwork must be more than 4 characters";
                      // }
                      return null;
                    },
                    // onSave
                    onSaved: (value) {
                      _password = value!;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Enter Your Password"),
                    obscureText: _isObscure,
                  ),
                  // </>
                  const SizedBox(height: 20),
                  // Button
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          startauthentication();
                        },
                        child: isLoginPage
                            ? const Text("Login In")
                            : const Text("Sign Up")),
                  ),
                  // </>
                  const SizedBox(height: 10),
                  // Login Page
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginPage = !isLoginPage;
                      });
                    },
                    child: isLoginPage
                        ? const Text("Create New Account")
                        : const Text("Existing user?"),
                  ),
                  // </>
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
