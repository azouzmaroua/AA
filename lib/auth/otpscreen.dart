// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:my_parfum/widgets/custom/CustomButton.dart';
// import 'package:new_app/core/CustomButton.dart';
// import 'package:new_app/core/SizeConfig.dart';
// import 'package:new_app/core/constants.dart';
// import 'package:new_app/users%20interfaces/home.dart';
// import 'package:pinput/pinput.dart';

// class OTPScreen extends StatefulWidget {
//   String phone;
//   OTPScreen(this.phone);
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   String? _verificationCode;
//   final TextEditingController _pinPutController = TextEditingController();


//  final defaultPinTheme = PinTheme(
    
//     width: 56,
//     height: 56,
//     textStyle: const TextStyle(
//         fontSize: 20,
//         color: Color.fromRGBO(30, 60, 87, 1),
//         fontWeight: FontWeight.w600),
//     decoration: BoxDecoration(
//       border: Border.all(color: kMainColor),
//       borderRadius: BorderRadius.circular(15),
//       color:  Color.fromARGB(255, 179, 179, 179),

//     ),
//   );



//       final focusedPinTheme = 
//       PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: const TextStyle(
//         fontSize: 20,
//         color: Color.fromRGBO(30, 60, 87, 1),
//         fontWeight: FontWeight.w600),
//     decoration: BoxDecoration(
//        border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ); 
     
  
//   final submittedPinTheme =  PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: const TextStyle(
//         fontSize: 20,
//         color: Color.fromRGBO(30, 60, 87, 1),
//         fontWeight: FontWeight.w600),
//     decoration:  BoxDecoration(
//        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
//       borderRadius: BorderRadius.circular(20),
//       color: Color.fromRGBO(234, 239, 243, 1),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
      
//       body: Column(
//         children: [
//              const Expanded(child: SizedBox(height: 20,)),

//               Center(
//                       child: Image.asset(
//                     'images/my parfum.png',
//                     height: SizeConfig.defaultSize! * 20,
//                     width: SizeConfig.defaultSize! * 20,
//                   )),
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             child: Center(
//               child: Text(
//                 'Verifier +213-${widget.phone}',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//             ),
            
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Pinput(
//               length: 6,
//               defaultPinTheme: defaultPinTheme,
//               submittedPinTheme: submittedPinTheme,
//               focusedPinTheme: focusedPinTheme,
             
//               controller: _pinPutController,
           
//               pinAnimationType: PinAnimationType.fade,
              
//               onSubmitted: (pin) async {
//                 try {
//                   await FirebaseAuth.instance
//                       .signInWithCredential(PhoneAuthProvider.credential(
//                           verificationId: _verificationCode!, smsCode: pin))
//                       .then((value) async {
//                     if (value.user != null) {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (context) => Home()),
//                           (route) => false);
//                     }
//                   });
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                 
//                 }

//               },
//                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,  
//                           showCursor: true,  
//                           onCompleted: (pin) => print(pin)
//             ),
            
//           ),
//           const Expanded(child: SizedBox()),
//                   CustomGeneralButton(
//                       onTap: () {
                       
//                         OTPScreen(widget. phone);
                       
//                       },
//                       text: 'Re-envoyer le code'),
//                   const Expanded(child: SizedBox()),
//                   const Expanded(child: SizedBox()),
//                   const Expanded(child: SizedBox()),
//         ],
//       ),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+213${widget.phone}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String? verficationID, int? resendToken) {
//           setState(() {
//             _verificationCode = verficationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             _verificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 120));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
// }