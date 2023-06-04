class NetworkEnvironmentManager {
  static final NetworkEnvironmentManager _instance =
      NetworkEnvironmentManager._internal();
  NetworkEnvironmentManager._internal();

  factory NetworkEnvironmentManager() {
    return _instance;
  }

  /// Baseurl
  String get baseUrl => 'https://api.etherscan.io/api/';

  String get apiKey => 'M9BCS7I995N7BR64WHJZJXGH6VIMJP1Y52';
}
