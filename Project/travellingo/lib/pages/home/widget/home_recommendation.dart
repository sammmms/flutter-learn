import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeRecommendation extends StatefulWidget {
  const HomeRecommendation({super.key});

  @override
  State<HomeRecommendation> createState() => _HomeRecommendationState();
}

class _HomeRecommendationState extends State<HomeRecommendation> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.2), borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image(image: AssetImage("HimejiCastle.png"),),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Himeji Castle"),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.location_pin, color: Colors.black, size: 15,),
                                SizedBox(width: 5,),
                                Text("HIMEJI, JAPAN", style: TextStyle(fontSize: 10),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              width: 120,
                              child: Divider(
                                color: Colors.grey.shade200,
                                thickness: 0.1,
                              )
                            ),
                            Text("\$250", style: TextStyle(decoration: TextDecoration.lineThrough, decorationColor: Colors.grey[300], color: Colors.grey[300], fontSize: 10),),
                            Row(
                              children: [
                                Text("\$125", style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(62, 132, 168, 1)),),
                                Text(" /PERSON", style: TextStyle(fontSize: 10),),
                                SizedBox(width: 25,),
                                Icon(Icons.star, color: Colors.yellow, size: 12,),
                                Text("4.5", style: TextStyle(fontSize: 10, color: Colors.grey[400]),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }
}