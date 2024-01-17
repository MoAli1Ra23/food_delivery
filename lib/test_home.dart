// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/shared/responsive/widget/info_widget.dart';

class TestHome extends StatefulWidget {
  const TestHome({super.key});

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  late double h;
  late Color color = Colors.transparent;

  @override
  void initState() {
    h = 100;
    super.initState();
  }

  void animat() {
    h = 200;
    color = Colors.redAccent;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body:ResponsiveGrid(),
        //  AnimatedContainer(
        //   duration: const Duration(seconds: 2),
        //   color: Colors.red,
        //   height: h,
        //   width: h,
        //   child: InfoWidget(
        //     builder: (context, deviceInfo) {
        //       print(deviceInfo.crossAxisCount);
        //       print(deviceInfo.height);
        //       print(deviceInfo.loaclheight);
        //       print(deviceInfo.deviceType);
              

        //       return Container(
        //           color: Colors.amber,
        //           child: Center(
        //               child: ElevatedButton(
        //             onPressed: animat,
        //             child: const Text("aaaa"),
        //           )));
        //     },
        //   ),

        //   // child:   Center(child:ElevatedButton(onPressed: animat, child: const Text("aaaa"),))),
        // )
        );
  }
}

class Recipe {
  final String dissName;
  final String imgUrl;
  final String discraption;
  final String price;
  Recipe({
    required this.dissName,
    required this.imgUrl,
    required this.discraption,
    required this.price,
  });

}
class ResponsiveGrid extends StatelessWidget {
    ResponsiveGrid({super.key});
  final List<Recipe> recipes=[
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
    Recipe(dissName: "aaa", imgUrl: "assets/images/bestfood/bf10.jpeg", discraption: "discraptiondiscraptiondiscraptiondiscraption", price: "25"),
  ];
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context,deviceInfo){
               
      return GridView.builder(

        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: deviceInfo.crossAxisCount,mainAxisSpacing: 5,crossAxisSpacing: 3), itemBuilder: (context, index) {
         var  width=deviceInfo.localwith/deviceInfo.crossAxisCount ;
              print("row index  ${deviceInfo.localwith}");
              print(width);
              return InfoWidget(builder: (context,di){
                return Row(
                  children: [
                    Image.asset(recipes[index].imgUrl ,height: di.loaclheight,width: di.localwith/2,fit: BoxFit.fill,),
                    SizedBox(width: di.localwith/2,  child:  Column(children:[
              Text(recipes[index].dissName),
              Text(recipes[index].discraption),
              Text(recipes[index].price),
                  ]),),
                  ],

                );
              });


    //  return   SizedBox(width:deviceInfo.localwith/deviceInfo.crossAxisCount ,
    //    child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
        
     
    //         Image.asset(recipes[index].imgUrl,width: width/2,),
    //         Column(children:[
    //           Text(recipes[index].dissName),
    //           Text(recipes[index].discraption),
    //           Text(recipes[index].price),
    //         ])
    //       ],),
    //  );

      } ,);
    });
  }
}