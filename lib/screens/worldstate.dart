import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:korana/providers/world_provider.dart';
import 'package:korana/screens/countrieslist.dart';
import 'package:korana/screens/detailscreen.dart';
import 'package:pie_chart/pie_chart.dart';

class world_state extends StatelessWidget {
  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Today's Update",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer(builder: (context, ref, child) {
            final worlds = ref.watch(worldProvider);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Expanded(
                      child: Container(
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    worldrow(
                                        title: 'Cases:', value: worlds.cases),
                                    worldrow(
                                        title: 'Updated:',
                                        value: worlds.updated),
                                    worldrow(
                                        title: 'Today Cases:',
                                        value: worlds.todayCases),
                                    worldrow(
                                        title: 'Deaths:', value: worlds.deaths),
                                    worldrow(
                                        title: 'Today Deaths:',
                                        value: worlds.todayDeaths),
                                    worldrow(
                                        title: 'Recovered:',
                                        value: worlds.recovered),
                                    worldrow(
                                        title: 'Active:', value: worlds.active),
                                    worldrow(
                                        title: 'Critical:',
                                        value: worlds.critical),
                                    worldrow(
                                        title: 'Caseper One Million',
                                        value: worlds.casesPerOneMillion),
                                    worldrow(
                                        title: 'Affected Countries:',
                                        value: worlds.affectedCountries),
                                    worldrow(
                                        title: 'Affected Countries:',
                                        value: worlds.affectedCountries),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => countries_list(),
                          transition: Transition.fadeIn);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff1aa260),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text('Track Countries'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class worldrow extends StatelessWidget {
  String title;
  int? value;
  worldrow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                value.toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
