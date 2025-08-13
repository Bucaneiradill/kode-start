import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_start_rickandmorty/theme/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({required this.item, required this.onTap, super.key});

  final dynamic item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.image ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey,
                height: 180,
                child: const Center(child: Icon(Icons.error)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                item.name.toUpperCase(),
                style: GoogleFonts.lato(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
