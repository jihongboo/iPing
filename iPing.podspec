Pod::Spec.new do |s|
  s.name             = "iPing"
  s.summary          = "iPing:ICMP Ping in swift"
  s.version          = "1.1.2"
  s.homepage         = "https://github.com/jihongboo/iPing.git"
  s.license          = 'MIT'
  s.author           = { "Zac Ji" => "jihongboo@qq.com" }
  s.source           = {
    :git => "https://github.com/jihongboo/iPing.git",
    :tag => s.version.to_s
  }

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.requires_arc = true
  s.source_files = 'iPing/**/*.{swift,h,m}'

  s.ios.frameworks = 'Foundation'
end
