import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getImagesParfum.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:provider/provider.dart';

class GalleryImagesParfumScreen extends StatefulWidget {
  const GalleryImagesParfumScreen({Key? key}) : super(key: key);

  @override
  State<GalleryImagesParfumScreen> createState() =>
      _GalleryImagesParfumScreenState();
}

class _GalleryImagesParfumScreenState extends State<GalleryImagesParfumScreen> {
  @override
  void initState() {
    // TODO: implement initState
    listUrlsImagesParfum.clear();
    listUrlsImagesParfumGets.clear();
    getDate();
    super.initState();
  }

  List listUrlsImagesParfum = [];

  getDate() async {
    await getImagesParfum();

    setState(() {
      //forEach
      listUrlsImagesParfumGets.forEach((element) {
        listUrlsImagesParfum.add(element);
      });
      //
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: ladingGetImagesParfumScreen == false
          ? LadingAnmation()
          : listUrlsImagesParfum.length == 0
              ? Center(child: Text("pas de resultat trouvé"))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: listUrlsImagesParfum.length,
                  itemBuilder: (context, i) {
                    return Consumer<ChoesImageProvide>(
                        builder: ((context, model, child) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            howgetimage = "Network";
                            urlImageChosing = '${listUrlsImagesParfum[i]}';
                            model.returnBuiled();
                            Navigator.of(context).pop();
                          });
                          print(listUrlsImagesParfum[i]);
                        },
                        child: Container(
                          // width: SizeConfig.screenWidth! * 0.5,
                          // height: SizeConfig.screenHeight! * 0.5,
                          margin: EdgeInsets.all(10),
                          // child: Image.network(listUrlsImages[i]),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(listUrlsImagesParfum[i]),
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
