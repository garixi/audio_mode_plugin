import 'package:flutter_test/flutter_test.dart';
import 'package:audio_mode_plugin/audio_mode_plugin.dart';
import 'package:audio_mode_plugin/audio_mode_plugin_platform_interface.dart';
import 'package:audio_mode_plugin/audio_mode_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudioModePluginPlatform
    with MockPlatformInterfaceMixin
    implements AudioModePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudioModePluginPlatform initialPlatform = AudioModePluginPlatform.instance;

  test('$MethodChannelAudioModePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudioModePlugin>());
  });

  test('getPlatformVersion', () async {
    AudioModePlugin audioModePlugin = AudioModePlugin();
    MockAudioModePluginPlatform fakePlatform = MockAudioModePluginPlatform();
    AudioModePluginPlatform.instance = fakePlatform;

    expect(await audioModePlugin.getPlatformVersion(), '42');
  });
}
