// Json Helper
class JsonHelper {
  static List<T> parseList<T>(
    List data,
    T Function(Map<String, dynamic>) fromJson,
  ) => data.map((e) => fromJson(e)).toList();
}
