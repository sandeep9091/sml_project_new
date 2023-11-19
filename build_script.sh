BUILD_OS=$1
LIVE_STAGING=$2
BUILD_NAME=1.0.0
IOS_BUILD_NAME=1.0.0
BUILD_NUMBER=2
IOS_BUILD_NUMBER=7
EXPORT_OPTIONS_PLIST_PATH="ios_export_options/ExportOptions.plist"


#echo "OS:"$BUILD_OS
#echo "environment:"$LIVE_STAGING
if [ -z $BUILD_APP_NAME ]
then
    BUILD_APP_NAME=""
fi
if [ -z $BUILD_OS ]
then
    echo 'Pass os as "ios/android/appbundle"'
    exit 0
elif [ $BUILD_OS != 'ios' ] && [ $BUILD_OS != 'android' ] && [ $BUILD_OS != 'appbundle' ]
then
    echo 'invalid os'
    exit 0
fi
if [ -z $LIVE_STAGING ]
then
    echo 'Pass environment live/staging'
    exit 0
elif [ $LIVE_STAGING != 'live' ] && [ $LIVE_STAGING != 'staging' ]
then
    echo 'invalid environment'
    exit 0
fi
TIMESTAMP=`date +%Y_%m_%d_%H_%M_%S`
BASE_PATH='/Users/venkata.k/flutter_builds/bsnl/Builds'
# BASE_PATH='/Users/umeshnaidu.c/Workspace/Builds/BSNL-Flutter'

if [ $BUILD_OS == 'android' ] 
then
    DEBUG_INFO_PATH=$BASE_PATH/android
elif [ $BUILD_OS == 'appbundle' ] 
then
    DEBUG_INFO_PATH=$BASE_PATH/appbundle
elif [ $BUILD_OS == 'ios' ] 
then
    DEBUG_INFO_PATH=$BASE_PATH/ios
fi

if [ ! -d $DEBUG_INFO_PATH ] 
then
    mkdir $DEBUG_INFO_PATH
fi
DEBUG_INFO_PATH=$DEBUG_INFO_PATH/$LIVE_STAGING
if [ ! -d $DEBUG_INFO_PATH ] 
then
    mkdir $DEBUG_INFO_PATH
fi
DEBUG_INFO_PATH=$DEBUG_INFO_PATH/$TIMESTAMP
if [ ! -d $DEBUG_INFO_PATH ] 
then
    mkdir $DEBUG_INFO_PATH
fi

APK_PATH=$DEBUG_INFO_PATH'/'$BUILD_APP_NAME'bsnl_'$LIVE_STAGING'_'$TIMESTAMP'.apk'
BUNDLE_PATH=$DEBUG_INFO_PATH'/'$BUILD_APP_NAME'bsnl_'$LIVE_STAGING'_'$TIMESTAMP'.aab'
IOS_PATH=$DEBUG_INFO_PATH'/'

DEBUG_INFO_PATH=$DEBUG_INFO_PATH/debug_info
echo 'debug_info path:'$DEBUG_INFO_PATH

if [ $BUILD_OS == 'android' ] 
then
    echo 'final apk path:'$APK_PATH
    if [ $LIVE_STAGING == 'live' ]
    then
        echo "Building Live APP."
        flutter build apk --target=lib/main.dart --build-number=$BUILD_NUMBER --build-name=$BUILD_NAME --obfuscate --split-debug-info=$DEBUG_INFO_PATH/ BASE_URL="https://mybsnl.bsnl.co.in/api/v2" --dart-define AKEY="642d1cc69d90666962726e" --dart-define AUTHKEY="APPYM8205D04"  --dart-define ENKEY="M72S912O2L"  
        mv build/app/outputs/flutter-apk/app-release.apk $APK_PATH
        echo "Build copied to "$APK_PATH
        echo "\nBuilding completed\n\n"
    fi

    if [ $LIVE_STAGING == 'staging' ]
    then
        echo "Building STAGING APP."
        flutter build apk --build-number=$BUILD_NUMBER --build-name=$BUILD_NAME --dart-define BASE_URL="https://stg-mybsnl.bsnl.co.in/api/v2" --dart-define AKEY="642d1cc69d90666962726e" --dart-define AUTHKEY="APPYM8205D04"  --dart-define ENKEY="M72S912O2L"
        mv build/app/outputs/flutter-apk/app-release.apk $APK_PATH
        echo "Build copied to "$APK_PATH
        echo "\nBuilding completed\n\n"
    fi
fi

if [ $BUILD_OS == 'appbundle' ] 
then
    echo 'final appbundle path:'$BUNDLE_PATH

    if [ $LIVE_STAGING == 'live' ]
    then
        echo "Building Live APP."
        flutter build appbundle --target=lib/main.dart --build-number=$BUILD_NUMBER --build-name=$BUILD_NAME --obfuscate --split-debug-info=$DEBUG_INFO_PATH/ --dart-define BASE_URL="https://hifi.ioh.co.id/api/v1" --dart-define ENKEY=ftth --dart-define GKEY="AIzaSyDtG3DXU-CMxR9ruZvp3_bXJYGV7tpwXCg" --dart-define AKEY=722c13dc9a986271696f7438 --dart-define PAY_URL="https://hifi.ioh.co.id/#/" --dart-define SKIP_HASH="FALSE" --dart-define QISCUS_APPID="apsbg-f2i0efdmhzsdiav" --dart-define QISCUS_CHANNEL_ID="126875"
        mv build/app/outputs/bundle/release/app-release.aab $BUNDLE_PATH
        echo "Build copied to "$BUNDLE_PATH
        echo "\nBuilding completed\n\n"
    fi

    if [ $LIVE_STAGING == 'staging' ]
    then
        echo "Building STAGING APP."
        flutter build appbundle --obfuscate --split-debug-info=$DEBUG_INFO_PATH/ --dart-define BASE_URL="https://stg-mybsnl.bsnl.co.in/api/v2" --dart-define AKEY="642d1cc69d90666962726e" --dart-define AUTHKEY="APPYM8205D04"  --dart-define ENKEY="M72S912O2L"  --dart-define SKIP_HASH="TRUE" 
        mv build/app/outputs/bundle/release/app-release.aab $BUNDLE_PATH
        echo "Build copied to "$BUNDLE_PATH
        echo "\nBuilding completed\n\n"
    fi
fi


if [ $BUILD_OS == 'ios' ] 
then
    echo 'final archive path:'$IOS_PATH
    if [ $LIVE_STAGING == 'live' ]
    then
        flutter build ipa --target=lib/main.dart --obfuscate --split-debug-info=$DEBUG_INFO_PATH/ --build-number=$IOS_BUILD_NUMBER --build-name=$IOS_BUILD_NAME  --dart-define BASE_URL="https://mybsnl.bsnl.co.in/api/v2" --dart-define AKEY="642d1cc69d90666962726e" --dart-define AUTHKEY="APPYM8205D04"  --dart-define ENKEY="M72S912O2L"  
        mv build/ios/archive $IOS_PATH
        echo 'Build copied to '$IOS_PATH
        echo "\nBuilding completed\n\n"
    fi

    if [ $LIVE_STAGING == 'staging' ]
    then
        flutter build ipa --target=lib/main.dart --build-number=$IOS_BUILD_NUMBER --build-name=$IOS_BUILD_NAME --dart-define BASE_URL="https://stg-mybsnl.bsnl.co.in/api/v2" --dart-define BILLDESK_URL="https://pguat.billdesk.io" --dart-define AKEY="642d1cc69d90666962726e" --dart-define AUTHKEY="APPYM8205D04"  --dart-define ENKEY="M72S912O2L" --dart-define DEV_MODE="TRUE" --export-options-plist=$EXPORT_OPTIONS_PLIST_PATH
        mv build/ios/archive $IOS_PATH
        mv build/ios/ipa $IOS_PATH
        echo 'Build copied to '$IOS_PATH
        echo "\nBuilding completed\n\n"
    fi  
fi
