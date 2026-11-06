import '../../route_definition.dart';
import 'auth_guard.dart';

class AppGuards {
  static final authenticated = [AuthGuard()];
  static final orders = [AuthGuard()];
  static final templates = [AuthGuard()];
  static final invoices = [AuthGuard()];
}
