import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class CameraState {
  final List<CameraDescription> cameras;
  CameraController? cameraController;

  CameraState({required this.cameras, this.cameraController});
  CameraState copyWith({
    List<CameraDescription>? cameras,
    CameraController? cameraController,
  }) {
    return CameraState(cameras: cameras ?? this.cameras, cameraController: cameraController ?? this.cameraController);
  }
}

class CameraNotifier extends Notifier<CameraState> {
  @override
  CameraState build() {
    return CameraState(cameras: [], cameraController: null);
  }
  CameraController? _cameraController;


  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      print(cameras);
      state = state.copyWith(cameras: cameras);
      _cameraController = CameraController(
        state.cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _cameraController?.initialize().then((_) {
        state = state.copyWith(cameraController: _cameraController);
      });
      print('DONEEE');
    }catch(e) {
      print(e);
    }
  }

  void toggleView() {
    if(state.cameras.length > 1) {
      if (state.cameraController!.description.lensDirection ==
          CameraLensDirection.front) {
        _cameraController = CameraController(
            state.cameras.last,
            ResolutionPreset.high,
            enableAudio: false
        );
      } else {
        _cameraController = CameraController(
            state.cameras.first,
            ResolutionPreset.high,
            enableAudio: false
        );
      }
      _cameraController?.initialize().then((_) {
        state = state.copyWith(cameraController: _cameraController);
      });
    }
  }

  void dispose() async  {
    await state.cameraController!.dispose();
    state = CameraState(cameras: []);
    // state = state.copyWith(cameraController: null);
    // state.copyWith(cameraController: _cameraController);
  }

// void _captureImage() async {
//   final picture = await _cameraController!.takePicture();
//   print(picture.path);
// }

}

final cameraProvider = NotifierProvider<CameraNotifier, CameraState>(() {
  return CameraNotifier();
});
