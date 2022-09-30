import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImp(this.connectionChecker);

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

class NetworkInfoImp2 implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImp2(this.connectionChecker);

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;
}