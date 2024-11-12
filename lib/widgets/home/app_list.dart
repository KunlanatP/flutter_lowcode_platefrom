import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/models/application/apps_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oneweb_widgets/actions/on_click.dart';

import '../../states/home/app_state.dart';
import 'app_card.dart';

class ApplicationList extends ConsumerWidget {
  const ApplicationList({
    super.key,
    this.onAppSelected,
  });

  final ValueChanged<String>? onAppSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apps = ref.watch(appList);

    return apps.when(
      data: (apps) {
        if (apps!.data.isEmpty) {
          return const Center(child: Text('No apps found'));
        }
        return Align(
          alignment: Alignment.topLeft,
          child: _buildAppList(context, ref, apps.data),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error')),
    );
  }

  Padding _buildAppList(
    BuildContext context,
    WidgetRef ref,
    List<AppModel> apps,
  ) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 24,
          runSpacing: 24,
          children: apps
              .map((app) => SizedBox(
                    width: 250,
                    height: 250,
                    child: OWOnClick(
                      onTap: () {
                        ref.read(appController).fetchAppByID(app.id!);
                        onAppSelected?.call(app.id!);
                      },
                      child: AppCard(app: app),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
