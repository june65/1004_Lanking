import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Banners extends StatelessWidget {
  final String image;
  final String link;

  const Banners({
    super.key,
    required this.image,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrlString(link);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
