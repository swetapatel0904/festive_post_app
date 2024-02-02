import 'package:festive_post_app/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
              Image.asset("assets/logo/images.jpg",
                  height: MediaQuery.sizeOf(context).height ,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    const Text("INDIAN FESTIVALS",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontFamily: "font2"
                            )
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: ListView.builder(
                        itemCount: festivalList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'festival',
                               arguments: festival[index]);
                          },
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.primaries[index].shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.asset("${festivalList[index]['images']}",height: 80,width: 80,fit: BoxFit.cover),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${festivalList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "font",
                                  color: Colors.indigo
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}