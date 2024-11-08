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
        return _buildAppList(context, ref, apps.data);
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
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.2,
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) => OWOnClick(
          onTap: () {
            ref.read(appController).fetchAppByID(apps[index].id!);
            onAppSelected?.call(apps[index].id!);
          },
          child: AppCard(app: apps[index]),
        ),
      ),
    );
  }
}
