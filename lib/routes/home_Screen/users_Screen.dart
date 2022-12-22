import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

class User_Screen extends StatefulWidget {
  User_Screen({Key? key}) : super(key: key);

  @override
  State<User_Screen> createState() => _User_ScreenState();
}

class _User_ScreenState extends State<User_Screen> {
  @override
  TextEditingController textFormFeild = new TextEditingController();
  TextEditingController textFormFeildName = new TextEditingController();
  TextEditingController textFormFeildCode = new TextEditingController();

  String CodeApp = "773377";
  bool veiwScreen = false;
  List listUsers = [];
  int indexChoes = 0;

  @override
  void initState() {
    // TODO: implement initState
    getUsers();
    super.initState();
  }

  Future getUsers() async {
    listUsers.clear();
    //
    var refranceUsers = await FirebaseFirestore.instance.collection("user_app");

    refranceUsers.get().then((value) {
      setState(() {
        value.docs.forEach((element) {
          listUsers.add({
            "idUser": element.id,
            "code": element.data()["code"],
            "name": element.data()["name"],
          });
        });
      });
    });

    //
    if (listUsers.isNotEmpty == true) {
      setState(() {
        textFormFeildName.text = listUsers[0]["name"];
        textFormFeildCode.text = listUsers[0]["code"];
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting Users"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: veiwScreen == true
            ? ListView(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemCount: listUsers.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                indexChoes = index;
                                textFormFeildName.text =
                                    listUsers[index]['name'];
                                textFormFeildCode.text =
                                    listUsers[index]['code'];
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: indexChoes == index
                                    ? Color.fromARGB(255, 213, 213, 213)
                                    : Color.fromARGB(255, 255, 255, 255),
                                border:
                                    Border.all(width: 0.5, color: colorGray),
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                      text: "${index + 1}",
                                      TextSize: 23,
                                      TextColor: Colors.black,
                                      TextWeight: FontWeight.bold),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 50,
                                    width: 3,
                                    color: Colors.black,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: " code : " +
                                              listUsers[index]['code'],
                                          TextSize: 15,
                                          TextColor: Color.fromARGB(
                                              255, 172, 171, 171),
                                          TextWeight: FontWeight.bold),
                                      CustomText(
                                          text: " name : " +
                                              listUsers[index]['name'],
                                          TextSize: 15,
                                          TextColor: Color.fromARGB(
                                              255, 172, 171, 171),
                                          TextWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 10,
                    width: double.infinity,
                    color: Color.fromARGB(255, 237, 236, 236),
                  ),
                  //
                  Column(
                    children: [
                      CustomText(
                          text: "name :",
                          TextSize: 23,
                          TextColor: Color.fromARGB(255, 131, 130, 130),
                          TextWeight: FontWeight.bold),
                      //text form feiled
                      Container(
                        width: 300,
                        height: 80,
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                          controller: textFormFeildName,
                          keyboardType: TextInputType.text,
                          onChanged: (v) {},
                          onSaved: (ve) {},
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCCCCCC),
                                )),
                          ),
                        ),
                      ),
                      //
                      CustomText(
                          text: "code :",
                          TextSize: 23,
                          TextColor: Color.fromARGB(255, 131, 130, 130),
                          TextWeight: FontWeight.bold),
                      //text form feiled
                      Container(
                        width: 300,
                        height: 80,
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                          controller: textFormFeildCode,
                          keyboardType: TextInputType.number,
                          onChanged: (v) {},
                          onSaved: (ve) {},
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCCCCCC),
                                )),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 95,
                        height: 35,
                        margin: EdgeInsets.all(10),
                        child: CustomGeneralButton(
                          color: Color.fromARGB(255, 0, 136, 255),
                          text: 'Update',
                          onTap: () async {
                            var refranceUsers = await FirebaseFirestore.instance
                                .collection("user_app");
                            refranceUsers
                                .doc(listUsers[indexChoes]['idUser'])
                                .update({
                              "name": textFormFeildName.text,
                              "code": textFormFeildCode.text
                            });

                            //
                            getUsers();
                          },
                        ),
                      ),
                      Container(
                        width: 95,
                        height: 35,
                        margin: EdgeInsets.all(10),
                        child: CustomGeneralButton(
                          color: Colors.redAccent,
                          text: 'remove',
                          onTap: () async {
                            var refranceUsers = await FirebaseFirestore.instance
                                .collection("user_app");
                            refranceUsers
                                .doc(listUsers[indexChoes]['idUser'])
                                .delete();

                            //
                            getUsers();
                          },
                        ),
                      ),
                      Container(
                        width: 95,
                        height: 35,
                        margin: EdgeInsets.all(10),
                        child: CustomGeneralButton(
                          color: greenColor,
                          text: 'add',
                          onTap: () async {
                            var refranceUsers = await FirebaseFirestore.instance
                                .collection("user_app");
                            refranceUsers.add({
                              "name": textFormFeildName.text,
                              "code": textFormFeildCode.text
                            });

                            //
                            getUsers();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'enter Code',
                      TextSize: 23,
                      TextColor: Colors.black,
                      TextWeight: FontWeight.bold),
                  //text form feiled
                  Container(
                    width: 500,
                    height: 80,
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: textFormFeild,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {},
                      onSaved: (ve) {},
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC),
                            )),
                      ),
                    ),
                  ),
                  //
                  Container(
                    width: 195,
                    height: 50,
                    child: CustomGeneralButton(
                      color: greenColor,
                      text: 'confirm',
                      onTap: () {
                        if (textFormFeild.text == CodeApp) {
                          setState(() {
                            veiwScreen = true;
                            getUsers();
                          });
                        } else {
                          AwesomeDialog(
                            //   useRootNavigator: false,
                            context: context,
                            title: "Error",
                            desc: "the code is false",
                            btnOkOnPress: () {},
                            btnCancelOnPress: () {},

                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                          )..show();
                        }
                      },
                    ),
                  ),
                ],
              ));
  }
}
