import 'package:flutter/cupertino.dart';
import 'package:flutter_myapp/Models/address.dart';

class AppData extends ChangeNotifier
{
  Address pickUpLocation;

  void updatePickUpLocationAddress(Address pickUpAddress)
  {
   pickUpLocation = pickUpAddress;
   notifyListeners();
  }
}