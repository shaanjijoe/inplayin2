import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../logicscripts/GlobalData.dart';
// import '../firebaseauthservices.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({
    super.key,
    // required this.controller
  });
  // final PageController controller;
  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passController = TextEditingController();

  // final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void dispose(){
    _emailController.dispose();
    // _passController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    String email = _emailController.text.trim();
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Fluttertoast.showToast(
          msg: "Reset Email sent.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF755DC1).withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e){
      print(e.message);
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF755DC1).withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).pop();
    }


  }

  void signIn () async {

    String email = _emailController.text.trim();
    // String password1 = _passController.text.trim();

    // User? user = await _auth.signInWithEmailAndPassword(email, password1);

    // if(user!=null){
    //   GlobalData().setEmail(email);
    //   Navigator.pushReplacementNamed(context, '/homepage');
    // } else {
    //   // print('Some error');
    //   Fluttertoast.showToast(
    //       msg: "Unable to Login",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Color(0xFF755DC1).withOpacity(0.8),
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1, top: 15),
                child: Image.asset(
                  "assets/images/vector-3.png",
                  width: screenWidth,
                  height: screenHeight/2.4,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color(0xFF755DC1),
                        fontSize: 27,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF393939),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF837E93),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF9F7BFF),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // TextField(
                    //   controller: _passController,
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Color(0xFF393939),
                    //     fontSize: 13,
                    //     fontFamily: 'Poppins',
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    //   decoration: const InputDecoration(
                    //     labelText: 'Password',
                    //     labelStyle: TextStyle(
                    //       color: Color(0xFF755DC1),
                    //       fontSize: 15,
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       borderSide: BorderSide(
                    //         width: 1,
                    //         color: Color(0xFF837E93),
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       borderSide: BorderSide(
                    //         width: 1,
                    //         color: Color(0xFF9F7BFF),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 329,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            // signIn();
                            resetPassword();
                            // Navigator.pushReplacementNamed(context, '/homepage');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9F7BFF),
                          ),
                          child: const Text(
                            'Send recovery mail',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       'Don’t have an account?',
                    //       style: TextStyle(
                    //         color: Color(0xFF837E93),
                    //         fontSize: 13,
                    //         fontFamily: 'Poppins',
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 2.5,
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         // widget.controller.animateToPage(1,
                    //         //     duration: const Duration(milliseconds: 500),
                    //         //     curve: Curves.ease);
                    //       },
                    //       child: const Text(
                    //         'Sign Up',
                    //         style: TextStyle(
                    //           color: Color(0xFF755DC1),
                    //           fontSize: 13,
                    //           fontFamily: 'Poppins',
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Navigator.pushReplacementNamed(context, '/homepage');
                    //   },
                    //   child: const Text(
                    //     'Forget Password?',
                    //     style: TextStyle(
                    //       color: Color(0xFF755DC1),
                    //       fontSize: 13,
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}