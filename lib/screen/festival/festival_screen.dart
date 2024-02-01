import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({super.key});

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
  TextEditingController data = TextEditingController();
  double d1 = 20;
  Color c1 = Colors.white;
  String text = "";
  List festivalImage=[];
  Color bgcolor = Colors.transparent;
  List color = [Colors.white, Colors.black, ...Colors.primaries];
  String bgimage = "assets/logo/bg.jpg";
  Alignment a=Alignment.center;

  @override
  Widget build(BuildContext context) {
    festivalImage = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(bgimage,
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.45,
                      width: MediaQuery.sizeOf(context).width,
                      color: bgcolor,
                      child: Center(
                        child: Align(
                          alignment: a,
                          child: Text(
                            text,
                            style: TextStyle(color: c1, fontSize: d1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Text(
                  "Background Image",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: festivalImage.length,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            bgcolor = Colors.transparent;
                            bgimage = festivalImage[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "${festivalImage[index]}",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Text",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: data,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "Your Message...."),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.teal)),
                        onPressed: () {
                          setState(() {
                            text = data.text;
                            data.clear();
                          });
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Font Size",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: (){
                      setState(() {
                        d1 = d1+5;
                      });
                      },
                        child: Icon(Icons.add)),
                    SizedBox(width: 30,),
                    InkWell(onTap: (){
                      setState(() {
                        d1=d1-5;
                      });
                    },
                        child: Icon(Icons.remove)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),

                const Text(
                  "Font Alignment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
                SizedBox(height: 50,
                  child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          a = Alignment.centerRight;
                        });
                      },
                      child: const Column(
                        children: [
                            Icon(Icons.align_horizontal_right),
                            Text("Right"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          a = Alignment.centerLeft;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.align_horizontal_left),
                          Text("left"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          a = Alignment.center;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.align_horizontal_center),
                          Text("center"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          a=Alignment.topLeft;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.align_vertical_top),
                          Text("Top Left"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          a=Alignment.bottomRight;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.align_vertical_bottom),
                          Text("Bottom Right"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          a = Alignment.topCenter;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.align_vertical_center),
                          Text("Top center"),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
                const Text(
                  "Font Color",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: color.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          c1 = color[index];
                        });
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color[index],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}