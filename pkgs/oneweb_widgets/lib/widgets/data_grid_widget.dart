import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OWDataGridWidget extends StatefulWidget {
  final Color? headerColor;
  final ColumnWidthMode columnWidthMode;
  final bool isLoadMoreView;
  final List<GridColumn> headerColumn;
  final DataGridSource dataSource;

  final bool allowSorting;
  final bool allowPullToRefresh;
  final bool allowSwiping;
  final bool allowFiltering;

  const OWDataGridWidget({
    Key? key,
    this.headerColor,
    required this.columnWidthMode,
    this.isLoadMoreView = false,
    required this.headerColumn,
    required this.dataSource,
    this.allowSorting = false,
    this.allowPullToRefresh = false,
    this.allowSwiping = false,
    this.allowFiltering = false,
    allowTextfield
  }) : super(key: key);

  @override
  OWDataGridWidgetState createState() => OWDataGridWidgetState();
}

class OWDataGridWidgetState extends State<OWDataGridWidget> {
  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(headerColor: widget.headerColor),
      child: SfDataGrid(
        source: widget.dataSource,
        columnWidthMode: widget.columnWidthMode,
        loadMoreViewBuilder: widget.isLoadMoreView
            ? (BuildContext context, LoadMoreRows loadMoreRows) {
                Future<String> loadRows() async {
                  await loadMoreRows();
                  return Future<String>.value('Completed');
                }

                return FutureBuilder<String>(
                  initialData: 'loading',
                  future: loadRows(),
                  builder: (context, snapShot) {
                    if (snapShot.data == 'loading') {
                      return Container(
                          height: 60.0,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              border: BorderDirectional(
                                  top: BorderSide(
                                      width: 1.0,
                                      color: Color.fromRGBO(0, 0, 0, 0.26)))),
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator());
                    } else {
                      return SizedBox.fromSize(size: Size.zero);
                    }
                  },
                );
              }
            : null,
        allowSorting: widget.allowSorting,
        allowPullToRefresh: widget.allowPullToRefresh,
        allowSwiping: widget.allowSwiping,
        allowFiltering: widget.allowFiltering,
        columns: widget.headerColumn,
      ),
    );
  }
}
