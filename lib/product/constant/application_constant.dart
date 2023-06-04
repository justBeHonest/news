class ApplicationConstant {
  static ApplicationConstant? _instance;
  static ApplicationConstant get instane {
    _instance ??= ApplicationConstant._init();
    return _instance!;
  }

  ApplicationConstant._init();

  final String productBaseUrl = 'https://fakestoreapi.com/';
  final String dummyImage = "https://picsum.photos/500/200";
  final String newsBaseUrl = "https://newsapi.org/";
  final String apiKey = "77f4d965a1744dafa6e760b710d61a72";
}

double kZero = 0;
double kOne = 1;
