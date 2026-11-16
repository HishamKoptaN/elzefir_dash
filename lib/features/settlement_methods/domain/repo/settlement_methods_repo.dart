import '../../domain/entities/settlement_method_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/models/error_info.dart';

abstract class SettlementMethodsRepo {
  Future<Either<ErrorInfo, List<SettlementMethodEntity>>> getSettlementMethods();
}
