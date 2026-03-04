import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/di/injectable.dart';
import 'package:quran_app/core/utilities/app_images.dart';
import 'package:quran_app/core/utilities/colors.dart';
import 'package:quran_app/core/widget/loading.dart';
import 'package:quran_app/core/widget/surah_card.dart';

import 'package:quran_app/home/presentation/view_model/quran_cubit.dart';
import 'package:quran_app/home/presentation/view_model/quran_states.dart';

class Surah extends StatefulWidget {
  const Surah({super.key});

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  late final QuranCubit cubit;
  @override
  void initState() {
    cubit = getIt<QuranCubit>();
    cubit.fetchQuran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppImages.background, fit: BoxFit.fill),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<QuranCubit, QuranStates>(
              bloc: cubit,
              builder: (context, state) {
                if (state is QuranLoadingState) {
                  return Center(child: Loading());
                } else if (state is QuranSuccsessState) {
                  final surahs = state.dataEntity.surahs;

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return SurahCard(
                        name: surahs[index].name,
                        ayaNumber: surahs[index].ayahs.length,
                        type: surahs[index].revelationType,
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(color: AppColors.splash),
                    itemCount: surahs.length,
                  );
                } else if (state is QuranErrorState) {
                  return Text(state.error);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ],
    );
  }
}
