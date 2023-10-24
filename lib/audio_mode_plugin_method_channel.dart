import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audio_mode_plugin_platform_interface.dart';

/// An implementation of [AudioModePluginPlatform] that uses method channels.
class MethodChannelAudioModePlugin extends AudioModePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audio_mode_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> setAudioModeToSpeaker() async {
    try {
      await methodChannel.invokeMethod('setAudioModeToSpeaker');
    } catch (e) {
      throw 'Error invoking setAudioModeToSpeaker: $e';
    }
  }

  Future<void> setAudioModeToEarpiece() async {
    try {
      await methodChannel.invokeMethod('setAudioModeToEarpiece');
    } catch (e) {
      throw 'Error invoking setAudioModeToEarpiece: $e';
    }
  }

  Future<void> configureAVAudioSession() async {
    try {
      await methodChannel.invokeMethod('configureAVAudioSession');
    } catch (e) {
      throw 'Error invoking configureAVAudioSession: $e';
    }
  }
}
