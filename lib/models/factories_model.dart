import 'package:google_maps_flutter/google_maps_flutter.dart';

class Factories {
  String name;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;
  int phone;
  List tags;

  Factories(
      {this.name,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords,
      this.phone,
      this.tags});
}

final List<Factories> factories = [
  Factories(
      name: "Metal Scrap Recycling Industry",
      phone: 017894561,
      address: "Naxal, Kathmandu",
      description:
          "Metals are valuable materials that can be recycled again and again without degrading their properties. Scrap metal has value, which motivates people to collect it for sale to recycling operations.",
      tags: ["Iron", "Steel"],
      locationCoords: LatLng(27.7152, 85.3260)),
  Factories(
    name: "Glass Production Factory",
    phone: 014356833,
    address: "Tangal, Kathmandu",
    description:
        "The goal of a future‐proof materials cycle is for all the raw materials to be brought back into the production process after the individual product has reached the end of its lifecycle. We have been pursuing this goal since the 1970s. That was when we became the first company in Switzerland to set up a recycling system for used glass.",
    tags: ["Glass"],
    locationCoords: LatLng(27.7189, 85.3299),
  ),
  Factories(
    name: "Battery recycling factory",
    phone: 014236789,
    address: "Jorpati, Gyaneshwor",
    description:
        "Since the batteries are used in a huge number, recycling is quite important. One of the benefits of lead–acid batteries (despite its low energy content) is its recycling capability. About 90% of a lead–acid battery can be recycled and reused for making new batteries. In contrast, Ni–Cd and lithium­based batteries are not very efficient in recycling",
    tags: ["Battery"],
    locationCoords: LatLng(27.7129, 85.3678),
  ),
  Factories(
    name: "Plastic Recycling factory",
    phone: 01789123,
    address: "Boudha, Kathmandu",
    description:
        "Plastic recycling is the process of recovering scrap or waste plastic and reprocessing the material into useful products. Due to purposefully misleading symbols on plastic packaging and numerous technical hurdles, less than 10% of plastic has ever been recycled.",
    tags: ["Plastic"],
    locationCoords: LatLng(27.71974, 85.36146),
  )
];
