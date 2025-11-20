import 'package:flutter/material.dart';

class NftCollection {
  final String id;
  final String name;
  final String creator;
  final String imageAsset;
  final String remainingTime;
  final String currentPrice;
  final bool isFavorite;
  final Color backgroundColor;

  NftCollection({
    required this.id,
    required this.name,
    required this.creator,
    required this.imageAsset,
    required this.remainingTime,
    required this.currentPrice,
    required this.backgroundColor,
    this.isFavorite = false,
  });
}
