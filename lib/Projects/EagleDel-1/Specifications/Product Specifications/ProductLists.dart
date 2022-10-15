import 'package:my_app/Projects/EagleDel-1/Specifications/Product%20Specifications/DesignProduct.dart';
import 'package:my_app/Projects/EagleDel-1/Specifications/Product%20Specifications/OrderProduct.dart';

class ProductLists {

  final propellers = OrderedProduct("APC 13x4.7SF",
      "https://www.apcprop.com/product/13x4-7sf/", 
      4, 
      21.0, 
      OrderProgress.None);

  final motors = OrderedProduct(
      "Sunny Sky V4008",
      "https://sunnyskyusa.com/products/sunnysky-v4008-motors",
      4,
      59.0,
      OrderProgress.None);

  final batteries = OrderedProduct(
      "Turnigy 20000mAh",
      "https://hobbyking.com/en_us/turnigy-high-capacity-battery-20000mah-4s-12c-drone-lipo-pack-xt90.html?queryID=4f638025f5b905c60b9fa50ae1e8c652&objectID=78415&indexName=hbk_live_products_analytics",
      2,
      142.0,
      OrderProgress.None);

  final ESC = OrderedProduct(
      "Tekko32 F4 45A",
      "https://hobbyking.com/en_us/turnigy-high-capacity-battery-20000mah-4s-12c-drone-lipo-pack-xt90.html?queryID=4f638025f5b905c60b9fa50ae1e8c652&objectID=78415&indexName=hbk_live_products_analytics",
      2,
      69,
      OrderProgress.None);

  final FC = OrderedProduct(
      "HolyBro Pixhawk 4",
      "https://www.dronecosmo.com/products/holybro-pixhawk-4-autopilot-neo-m8n-gps-pm02-combo?currency=USD&variant=34424690245797&utm_medium=cpc&utm_source=google&utm_campaign=Google%20Shopping",
      1,
      209,
      OrderProgress.None);

  final TXRX = OrderedProduct(
      "FLYSKY FS-i6X|FS-iA10B",
      "https://www.amazon.com/Transmitter-Controller-Receiver-Helicopter-Quadcopter/dp/B07Z9YNP7S/ref=sr_1_1_sspa?crid=2S4686CLYDRXL&keywords=RC+transmitter&qid=1656097816&sprefix=rc+transmitter%2Caps%2C98&sr=8-1-spons&psc=1&smid=A27Y3358ST3KOY&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzNTg5RTQ4S0Q5RDZTJmVuY3J5cHRlZElkPUEwNTQ5ODI3MkNaNkwxRFlWNzVJViZlbmNyeXB0ZWRBZElkPUEwMjYyNzAxMzBOTks4R0RBVzBLViZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=",
      1,
      70.0,
      OrderProgress.None);

  final Telemetry = OrderedProduct(
      "Sik Radio V3",
      "https://shop.holybro.com/sik-telemetry-radio-v3_p1103.html",
      1,
      56.0,
      OrderProgress.None);

  final Sensor = OrderedProduct(
      "Digital Air Speed Sonsor",
      "https://shop.holybro.com/digital-air-speed-sensor_p1029.html",
      1,
      55.0,
      OrderProgress.None);

  final frame = DesignProduct(
      "EagleDel-1 Frame",
      "None",
      1,
      0.0,
      DesignProgress.Manufacture);
  
  final carrier = DesignProduct(
      "EagleDel-1 Carrier",
      "None",
      1,
      0.0,
      DesignProgress.Design);


  

  late final List myProductList;

  ProductLists() {
    myProductList = <dynamic> [
      propellers,
      motors,
      batteries,
      ESC,
      FC,
      TXRX,
      Telemetry,
      Sensor,
      frame,
      carrier,
    ];
  }
}