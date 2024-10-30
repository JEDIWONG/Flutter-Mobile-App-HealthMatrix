
# About Health Matrix 

Health Matrix is a mobile application develop to fulfill the SDG-17 (Good Health and Well Being) in conjunction of participating in the Hackathon X hosted by UMPSA (2024). 

# How To Setup

**If You Haven't Install Flutter and Android Studio**

1. Install Flutter SDK (it consist of Dart SDK as well) [https://docs.flutter.dev/get-started/install] 

2. Install Android Studio for android SDK and android emulator as this application will be run on android platfrom. [https://developer.android.com/studio]

3. Use code editor like Microsoft Visual Studio Code as the usage will be using Microsoft Visual Studio Code as well. [https://code.visualstudio.com/download]

**If Flutter and Android studio is installed**

1. Clone the repository. 
2. Open the folder in Microsoft Visual Studio code. 
3. To install the dependecies, run --flutter pub get. 
4. There are 2 Options on where to run the application : 
    - Options 1: Android Emulator. Install Android Emulator at Android studio.To learn more [https://developer.android.com/studio/run/emulator] 
    - Options 2 : Android Device. Enabling developer options and enable USB debugging on your device. Connect your device and computer with USB cable. Your device name should appear in the device list in visualstudio Code. Run command --flutter devices to check the whether your device is connected. If not run --flutter doctor for troubleshooting. 

5. Select a connected emulator/device to run. 
6. Run command --flutter run. 
7. The application should be running after a while. 

# Dependencies

- cupertino_icons: ^1.0.8
- percent_indicator: ^4.2.3
- smooth_page_indicator: ^1.2.0+3
- numberpicker: ^2.1.2
- syncfusion_flutter_gauges: ^27.1.55
- pedometer: ^4.0.2
- permission_handler: ^11.3.1

These are utilities that used in developing the UI of the application. 

pedometer and permission_handler are used for pedometer to run on android App, user must accept the permission when prompt with for pedometer to use in their device (if device supported). 

To install the dependecies manually : 
- Run in terminal --flutter pub add [package name]

# Usage

This application consist of several screens like Onboarding, authentication, login, registration, home/dashboard, steps taken, blood pressure, heart beat rate, water intake log, features, guide, learning, facts, profile and notification. It will be continue to develop and fixes in the future. 

- To launch the application in mobile device please install the .APK file in your android device. 
- If you cant find on this github page, please go to the project folder and search for the file [../health_matrix/build/app/outputs/flutter-apk/app-release.apk] and install it on your android device.

**App Features**

Onboarding : 
- Introduce the main idea of the application to the new user. 

Auth:
- Guide user on possesing an account. 

Login : 
- Let user login their account by credentials. 

Registration:
- Let user register their new account. 

Setup Account: 
- Let User input their biometrics info like weight, height for calcaution and data analytics usage. Medical record is record so that application is personalise based on the user to improve the  accuracy of suggestion. 

Dashboard :
- User can view their health metric in card view such as the steps taken, water intake and blood pressure. User can navigate to each health metric screen by tap on it. 

Steps taken: 
- User view the steps taken and can set the goal 

Water Intake log: 
- User view and record the water intake by interacting with it and can set the goal. 

Blood pressure : 
- Record the bp and view the suggestion. 

Heart beat rate :
- similar to blood pressure 

Features :
- can navigate to several other feature screen. 

Meal planning : 
- add meal for each day by specifying their nutrient value
Knowledge:
- Learn more about the NCDs, consist of facts for each chapter. 
Guide :
- screen to educate user about how to use certain health care tools like blood pressure monitor device.
profile :
- display of user biometrics and can edit for analytics purpose.
