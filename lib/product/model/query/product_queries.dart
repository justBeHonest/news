enum ProductQueries { limit }

extension ProductQueriesExtention on ProductQueries {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case ProductQueries.limit:
        return MapEntry("limit", value);
    }
  }
}
