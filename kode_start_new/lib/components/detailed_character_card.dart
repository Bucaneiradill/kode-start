import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_start_rickandmorty/provider/character_view_model.dart';
import 'package:kode_start_rickandmorty/theme/app_colors.dart';
import 'package:kode_start_rickandmorty/theme/app_images.dart';

class DetailedCardWidget extends ConsumerWidget {
  final int? characterId;
  final bool profile;

  const DetailedCardWidget(
      {super.key, required this.characterId, this.profile = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterAsync = ref.watch(characterDetailsProvider(characterId!));

    return profile
        ? Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.4,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Card(
              color: AppColors.primaryColorLight,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.heloisa,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12, left: 16, right: 16, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Heloisa Oliveira".toUpperCase(),
                          style: GoogleFonts.lato(
                            color: AppColors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 14.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                            ),
                            Text(
                              'Engenharia de Software - PUC Minas',
                              style: GoogleFonts.lato(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Interesses:\n',
                                style: GoogleFonts.lato(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Atuar como estagiária em desenvolveimento Mobile na Kobe. Aprender a trabalhar em uma equipe com processos e métodos bem estruturados. Evoluir minhas habilidades técnicas e interpessoais. Contribuir para projetos desafiadores e inovadores.',
                                style: GoogleFonts.lato(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Contatos:\n',
                                style: GoogleFonts.lato(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'LinkedIn: https://www.linkedin.com/in/oliveira-heloisa/\nGitHub: https://github.com/Bucaneiradill',
                                style: GoogleFonts.lato(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : characterAsync.when(
            data: (detailedCharacter) {
              return Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.4,
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: Card(
                  color: AppColors.primaryColorLight,
                  clipBehavior: Clip.antiAlias,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        detailedCharacter.image,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 16, right: 16, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailedCharacter.name.toUpperCase(),
                              style: GoogleFonts.lato(
                                color: AppColors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                Icon(Icons.circle,
                                    color:
                                        detailedCharacter.status == 'Alive' ||
                                                profile
                                            ? Colors.green
                                            : Colors.red),
                                Text(
                                  '${detailedCharacter.status} - ${detailedCharacter.species}',
                                  style: GoogleFonts.lato(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Last known location:\n',
                                    style: GoogleFonts.lato(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: detailedCharacter.location.name,
                                    style: GoogleFonts.lato(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'First seen in:\n',
                                    style: GoogleFonts.lato(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: detailedCharacter.origin.name,
                                    style: GoogleFonts.lato(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            error: (error, stack) => Center(
              child: Text(
                'Error: $error',
                style: TextStyle(color: AppColors.white),
              ),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            ),
          );
  }
}
