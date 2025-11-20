import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/screens/recent_screen.dart';

class TabContent extends StatelessWidget {
  final String tabName;

  const TabContent({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    if (tabName == 'Recent') {
      return const RecentScreen();
    }

    return Center(
      child: Text(
        '$tabName NFTs',
        style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
