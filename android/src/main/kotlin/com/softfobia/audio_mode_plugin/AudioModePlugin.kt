package com.softfobia.audio_mode_plugin


//import android.content.Context
//import android.media.AudioManager
//import androidx.annotation.NonNull
//import io.flutter.embedding.engine.plugins.FlutterPlugin
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//
//class AudioModePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
//    private lateinit var context: Context
//    private lateinit var channel: MethodChannel
//    private lateinit var audioManager: AudioManager
//
//    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//        context = flutterPluginBinding.applicationContext
//        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audio_mode_plugin")
//        channel.setMethodCallHandler(this)
//        audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
//    }
//
//    companion object {
//        @JvmStatic
//        fun registerWith(registrar: io.flutter.plugin.common.PluginRegistry.Registrar) {
//            val channel = MethodChannel(registrar.messenger(), "audio_mode_plugin")
//            val plugin = AudioModePlugin()
//            plugin.context = registrar.context()
//            plugin.audioManager = registrar.context().getSystemService(Context.AUDIO_SERVICE) as AudioManager
//            channel.setMethodCallHandler(plugin)
//        }
//    }
//
//    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
//        when (call.method) {
//            "setAudioModeToSpeaker" -> {
//                audioManager.isSpeakerphoneOn = true
//                result.success(null)
//            }
//            "setAudioModeToEarpiece" -> {
//                audioManager.isSpeakerphoneOn = false
//                result.success(null)
//            }
//            else -> result.notImplemented()
//        }
//    }
//
//    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
//        channel.setMethodCallHandler(null)
//    }
//}

import android.content.Context
import android.media.AudioManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AudioModePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var context: Context
    private lateinit var channel: MethodChannel
    private lateinit var audioManager: AudioManager

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audio_mode_plugin")
        channel.setMethodCallHandler(this)
        audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    }
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setAudioModeToSpeaker" -> {
                audioManager.isSpeakerphoneOn = true
                result.success(null)
            }
            "setAudioModeToEarpiece" -> {
                audioManager.isSpeakerphoneOn = false
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}