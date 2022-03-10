import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/infrastructure/api/api.dart';
import '../../core/infrastructure/database/database.dart';
import '../../core/infrastructure/headers_local_service.dart';
import '../../core/infrastructure/pagination_config.dart';
import '../../core/providers/provider.dart';
import '../infrastructure/starred_local_service.dart';
import '../infrastructure/starred_remote_service.dart';
import '../infrastructure/starred_repository.dart';

final paginationConfigProvider = Provider<PaginationConfig>((ref) {
  return const PaginationConfig();
});
final apiStoreProvider = Provider<GitlabApi>((ref) {
  return const GitlabApi();
});

final headerDatabaseProvider = Provider<DataBase>((ref) {
  return DataBase.stringStore(
    ref.watch(sembastProvider),
    'headers',
  );
});

final reposDatabseProvider = Provider<DataBase>((ref) {
  return DataBase.integerStore(
    ref.watch(sembastProvider),
    'starredRepos',
  );
});

final headersLocalServiceProvider = Provider<HeadersLocalService>((ref) {
  return HeadersLocalService(ref.watch(headerDatabaseProvider));
});

final localServiceProvider = Provider<StarredLocalService>((ref) {
  return StarredLocalService(
    ref.watch(reposDatabseProvider),
    ref.watch(paginationConfigProvider),
  );
});

final remoteServiceProvider = Provider<StarredRemoteService>((ref) {
  return StarredRemoteService(
    ref.watch(dioForStarredProvider),
    ref.watch(paginationConfigProvider),
  );
});

final starredRepositoryProvider = Provider<StarredRepository>((ref) {
  return StarredRepository(
    apiStore: ref.watch(apiStoreProvider),
    headersLocalService: ref.watch(headersLocalServiceProvider),
    localService: ref.watch(localServiceProvider),
    remoteService: ref.watch(remoteServiceProvider),
  );
});
