

Pod::Spec.new do |s|
  s.name         = 'AhShare'
  s.version      = '0.1.2'
  s.ios.deployment_target = '8.0'
  s.summary      = 'Based on the social components of the African union (au) by 阿浩'
  s.homepage     = 'https://github.com/ahao1011/AhShare'
  s.license      = 'MIT'
  s.author       = { 'ah'=> 'zth1011@126.com'}
  s.source       = { :git => 'https://github.com/ahao1011/AhShare.git', :tag => s.version.to_s}
  s.source_files = 'AhShare','AhShare/*.{h,m}'

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true
  s.dependency 'UMengUShare/UI'           , '~> 6.3.0'
  s.dependency 'UMengUShare/Social/WeChat', '~> 6.3.0'
  s.dependency 'UMengUShare/Social/QQ'    , '~> 6.3.0'
   `echo "2.3" > .swift-version`

end
