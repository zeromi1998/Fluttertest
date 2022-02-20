import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_skills_test/model/vehicle_model.dart';
import 'package:flutter_skills_test/services/generic_service.dart';

class VehicleServices extends GenericService {
  static VehicleServices _instance = VehicleServices._();

  VehicleServices._();

  static Future<String> fetchVehicles() async {
    //Your Code to fetch vehicles
    final response =   await http.get("https://myfakeapi.com/api/cars/");
    print("Api response   %%%%%%%%%%%: - ${response.body}");

    //  Vehicle.fromJson(response.body);


    return response.body.toString();
  }
}
