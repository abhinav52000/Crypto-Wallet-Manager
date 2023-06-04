import 'package:connectmywallet/network/data_providers/api_client.dart';
import 'package:connectmywallet/network/data_providers/auth_data_provider.dart';
import 'package:connectmywallet/network/data_providers/http_request_executor.dart';
import 'package:connectmywallet/network/data_providers/main_flow_data_provider.dart';
import 'package:connectmywallet/network/data_providers/network_client.dart';
import 'package:connectmywallet/network/data_providers/server_data_provider.dart';
import 'package:connectmywallet/network/repository/main_flow_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final diInstance = GetIt.instance;

Future<void> init() async {
  diInstance.registerLazySingleton<Client>(() => Client());
  diInstance.registerLazySingleton<NetworkClient>(
      () => HTTPRequestExecutor(client: diInstance.call()));
  diInstance.registerLazySingleton<ServerDataProvider>(
      () => APIClient(networkClient: diInstance.call()));
  diInstance.registerLazySingleton<AuthFlowDataProvider>(
      () => AuthFlowDataProvider(networkClient: diInstance.call()));
  diInstance.registerLazySingleton<MainFlowDataProvider>(
      () => MainFlowDataProvider(networkClient: diInstance.call()));
  diInstance.registerLazySingleton<MainFlowRepository>(
      () => MainFlowRepository(dataProvider: diInstance.call()));
}
