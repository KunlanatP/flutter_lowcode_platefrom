import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:render_engine/widget/icons.dart';

final List<IconTemplate> listMaterialIcons = MdiIcons.getNames()
    .map(
      (icon) => IconTemplate(
        name: icon,
        iconRegular: MdiIcons.fromString(icon) ?? MdiIcons.bedEmpty,
      ),
    )
    .toList();
