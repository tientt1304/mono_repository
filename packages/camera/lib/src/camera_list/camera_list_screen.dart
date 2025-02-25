// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:camera/src/common/di/camera_injectable.config.dart';
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import './viewmodels/camera_list_viewmodel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage(name: 'cameraList')
class CameraListScreen extends StatefulWidget {
  const CameraListScreen({super.key});

  @override
  State<CameraListScreen> createState() => _CameraListScreenState();
}

class _CameraListScreenState extends State<CameraListScreen>
    with LifecycleOwner<CameraListScreen, CameraListViewModel>, ObserverMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // screen body
        Scaffold(
          appBar: BaseAppBar(title: 'camera_list'.tr()),
          body: SafeArea(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 200,
                width: 200,
                color: Colors.green[100],
                child: Center(
                  child: Text('Camera List Screen'),
                ),
              ),
            ),
          ),
        ),

        // full-screen loader
        LiveDataFullScreenLoader(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  DiScope get diScope => DiScope(
        name: 'cameraList',
        factory: getIt.initCameraListScope,
        dependencies: [],
      );
}
