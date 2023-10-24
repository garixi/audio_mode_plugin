import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:audio_mode_plugin/audio_mode_plugin_method_channel.dart';

void main() {
  MethodChannelAudioModePlugin platform = MethodChannelAudioModePlugin();
  const MethodChannel channel = MethodChannel('audio_mode_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
