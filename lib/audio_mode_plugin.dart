import 'audio_mode_plugin_platform_interface.dart';

class AudioModePlugin {
  Future<String?> getPlatformVersion() {
    return AudioModePluginPlatform.instance.getPlatformVersion();
  }

  Future<void> setAudioModeToEarpiece() {
    return AudioModePluginPlatform.instance.setAudioModeToEarpiece();
  }

  Future<void> setAudioModeToSpeaker() {
    return AudioModePluginPlatform.instance.setAudioModeToSpeaker();
  }

  Future<void> configureAVAudioSession() {
    return AudioModePluginPlatform.instance.configureAVAudioSession();
  }
}
