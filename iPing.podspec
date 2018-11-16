Pod::Spec.new do |s|
  s.name             = "iPing"
  s.summary          = "iPing:ICMP Ping in swift"
  s.version          = "1.0"
  s.homepage         = "https://github.com/jihongboo/iPing.git"
  s.license          = 'MIT'
  s.author           = { "Zac Ji" => "jihongboo@qq.com" }
  s.source           = {
    :git => "https://github.com/jihongboo/iPing.git",
    :tag => s.version.to_s
  }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.source_files = 'Sources/*'

  # s.ios.frameworks = 'UIKit', 'Foundation'
  # s.osx.frameworks = 'Cocoa', 'Foundation'
end