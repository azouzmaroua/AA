import 'package:audioplayers/audioplayers.dart';

//==============================================================================

activeWidget() {
  AudioPlayer().play(AssetSource('audio/ActiveWidget.mp3'));
}

//==============================================================================

deactivateWidget() {
  AudioPlayer().play(AssetSource('audio/DeactivateWidget.mp3'));
}

//==============================================================================

notification1() {
  AudioPlayer().play(AssetSource('audio/Notification1.mp3'));
}

//==============================================================================

notification2() {
  AudioPlayer().play(AssetSource('audio/notification2.mp3'));
}

//==============================================================================

tapButton1() {
  AudioPlayer().play(AssetSource('audio/TapButton1.mp3'));
}

//==============================================================================
tapButton2() {
  AudioPlayer().play(AssetSource('audio/tapButton2.mp3'));
}

//==============================================================================