source 'https://cdn.cocoapods.org/'

platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!
workspace 'UDTM'

def firebase
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Analytics'
  pod 'Firebase/Messaging'
end

def sharedPods
  pod 'SwiftLint'
  pod 'Fakery', :git => 'https://github.com/vadymmarkov/Fakery', :branch => 'master'
  pod 'SwiftDate', :git => 'https://github.com/malcommac/SwiftDate', :branch => 'master'
end

def presentationPods
  pod 'UIGradient', '~> 1.3.1'
  pod 'SwiftGen', '~> 6.0'
  pod 'InputMask', '4.3'
  pod 'IQKeyboardManagerSwift', :git => 'https://github.com/hackiftekhar/IQKeyboardManager', :branch => 'master'
  pod 'SwiftMessages'
  pod 'SwiftRichString'
  pod 'NVActivityIndicatorView/Extended'
end

def diPods
  oxeNetworking
  pod 'Swinject', '~> 2.7.0'
  pod 'SwinjectAutoregistration', '~> 2.7.0'
  pod 'SwinjectStoryboard', :git => 'https://github.com/Swinject/SwinjectStoryboard', :branch => 'master'
end

def oxeNetworking
    pod 'OxeNetworking'
end

def networkingPods
  oxeNetworking
  pod 'AlamofireNetworkActivityLogger', '~> 3.0'
end

def storagePods
  pod 'KeychainAccess'
end

abstract_target 'UDMTTargets' do
  project 'UDTM'
  sharedPods
  presentationPods
  diPods
  networkingPods
  storagePods
  firebase
  target 'UDTM' do
    target 'UDTMTests' do
	   inherit! :search_paths
    end
  end
end

target 'DI' do
  project 'DI/DI'
  sharedPods
  diPods
  target 'DITests'
end

target 'Domain' do
  project 'Domain/Domain'
  sharedPods
  diPods
  target 'DomainTests'
end

target 'AppData' do
  project 'AppData/AppData'
  use_frameworks!
  sharedPods
  target 'AppDataTests' do
    diPods
  end
end

target 'Networking' do
  project 'Networking/Networking'
  sharedPods
  networkingPods
  target 'NetworkingTests' do
    diPods
  end
end

target 'Storage' do
  project 'Storage/Storage'
  sharedPods
  storagePods
  target 'StorageTests' do
    diPods
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # This works around a unit test issue introduced in Xcode 10.
            # We only apply it to the Debug configuration to avoid bloating the app size
            if config.name == "Debug" && defined?(target.product_type) && target.product_type == "com.apple.product-type.framework"
                config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = "YES"
            end
        end
    end
end 

