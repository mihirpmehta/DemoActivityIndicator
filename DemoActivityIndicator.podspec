#
# Be sure to run `pod lib lint DemoActivityIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DemoActivityIndicator'
  s.version          = '2.0.0'
  s.summary          = 'Activity Indicator which covers the navigation bar and prevent any UI interaction while Activity indicator is spinning'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UI Activity Indicator which covers the navigation bar and prevent any UI interaction while Activity indicator is spinning
It can work on Window as well as on UIViewController
                       DESC

  s.homepage         = 'https://github.com/mihirpmehta/DemoActivityIndicator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mihirpmehta' => 'mihirpmehta@gmail.com' }
  s.source           = { :git => 'https://github.com/mihirpmehta/DemoActivityIndicator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/NihilistMe'

  s.ios.deployment_target = '12.0'
  s.swift_version = '4.2'
  s.source_files = 'DemoActivityIndicator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DemoActivityIndicator' => ['DemoActivityIndicator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
