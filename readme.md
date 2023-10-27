# Build instructions

1. Clone the repository to your local machine with:

```
git clone https://github.com/WojciechCzechowski-SmartFrame/ColourFlicker_Flutter_all-platforms
```

---

2. Install Flutter SDK

- if you are using **Linux** follow [Linux Installation Guide](https://docs.flutter.dev/get-started/install/linux)
- if you are using **Windows** follow [Windows Installation Guide](https://docs.flutter.dev/get-started/install/windows)
- if you are using **MacOS** follow [MacOS Installation Guide](https://docs.flutter.dev/get-started/install/macos#get-sdk)

> IMPORTANT: to build for Linux, you have to use Linux. To build for Windows, you have to use Windows. To build for MacOS and iOS, you have to use MacOS. To build for Android - it doesn't matter :]

---

3. Install additional apps if you intend to run the app in one of the following platforms:

- in case you want to build **MacOS** / **iOS** app -> install [xCode](https://apps.apple.com/us/app/xcode/id497799835)
- in case you want to build **Android** app -> install [Android Studio](https://developer.android.com/studio)

---

4. Open terminal / command line / powershell and navigate to the main directory of cloned repository

---

5. To verify, that you're ready to build the app for your destination platform, run

```
flutter doctor
```

---

6. In the doctor's summary, look for the following checks:

```
[v] Flutter
[v] Connected device
```

... and for platform specific ones:

- for **Linux**:

```
[v] Linux toolchain - develop for linux desktop
```

- for **Windows**:

```
[v] Visual Studio - develop Windows apps…
```

- for **MacOS** / **iOS**:

```
[v] Xcode - develop for iOS and macOS
```

- for **Android**:

```
[v] Android toolchain - develop for Android devices...
[v] Android Studio
```

In case you encounter **_cmdline-tools component is missing_** for android:

- Open Android Studio
- Go to **_Tools_** -> **_SDK Manager_** and switch to the **_SDK Tools_** tab
- Find **_Android SDK Command-line Tools (latest)_** on the list, check it and confirm hitting **_OK_** button on bottom right
- Confirm the changes by clicking OK once more
- Wait until installation is done and click **_Finish_**
- Run flutter doctor once more to confirm, that the issue is gone

If some of the other necessary checkmarks are missing, follow the doctor's guidance to fix it.

---

> This step is for mobile destinations (iOS / Android) only. Feel free to skip it, if you are building for linux / windows / macos

Create virtual or connect physical device, that you wish to build the app for

- for **Android**
  - virtual device: follow [Create and manage virtual device](https://developer.android.com/studio/run/managing-avds) instructions
  - physical device:
    - open **Settings** app on your device, search for **Developer options** and enable **USB debugging** (if applicable).
      _Note: If you don't see Developer options, follow the instructions to [enable developer options](https://developer.android.com/studio/run/device#:~:text=the%20instructions%20to-,enable%20developer%20options,-.)._
    - connect your device via USB
- for **iOS**
  - virtual device: follow [Set up the iOS simulator](https://docs.flutter.dev/get-started/install/macos#set-up-the-ios-simulator) instructions
  - physical device: follow [Deploy to physical ios devices](https://docs.flutter.dev/get-started/install/macos#deploy-to-physical-ios-devices) instructions

---

7. To build and run release version of the app run

```
flutter run
```

---

8. When promted with device selection, select the one, that you intend to build the app for.
