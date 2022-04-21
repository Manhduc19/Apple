platform :ios, '12.0'
use_frameworks!

def common_pods
  # Common
  pod 'R.swift'
  pod 'SwifterSwift/Foundation'
  pod 'SwifterSwift/UIKit'
  pod 'SDCAlertView'
  pod 'SwiftyUserDefaults', '~> 5.0'
  pod 'AFDateHelper', '~> 4.3.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'SwiftyAttributes'
  pod 'FCFileManager'
  pod 'Spring', :git => 'https://github.com/MussaCharles/Spring.git'
  pod 'ChameleonFramework'
  pod 'SwiftyBeaver'
  pod 'SwiftNotificationCenter'
  pod "SwiftRater"
  pod 'DZNEmptyDataSet'
  pod 'PanModal'
  pod "Haptica"
  pod 'Hero'
  pod 'JGProgressHUD'
  pod 'Moya', '~> 14.0'
  pod 'ObjectMapper'
  pod 'SwiftyJSON'
  pod 'CryptoSwift', '~> 1.4.1'
  pod 'Localize-Swift', '~> 3.2'
  pod 'SDWebImage'
  pod 'SwiftyStoreKit'
  pod 'Then'
  pod 'Tactile'
  pod 'Bond'
  pod 'FSPagerView'
  pod 'IndicateKit'
  pod 'QCropper'
  pod 'CameraManager'
  pod 'MarqueeLabel'
  # Database
  pod 'RealmSwift'
  
  # Permission
  pod 'Permission/Photos'
  pod 'Permission/Camera'
  
  # Analytic
  pod 'Firebase/Core'
  pod 'Firebase/Analytics'
  pod 'Firebase/RemoteConfig'
  
  #Ads
  pod 'IronSourceSDK','7.1.14.0'
  
end

target 'baseapp' do
  common_pods
end


 
#post_install do |installer_representation|
#    installer_representation.pods_project.targets.each do |target|
#        target.build_configurations.each do |config|
#            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
#            config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
#        end
#    end
#end
#

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['VALID_ARCHS'] = 'arm64, arm64e, x86_64'
  end
end
