import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/app/screens/home/widgets/home_header.dart';
import 'package:flwora/features/app/screens/home/widgets/sector_device_view.dart';
import 'package:flwora/utils/local_storage/data_storage/device_storage.dart';
import 'package:flwora/utils/local_storage/data_storage/sector_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SectorStorage.instance.stream,
      builder: (_, sector) {
        final sectors = sector.data ?? [];

        return DefaultTabController(
          length: sectors.length,
          child: TScaffold(
            onRefresh: () async {},
            appbar: HomeHeader(sectors: sectors),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: sectors
                    .map(
                      (s) => StreamBuilder(
                        stream: DeviceStorage.instance.stream,
                        builder: (_, device) {
                          final devices = (device.data ?? [])
                              .where((d) => d.sectorId == s.id)
                              .toList();

                          return SectorDeviceView(devices: devices);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
