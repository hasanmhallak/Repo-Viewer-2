import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/infrastructure/api/api.dart';
import '../../core/infrastructure/database/database.dart';
import '../../core/infrastructure/headers_local_service.dart';
import '../../core/infrastructure/pagination_config.dart';
import '../../core/providers/provider.dart';
import '../domain/starred_repository.dart';
import '../infrastructure/starred_local_service.dart';
import '../infrastructure/starred_remote_service.dart';

final starredRepositoryProvider = Provider<StarredRepository>((ref) {
  const _config = PaginationConfig();
  const apiStore = GitlabApi(_config);
  final headersDatabase = DataBase.stringStore(
    ref.watch(sembastProvider),
    'headers',
  );
  final reposDatabase = DataBase.integerStore(
    ref.watch(sembastProvider),
    'starredRepos',
  );
  final headersLocalService = HeadersLocalService(headersDatabase);
  final localService = StarredLocalService(reposDatabase, _config);
  final dio = ref.watch(dioForStarredProvider);
  final remoteService = StarredRemoteService(dio, _config);

  return StarredRepository(
    apiStore: apiStore,
    headersLocalService: headersLocalService,
    localService: localService,
    remoteService: remoteService,
  );
});
