List<T> mapToList<T>(List data, T Function(Map<String, dynamic>) factory) =>
    data.map((e) => factory(e)).toList();
