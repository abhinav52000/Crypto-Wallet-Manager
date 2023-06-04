import 'auth_data_provider.dart';
import 'main_flow_data_provider.dart';

abstract class ServerDataProvider{
  AuthFlowDataProvider get authAPIDataProvider;
  MainFlowDataProvider get mainAPIDataProvider;
}

