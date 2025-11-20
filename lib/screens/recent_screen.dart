import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/components/components.dart';
import 'package:nft/constants/dummy_data.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DummyData.recentCollectionsTitle,
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
              Text(
                DummyData.seeAllText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Expanded(
            child: ListView.separated(
              itemCount: DummyData.nftCollections.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final collection = DummyData.nftCollections[index];
                return CollectionCard(collection: collection);
              },
            ),
          ),
        ],
      ),
    );
  }
}
