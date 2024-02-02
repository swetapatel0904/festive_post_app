import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/global.dart';

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
  String bgImage="assets/logo/bg.jpg";
  Color bgcolor = Colors.transparent;
  List color = [Colors.white, Colors.black, ...Colors.primaries];
  Alignment a=Alignment.center;
  GlobalKey key = GlobalKey();
  bool image = false;
  bool text1 = false;
  bool fontSize = false;
  bool fontAlignment = false;
  bool fontWeight = false;
  bool fontColor = false;
  String? selectCategory;
  bool bold=false;
  bool italic=false;

  @override
  Widget build(BuildContext context) {
    festivalImage = ModalRoute.of(context)!.settings.arguments as List;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Post"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () async {
              RenderRepaintBoundary render = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await render.toImage();
              ByteData? byteData=await image.toByteData(format:ui.ImageByteFormat.png);
              String path ="/storage/emulated/0/Download/image.png";
              await File(path).writeAsBytes(byteData!.buffer.asUint8List());
              print("$path");
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data is saved")));
              });
            }, icon: Icon(Icons.save),),
            IconButton(onPressed: () async {
              RenderRepaintBoundary render = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await render.toImage();
              ByteData? byteData=await image.toByteData(format:ui.ImageByteFormat.png);
              String path ="/storage/emulated/0/Download/image.png";
              await File(path).writeAsBytes(byteData!.buffer.asUint8List());
              print("$path");
              final result = await Share.shareXFiles([XFile(path)],text:"Beautiful image");
            }, icon: Icon(Icons.share),),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset("${bgImage}",
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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.40,
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Background Image",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              image=!image;

                            });
                          }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                        ],
                      ),

                      Visibility(
                        visible: image,
                        child: SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: festivalImage.length,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    bgcolor = Colors.transparent;
                                    bgImage= festivalImage[index];
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
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              "Text",
                              style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          IconButton(onPressed: (){
                            setState(() {
                              text1=!text1;

                            });
                          }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Visibility(
                          visible: text1,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Font Size",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              fontSize=!fontSize;

                            });
                          }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: fontSize,
                        child: Row(
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
                      ),
                      const SizedBox(
                        height: 5,
                      ),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Font Alignment",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              fontAlignment=!fontAlignment;

                            });
                          }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Visibility(
                        visible: fontAlignment,
                        child: SizedBox(height: 50,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Font Color",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              fontColor=!fontColor;

                            });
                          }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                        ],
                      ),
                      Visibility(
                        visible: fontColor,
                        child: SizedBox(
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Font Weight",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              fontWeight=!fontWeight;
                            });
                          }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                        ],
                      ),
                      Visibility(
                        visible: fontWeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                bold=!bold;
                              });
                            }, icon: Icon(Icons.format_bold_outlined)),
                            SizedBox(width: 10,),
                            IconButton(onPressed: (){
                              setState(() {
                                italic=!italic;
                              });
                            }, icon: Icon(Icons.format_italic_outlined)),
                          ],
                        )
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}