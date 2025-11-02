import 'dart:io';

/// 16KB Page Size Compatibility Checker for Flutter + Kotlin DSL projects.
/// Run:
///   dart run check_16kb_support.dart
/// Or auto-fix:
///   dart run check_16kb_support.dart --fix
Future<void> main(List<String> args) async {
  print('🔍 Checking 16KB Page Size Compatibility (Kotlin DSL)...\n');

  final bool autoFix = args.contains('--fix');

  // 1️⃣ Check Flutter version
  final flutterVersionOutput = await _runCommand('flutter', ['--version']);
  final flutterMatch = RegExp(
    r'Flutter\s+([\d.]+)',
  ).firstMatch(flutterVersionOutput);
  final flutterVersion = flutterMatch?.group(1) ?? 'Unknown';
  print('• Flutter Version: $flutterVersion');
  final flutterOk = _compareVersion(flutterVersion, '3.24.0');
  _status(flutterOk, 'Flutter >= 3.24.0');

  // 2️⃣ Check Android Gradle Plugin (AGP) version
  final settingsGradle = File('android/settings.gradle.kts');
  // final buildGradleKts = File('android/build.gradle.kts');
  String agpVersion = 'Unknown';

  if (settingsGradle.existsSync()) {
    final content = settingsGradle.readAsStringSync();

    // Case 1: Direct AGP version
    final matchDirect = RegExp(
      r'id\("com\.android\.application"\)\s+version\s+"([\d.]+)"',
    ).firstMatch(content);

    if (matchDirect != null) {
      agpVersion = matchDirect.group(1)!;
    } else if (content.contains('alias(libs.plugins.android.application)')) {
      // Case 2: AGP version defined in libs.versions.toml
      final libsFile = File('android/gradle/libs.versions.toml');
      if (libsFile.existsSync()) {
        final libsContent = libsFile.readAsStringSync();
        final matchToml = RegExp(
          r'agp\s*=\s*"([\d.]+)"',
        ).firstMatch(libsContent);
        if (matchToml != null) agpVersion = matchToml.group(1)!;
      }
    }
  }

  final agpOk = _compareVersion(agpVersion, '8.5.0');
  _status(agpOk, 'AGP >= 8.5.0');

  if (autoFix && !agpOk && agpVersion != 'Unknown') {
    await _updateGradlePlugin(agpVersion, '8.5.0');
  }

  // 3️⃣ Check NDK version
  final appGradleKts = File('android/app/build.gradle.kts');
  String ndkVersion = 'Unknown';

  if (appGradleKts.existsSync()) {
    final content = appGradleKts.readAsStringSync();
    final match = RegExp(r'ndkVersion\s*=\s*"([\d.]+)"').firstMatch(content);
    ndkVersion = match?.group(1) ?? 'Not Specified';
  }

  // Check gradle.properties fallback
  final gradleProps = File('android/gradle.properties');
  if (ndkVersion == 'Not Specified' && gradleProps.existsSync()) {
    final props = gradleProps.readAsStringSync();
    final match = RegExp(
      r'ANDROID_NDK_VERSION\s*=\s*([\d.]+)',
    ).firstMatch(props);
    if (match != null) ndkVersion = match.group(1)!;
  }

  print('• NDK Version: $ndkVersion');
  final ndkOk = _compareVersion(ndkVersion, '26.1.10909125');
  _status(ndkOk, 'NDK >= 26.1.10909125');

  if (autoFix && !ndkOk) {
    _updateNDKVersion(appGradleKts, ndkVersion, '26.1.10909125');
  }

  // 4️⃣ Check for prebuilt .so libraries
  final jniLibsDir = Directory('android/app/src/main/jniLibs');
  if (jniLibsDir.existsSync()) {
    final soFiles =
        jniLibsDir
            .listSync(recursive: true)
            .where((e) => e.path.endsWith('.so'))
            .toList();

    if (soFiles.isNotEmpty) {
      print(
        '⚠️  Found ${soFiles.length} prebuilt .so files (verify 16KB compatibility):',
      );
      for (var f in soFiles) {
        print('   └── ${f.path}');
      }
    } else {
      print('✅ No prebuilt .so files found.');
    }
  } else {
    print('✅ No JNI libs directory found (good).');
  }

  // 5️⃣ Final Summary
  print('\n📊 Summary:');
  print('• Flutter: ${flutterOk ? "✅ OK" : "❌ Update Required"}');
  print('• Gradle: ${agpOk ? "✅ OK" : "❌ Update Required"}');
  print('• NDK: ${ndkOk ? "✅ OK" : "❌ Update Required"}');

  if (flutterOk && agpOk && ndkOk) {
    print('\n🎉 All checks passed — compatible with 16KB page size builds!');
  } else {
    print('\n🚧 Some updates are required for full compatibility.');
  }
}

//
// ────────────────────────── 🔧 HELPER FUNCTIONS ──────────────────────────
//

Future<String> _runCommand(String cmd, List<String> args) async {
  try {
    final result = await Process.run(cmd, args);
    print('line 130 :: ${result.stdout}');
    return result.stdout.toString() + result.stderr.toString();
  } catch (_) {
    return '';
  }
}

bool _compareVersion(String current, String required) {
  if (current == 'Unknown' || current == 'Not Specified') return false;
  final cur = current.split('.').map((e) => int.tryParse(e) ?? 0).toList();
  final req = required.split('.').map((e) => int.tryParse(e) ?? 0).toList();
  for (int i = 0; i < req.length; i++) {
    if (i >= cur.length) return false;
    if (cur[i] > req[i]) return true;
    if (cur[i] < req[i]) return false;
  }
  return true;
}

void _updateNDKVersion(File gradleFile, String oldVer, String newVer) {
  if (!gradleFile.existsSync()) return;
  var content = gradleFile.readAsStringSync();

  if (oldVer == 'Not Specified') {
    content = content.replaceFirst(
      'android {',
      'android {\n    ndkVersion = "$newVer"',
    );
    print('🧩 Added NDK version: $newVer');
  } else {
    content = content.replaceAll(
      'ndkVersion = "$oldVer"',
      'ndkVersion = "$newVer"',
    );
    print('🔧 Updated NDK version from $oldVer → $newVer');
  }

  gradleFile.writeAsStringSync(content);
}

Future<void> _updateGradlePlugin(String oldVer, String newVer) async {
  final buildGradleKts = File('android/build.gradle.kts');
  if (!buildGradleKts.existsSync()) return;

  var content = buildGradleKts.readAsStringSync();

  if (content.contains('id("com.android.application") version')) {
    content = content.replaceAll(
      RegExp(r'id\("com\.android\.application"\)\s+version\s+"[\d.]+"'),
      'id("com.android.application") version "$newVer"',
    );
    buildGradleKts.writeAsStringSync(content);
    print('🔧 Updated AGP version from $oldVer → $newVer');
  } else if (content.contains('alias(libs.plugins.android.application)')) {
    final libsFile = File('android/gradle/libs.versions.toml');
    if (libsFile.existsSync()) {
      var libsContent = libsFile.readAsStringSync();
      libsContent = libsContent.replaceAll(
        RegExp(r'agp\s*=\s*"[\d.]+"'),
        'agp = "$newVer"',
      );
      libsFile.writeAsStringSync(libsContent);
      print('🔧 Updated AGP version in libs.versions.toml → $newVer');
    }
  }
}

void _status(bool ok, String msg) {
  print(ok ? '   ✅ $msg supported' : '   ❌ $msg required');
}
