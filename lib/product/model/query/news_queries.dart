enum NewsQueries { q, apiKey, pageSize, page }

// TODO : This enum should be optimized, it's working now but unnecessary processing is done in the algorithm
extension NewsQueriesExtention on NewsQueries {
  MapEntry<String, String> toMapEntry({
    String? q,
    String? apiKey,
    int? pageSize,
    int? page,
  }) {
    switch (this) {
      case NewsQueries.q:
        return MapEntry("q", q!);
      case NewsQueries.apiKey:
        return MapEntry("apiKey", apiKey!);
      case NewsQueries.pageSize:
        return MapEntry("pageSize", '$pageSize');
      case NewsQueries.page:
        return MapEntry("page", '$page');
    }
  }
}
