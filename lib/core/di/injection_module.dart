import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../networking/network_info.dart';

@module
abstract class InjectionModule {
  @singleton
  EventBus get eventBus => EventBus();
  @singleton
  InternetConnection get connectionChecker => InternetConnection();
  @singleton
  FirebaseApp get firebaseApp => Firebase.app();
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @singleton
  NetworkInfo networkInfo(NetworkInfoImpl impl) => impl;
  @singleton
  NetworkInfoImpl networkInfoImpl(InternetConnection connectionChecker) =>
      NetworkInfoImpl(connectionChecker: connectionChecker);
}
