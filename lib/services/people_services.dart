part of 'services.dart';

class PeopleServices {
  Dio _dio;

  PeopleServices() {
    _dio = Dio();
  }

  Future<List<People>> getPeople() async {
    try {
      Response response = await _dio.get(baseUrl);

      return (response.data['results'] as Iterable)
          .map((e) => People.fromJson(e))
          .toList();
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<People> getDetailPeople() async {
        try {
      Response response = await _dio.get(baseUrl);
      var result = response.data['results'];

      return result;
    } on DioError catch (e) {
      print(e);
    }
  }
}