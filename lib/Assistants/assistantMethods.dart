
import 'package:flutter_myapp/DataHandler/appData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_myapp/Assistants/requestAssistant.dart';
import 'package:flutter_myapp/Models/address.dart';
import 'package:flutter_myapp/configMaps.dart';
import 'package:provider/provider.dart';

class AssistantMethods
{
  static Future<String> searchCoordinateAddress(Position position, context) async
  {
    String placeAddress = "";
    String st1, st2, st3, st4;
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);
    if(response != 'failed')
      {
        st1 = response["results"][0]["address_components"][3]["long_name"];
        st2 = response["results"][0]["address_components"][4]["long_name"];
        st3 = response["results"][0]["address_components"][5]["long_name"];
        st4 = response["results"][0]["address_components"][6]["long_name"];
        placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;


        Address userPickUpAddress = new Address();
        userPickUpAddress.longitude =position.longitude;
        userPickUpAddress.latitude =position.latitude;

        Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);
      }
    return placeAddress;
  }
}