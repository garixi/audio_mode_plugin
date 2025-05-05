package com.softfobia.audio_mode_plugin


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