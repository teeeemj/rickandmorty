import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky/config/network/dio_settings.dart';
import 'package:ricky/config/routing/app_routing.dart';
import 'package:ricky/data/repositories/charachter_repo.dart';
import 'package:ricky/presentation/blocs/charachter_bloc/charachter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => CarachterRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharachterBloc(
              repository: RepositoryProvider.of<CarachterRepository>(context),
            )..add(
                CharachterLoadEvent(),
              ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
