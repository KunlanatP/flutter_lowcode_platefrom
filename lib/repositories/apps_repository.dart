import 'package:dio/dio.dart';
import 'package:flutter_lowcode_plateform/models/application/apps_model.dart';
import 'package:flutter_lowcode_plateform/models/pageable_with_search.dart';
import 'package:flutter_lowcode_plateform/models/status_model.dart';
import 'package:retrofit/retrofit.dart';

part 'apps_repository.g.dart';

@RestApi()
abstract class AppRepository {
  factory AppRepository(Dio dio) = _AppRepository;

  // ******** Application ********
  @GET('/applications')
  Future<Pagination<List<AppModel>>> getApps(
      @Queries() PageableWithSearch search);

  @GET('/applications/{id}')
  Future<AppModel> getAppById(@Path('id') String id);

  @POST('/applications')
  Future<AppModel> createApplication(@Body() AppModel model);

  @DELETE('/applications/{id}')
  Future<StatusModel> deleteAppById(@Path('id') String id);

  @PATCH('/applications/{id}')
  Future<AppModel> updateAppById(@Path('id') String id, @Body() AppModel model);
}
