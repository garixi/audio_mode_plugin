import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_mode_plugin_method_channel.dart';

abstract class AudioModePluginPlatform extends PlatformInterface {
  /// Constructs a AudioModePluginPlatform.
  AudioModePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudioModePluginPlatform _instance = MethodChannelAudioModePlugin();

  /// The default instance of [AudioModePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudioModePlugin].
  static AudioModePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioModePluginPlatform] when
  /// they register themselves.
  static set instance(AudioModePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> setAudioModeToSpeaker() {
    throw UnimplementedError(
        'setAudioModeToSpeaker() has not been implemented.');
  }

  Future<void> setAudioModeToEarpiece() {
    throw UnimplementedError(
        'setAudioModeToEarpiece() has not been implemented.');
  }

  Future<void> configureAVAudioSession() {
    throw UnimplementedError(
        'setAudioModeToEarpiece() has not been implemented.');
  }
}
