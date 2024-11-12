import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/page/page_model.dart';
import '../models/pageable/paging_model.dart';
import '../models/query/query.dart';
import '../models/status_model.dart';

part 'page_repository.g.dart';

@RestApi()
abstract class PageRepository {
  factory PageRepository(Dio dio) = _PageRepository;
  @GET('/pages')
  Future<List<PageModel>?> getPages(@Queries() QueryPaging search);

  @GET('/pages/{id}')
  Future<PageModel> getPageById(
    @Path('id') String? id,
    @Queries() QueryByApp search,
  );

  @POST('/pages')
  Future<PageModel> createPage(@Body() PageModel model);

  @DELETE('/pages/{id}')
  Future<StatusModel> deletePageById(@Path('id') String? id);

  @PATCH('/pages/{id}/home')
  Future<PageModel> setHome(
    @Path('id') String? id,
    @Queries() QueryByApp search,
  );
}
