import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../domain/entities/settlement_method_entity.dart';
import '../../domain/repo/settlement_methods_repo.dart';
import '../data_sources/settlement_methods_data_src.dart';
import '../mapper/settlement_method_mapper.dart';

@LazySingleton(as: SettlementMethodsRepo)
class SettlementMethodsRepoImpl implements SettlementMethodsRepo {
  final SettlementMethodsDataSource _dataSource;

  SettlementMethodsRepoImpl(this._dataSource);

  @override
  Future<Either<ErrorInfo, List<SettlementMethodEntity>>> getSettlementMethods() async {
    try {
      final models = await _dataSource.getSettlementMethods();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ErrorInfo(message: e.toString()));
    }
  }
}
