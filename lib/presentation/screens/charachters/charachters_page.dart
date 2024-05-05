import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky/config/theme/app_colors.dart';
import 'package:ricky/config/theme/app_fonts.dart';
import 'package:ricky/presentation/blocs/charachter_bloc/charachter_bloc.dart';

class CharachtersPage extends StatelessWidget {
  const CharachtersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bGColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 54),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.txtFieldColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 24,
                      color: AppColors.txtFieldHintColor,
                    ),
                  ),
                ),
                hintText: 'Найти персонажа',
                hintStyle: AppFonts.s16w400
                    .copyWith(color: AppColors.txtFieldHintColor),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: AppColors.txtFieldHintColor,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(
                    width: 0,
                    color: AppColors.bGColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(
                    width: 0,
                    color: AppColors.bGColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ВСЕГО ПЕРСОНАЖЕЙ: 200',
                  style: AppFonts.s10w500.copyWith(
                    color: AppColors.txtFieldHintColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.list,
                    color: AppColors.txtFieldHintColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BlocBuilder<CharachterBloc, CharachterState>(
              builder: (context, state) {
                if (state is CharachterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CharachterSucces) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                state.charachter.results?.first.image ?? '',
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              state.charachter.results?.first.status ?? '',
                              style: AppFonts.s10w500.copyWith(
                                color: AppColors.selectedItemColor,
                              ),
                            ),
                            Text(
                              state.charachter.results?.first.name ?? '',
                              style: AppFonts.s10w500.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.charachter.results?.first.species}, " ??
                                      '',
                                  style: AppFonts.s10w500.copyWith(
                                    color: AppColors.txtFieldHintColor,
                                  ),
                                ),
                                Text(
                                  state.charachter.results?.first.gender ?? '',
                                  style: AppFonts.s10w500.copyWith(
                                    color: AppColors.txtFieldHintColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
