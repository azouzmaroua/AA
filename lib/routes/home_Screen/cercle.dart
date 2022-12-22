import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class cercle extends StatelessWidget {
  final double? radius;
  final int? nbr_payee;
  final int? nbr_non_payee;

  const cercle({Key? key, this.radius, this.nbr_payee, this.nbr_non_payee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = (nbr_non_payee! + nbr_payee!);
    double percent = nbr_payee! / (nbr_non_payee! + nbr_payee!);
    double a = percent * 100;
    double b = 100 - a;

    return Container(
      child: Opacity(
        opacity: 1,
        child: CircularPercentIndicator(
          radius: radius!,
          animationDuration: 1200,
          lineWidth: 9.0,
          animation: true,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                int.parse("$total").toString(),
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "\n  total d'achats ",
                style: TextStyle(fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          footer: Center(
            child: Container(
              // Full Width of Screen
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        a.toStringAsFixed(1) + "%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.green),
                      ),
                      Text(
                        "  payee  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      Text(
                        nbr_payee.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1000),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        b.toStringAsFixed(1) + "%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.red),
                      ),
                      Text(
                        " non payee ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      Text(
                        nbr_non_payee.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Color.fromARGB(255, 50, 168, 82),
          backgroundColor: Color.fromARGB(255, 233, 67, 53),
        ),
      ),
    );
  }
}
