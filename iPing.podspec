Pod::Spec.new do |s|
  s.name             = "iPing"
  s.summary          = "iPing:ICMP Ping in swift"
  s.version          = "1.0"
  s.homepage         = "https://github.com/jihongboo/iPing.git"
  s.license          = 'MIT'
  s.author           = { "Zac Ji" => "jihongboo@qq.com" }
  s.platform         = :ios, '8.0'
  s.swift_version    = "4.2"
  s.source           = {
    :git => "https://github.com/jihongboo/iPing.git",
    :tag => s.version.to_s
  }

  s.requires_arc = true
  s.source_files = 'iPing/Sources/**/*'

  # s.ios.frameworks = 'UIKit', 'Foundation'
  # s.osx.frameworks = 'Cocoa', 'Foundation'
end
