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
    name: "Kathmandu Paper Recycling Factory",
    phone: 014356369,
    address: " Thankot, Kathmandu",
    description:
        "Recycled paper and cardboard are products possessing unique ecycling properties. Kathmandu Recycling factory has been engineering recycling installations for this industry with high throughput and extremely high purity rates with minimal loss of quality during the process. Recycling this material offers both economic and environmental sustainability.",
    tags: ["Paper", "Cardboard"],
    locationCoords: LatLng(27.761187, 85.333677),
  ),
  Factories(
    name: "Rubber recycling industry",
    phone: 01123456,
    address: "Chakrapat, kathmandu",
    description:
        "The first step is the collection of rubber products that you intend to recycle. In most cases, this is usually in the form of a tire, the major rubber product. In some cases, these materials come from landfills. In some other cases, people deposit it and send it to the recycling center.",
    tags: ["Rubber"],
    locationCoords: LatLng(27.7400086, 85.3284219),
  ),
  Factories(
    name: "Textile Recycling Factory",
    phone: 014568726,
    address: "Koteshwor, Kathmandu",
    description:
        "Clothing recycling is part of textile recycling. It involves recovering old clothing and shoes for sorting and processing. End products include clothing suitable for reuse, cloth scraps or rags as well as fibrous material. Interest in garment recycling is rapidly on the rise due to environmental awareness and landfill pressure. ",
    tags: ["Clothes", "Cotton"],
    locationCoords: LatLng(27.74216, 85.3560649),
  ),
  Factories(
    name: "Roadside Farm",
    phone: 01461234,
    address: "Tinkune, kathmandu",
    tags: ["Oragnic materials"],
    description:
        "Organic by­products, or wastes, of the livestock industry include a variety of materials such as solid and liquid animal manures, used bedding, spilled feed, and a variety of other substances. Most livestock­associated organic by­products are animal manures.",
    locationCoords: LatLng(27.740249, 85.6283634),
  ),
];
