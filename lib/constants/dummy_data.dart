import 'package:flutter/material.dart';
import 'package:nft/models/nft_collection.dart';
import 'package:nft/resources/resources.dart';

class DummyData {
  DummyData._();

  static const String recentCollectionsTitle = 'Recent Collections';
  static const String seeAllText = 'See all';
  static const String remainingTimeLabel = 'Remaining time';
  static const String currentPriceLabel = 'Current Price';

  static List<NftCollection> get nftCollections => [
    NftCollection(
      id: '1',
      name: 'Hedgie #4103',
      creator: 'by dydxofficial',
      imageAsset: Assets.h1,
      remainingTime: '23h: 12m: 34s',
      currentPrice: '0.288 ETH',
      backgroundColor: Colors.grey[800]!,
      isFavorite: false,
    ),
    NftCollection(
      id: '2',
      name: 'Hedgie #4104',
      creator: 'by dydxofficial',
      imageAsset: Assets.h2,
      remainingTime: '18h: 45m: 12s',
      currentPrice: '0.350 ETH',
      backgroundColor: const Color(0xFFD9AC5F),
      isFavorite: true,
    ),
    NftCollection(
      id: '3',
      name: 'Hedgie #4105',
      creator: 'by dydxofficial',
      imageAsset: Assets.h3,
      remainingTime: '12h: 30m: 50s',
      currentPrice: '0.420 ETH',
      backgroundColor: const Color(0xFF475791),
      isFavorite: false,
    ),
  ];
}
