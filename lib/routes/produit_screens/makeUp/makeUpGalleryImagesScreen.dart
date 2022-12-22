import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getImagesMakeUp.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:provider/provider.dart';

class GalleryImagesMakeUpScreen extends StatefulWidget {
  const GalleryImagesMakeUpScreen({Key? key}) : super(key: key);

  @override
  State<GalleryImagesMakeUpScreen> createState() =>
      _GalleryImagesMakeUpScreenState();
}

class _GalleryImagesMakeUpScreenState extends State<GalleryImagesMakeUpScreen> {
  @override
  void initState() {
    print("1========================================");
    // TODO: implement initState
    listUrlsImagesMakeUp.clear();
    listUrlsImagesMakeUpGets.clear();
    getDate();
    print("2========================================");

    super.initState();
  }

  List listUrlsImagesMakeUp = [];

  getDate() async {
    print("3========================================");

    await getImagesMakeUp();
    print("4========================================");

    setState(() {
      //forEach
      listUrlsImagesMakeUpGets.forEach((element) {
        listUrlsImagesMakeUp.add(element);
      });
      //
    });
  }

  //  listUrlsImagesMakeUp.length == 0

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          //    backgroundColor: Colors.redAccent,
          ),
      body: ladingGetImagesMakeUpScreen == false
          ? LadingAnmation()
          : listUrlsImagesMakeUp.length == 0
              ? Center(child: Text("pas de resultat trouvé"))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: listUrlsImagesMakeUp.length,
                  itemBuilder: (context, i) {
                    return Consumer<ChoesImageProvide>(
                        builder: ((context, model, child) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            howgetimage = "Network";
                            urlImageChosing = '${listUrlsImagesMakeUp[i]}';
                            model.returnBuiled();
                            Navigator.of(context).pop();
                          });
                          print(listUrlsImagesMakeUp[i]);
                        },
                        child: Container(
                          // width: SizeConfig.screenWidth! * 0.5,
                          // height: SizeConfig.screenHeight! * 0.5,
                          margin: EdgeInsets.all(10),
                          // child: Image.network(listUrlsImages[i]),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(listUrlsImagesMakeUp[i]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                //ifs select change shadow color
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
                                  1.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ),
                              //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ) //BoxShadow
                            ],
                          ),
                        ),
                      );
                    }));
                  },
                ),
    );
  }
}
