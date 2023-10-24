import Flutter
import UIKit
import AVFoundation


public class AudioModePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "audio_mode_plugin", binaryMessenger: registrar.messenger())
        let instance = AudioModePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setAudioModeToSpeaker":
            setAudioModeToSpeaker()
            result(nil)
        case "setAudioModeToEarpiece":
            setAudioModeToEarpiece()
            result(nil)

        case "configureAVAudioSession":
            configureAVAudioSession();
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func setAudioModeToSpeaker() {
        do {
            print("setAudioModeToSpeaker")
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Failed to set audio mode to speaker: \(error.localizedDescription)")
        }
    }

    private func setAudioModeToEarpiece() {
        do {
            print("setAudioModeToEarpiece ");
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.none)
        } catch {
            print("Failed to set audio mode to earpiece: \(error.localizedDescription)")
        }
    }


    private func configureAVAudioSession() {
        do {
            print("Configure AVAudio session");
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [.duckOthers])
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            try AVAudioSession.sharedInstance().setActive(true)

        } catch {
            print("Failed to configure Audio Session: \(error.localizedDescription)")
        }
    }
}
