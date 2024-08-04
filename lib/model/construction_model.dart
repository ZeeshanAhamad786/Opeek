import 'package:get/get.dart';

class ConstructionModel {
  final String imageUrl;
  final String name;
  final String construction;
  final String dollar;
  final String location;
  late RxBool isFavorite;

  ConstructionModel({
    required this.imageUrl,
    required this.name,
    required this.construction,
    required this.dollar,
    required this.location,
    bool isFavorite = false,
  }) {
    this.isFavorite = isFavorite.obs;
  }
}
