import 'package:dio/dio.dart';
import 'package:ricky/data/models/charachter_model.dart';

class CarachterRepository {
  final Dio dio;

  CarachterRepository({required this.dio});

  Future<CharachterModel> getCharachters() async {
    final Response response =
        await dio.get('https://rickandmortyapi.com/api/character');
    return CharachterModel.fromJson(response.data);
  }
}
