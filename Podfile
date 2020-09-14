source 'https://cdn.cocoapods.org/'

platform :ios, '13.0'
inhibit_all_warnings!
use_frameworks!
workspace 'UDTM'

#plugin 'cocoapods-keys', {
#  :project => "UDTM",
#  :keys => [
#  "TMBDAcessToken"
#  ]}

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
  pod 'RealmSwift'
  pod 'Disk'
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

target 'Common' do
  project 'Presentation/Common/Common'
  sharedPods
  presentationPods
  diPods
  target 'CommonTests'
end

target 'DI' do
  project 'DI/DI'
  sharedPods
  presentationPods
  diPods
  networkingPods
  storagePods
  target 'DITests'
end

target 'AppNavigation' do
  project 'AppNavigation/AppNavigation'
  use_frameworks!
  sharedPods
  presentationPods
  diPods
  networkingPods
  storagePods
  target 'AppNavigationTests'
end

target 'Domain' do
  project 'Domain/Domain'
  sharedPods
  diPods
  target 'DomainTests'
end

target 'AppData' do
  project 'Data/AppData/AppData'
  use_frameworks!
  sharedPods
  target 'AppDataTests' do
    diPods
  end
end

target 'Networking' do
  project 'Data/Networking/Networking'
  sharedPods
  networkingPods
  target 'NetworkingTests' do
    diPods
  end
end

target 'Storage' do
  project 'Data/Storage/Storage'
  sharedPods
  storagePods
  target 'StorageTests' do
    diPods
  end
end

