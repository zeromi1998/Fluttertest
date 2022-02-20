import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skills_test/services/vehicle_service.dart';
import "../model/vehicle_model.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';


class Vehicles extends StatefulWidget {
  static String tag = "/vehicles";

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicles> {
  CarouselController carouselController = CarouselController();
  bool _isEditingText = false;
  TextEditingController _editingController;
  final featuredImages = [
    'lib/assets/images/elitefeatured.jpg',
    'lib/assets/images/guabafeatured.jpg',
    'lib/assets/images/eliteclubfeatured.jpg'
  ];
  

  @override
 
  @override
  Widget build(BuildContext context) {
    print("object ******* : - ${Vehicle.staticData()[0]} ");
    return Scaffold(
        appBar: AppBar(
          title: Text('Vehicles Catalog'),
        ),
        //Replace the body to implement your own screen design
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 180,
                height: 180,
                color: Colors.orange,
                child: Center(
                    child: Text(
                  "Vehicle Image",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          onPressed: () {
                            print("Button click");
                            carouselController.previousPage();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    Text("Car"),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          onPressed: () {
                            print("Clicked on Forward");
                            carouselController.nextPage();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController:
                          carouselController, // Give the controller
                      options: CarouselOptions(
                        autoPlay: false,
                      ),
                      items: Vehicle.staticData().asMap().entries.map((data) {
                        print("Acces Data using AsMap: - $data");
                        return Container(
                            height: 200,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Car Model",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    // _editTitleTextField(data.car),
                                    _isEditingText
                                        ? SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Car Name',
                                                  hintText: 'Enter Car Name'),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  data.value.car = "jkjkjkjk";
                                                  print(
                                                      "TextField Data &&&&&&&&&&: - $data");
                                                });
                                              },
                                            ),
                                          )
                                        : Text(data.value.car,
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Color",
                                        style: TextStyle(fontSize: 20)),
                                    //      _editTitleTextField(data.carColor),

                                    _isEditingText
                                        ? SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Car Name',
                                                  hintText: 'Enter Car Name'),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  print(
                                                      "TextField Data &&&&&&&&&&: - $value");
                                                });
                                              },
                                            ),
                                          )
                                        : Text(data.value.carColor,
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Year",
                                        style: TextStyle(fontSize: 20)),
                                    //       _editTitleTextField(data.carModelYear.toString()),

                                    _isEditingText
                                        ? SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Car Name',
                                                  hintText: 'Enter Car Name'),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  print(
                                                      "TextField Data &&&&&&&&&&: - $value");
                                                });
                                              },
                                            ),
                                          )
                                        : Text(
                                            data.value.carModelYear.toString(),
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("VIN", style: TextStyle(fontSize: 20)),
                                    //  _editTitleTextField(data.carVin),

                                    _isEditingText
                                        ? SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Car Name',
                                                  hintText: 'Enter Car Name'),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  print(
                                                      "TextField Data &&&&&&&&&&: - $value");
                                                });
                                              },
                                            ),
                                          )
                                        : Text(
                                            data.value.carVin.substring(0, 5),
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Price",
                                        style: TextStyle(fontSize: 20)),
                                    // _editTitleTextField(data.price.toString()),

                                    _isEditingText
                                        ? SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Car Name',
                                                  hintText: 'Enter Car Name'),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  print(
                                                      "TextField Data &&&&&&&&&&: - $value");
                                                });
                                              },
                                            ),
                                          )
                                        : Text(data.value.price,
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Availability",
                                        style: TextStyle(fontSize: 20)),
                                    //  _editTitleTextField(data.availability.toString()),
                                    _isEditingText
                                        ? SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Car Name',
                                                  hintText: 'Enter Car Name'),
                                              onSubmitted: (value) {
                                                setState(() {
                                                  print(
                                                      "TextField Data &&&&&&&&&&: - $value");
                                                });
                                              },
                                            ),
                                          )
                                        : Text(
                                            data.value.availability.toString(),
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          child: Text('Edit'),
                                          onPressed: () {
                                            setState(() {
                                              _isEditingText = true;
                                            });
                                            print(
                                                'isEdited Value : - $_isEditingText');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          child: Text('Delete'),
                                          onPressed: () {
                                            
                                            print("Length of array : - ${Vehicle.staticData().length}");
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  // Widget _editTitleTextField(data) {
  //   print("Insde editeblee ; -  $data");
  //   if (_isEditingText)
  //     return Center(
  //       child: TextField(
  //         onSubmitted: (newValue) {
  //           setState(() {
  //             // initialText = newValue;
  //             _isEditingText = false;
  //           });
  //         },
  //         autofocus: true,
  //         controller: _editingController,
  //       ),
  //     );
  //   return InkWell(
  //       onTap: () {
  //         setState(() {
  //           _isEditingText = true;
  //         });
  //       },
  //       child: Text(
  //         data,
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 18.0,
  //         ),
  //       ));
  // }
}

//Text('No Vehicles Found!!', style: TextStyle(fontSize: 30.0)),