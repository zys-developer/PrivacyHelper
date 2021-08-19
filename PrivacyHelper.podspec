#
# Be sure to run `pod lib lint PrivacyHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PrivacyHelper'
  s.version          = '0.1.1'
  s.summary          = '一行代码搞定隐私权限'

  s.description      = <<-DESC
  一行代码搞定隐私权限, 使用时只需根据不同的状态做出相应处理即可
                       DESC

  s.homepage         = 'https://github.com/zys-developer/PrivacyHelper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zys-developer' => 'zys_dev@163.com' }
  s.source           = { :git => 'https://github.com/zys-developer/PrivacyHelper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.default_subspec = "Core"
  s.swift_version = '5.0'
  
  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/*/*.swift"
  end

  s.subspec "Base" do |ss|
    ss.source_files = "Sources/Core/*.swift"
    ss.dependency "PrivacyHelper/Core"
  end

  s.subspec "PhotoLibrary" do |ss|
    ss.source_files = "Sources/PhotoLibrary/*.swift"
    ss.dependency "PrivacyHelper/Base"
  end

  s.subspec "Camera" do |ss|
    ss.source_files = "Sources/Camera/*.swift"
    ss.dependency "PrivacyHelper/Base"
  end
  
end
