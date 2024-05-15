package com.example.fic16_absensi

import io.flutter.embedding.android.FlutterActivity
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.os.Bundle
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "mockLocation"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "isMockLocationEnabled") {
                result.success(isMockLocationEnabled())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun isMockLocationEnabled(): Boolean {
        var isMockLocation = false
        try {
            val pm: PackageManager = packageManager
            val packages: List<ApplicationInfo> = pm.getInstalledApplications(PackageManager.GET_META_DATA)
            for (applicationInfo in packages) {
                if (applicationInfo.flags and ApplicationInfo.FLAG_SYSTEM == 0) {
                    if (applicationInfo.packageName.contains("fakegps") ||
                        applicationInfo.packageName.contains("mocklocations")) {
                        isMockLocation = true
                        break
                    }
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return isMockLocation
    }
}
