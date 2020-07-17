
Pod::Spec.new do |s|
  s.name         = "RnDuoYuAd"
  s.version      = "1.0.0"
  s.summary      = "RnDuoYuAd"
  s.description  = <<-DESC
                  RnDuoYuAd
                   DESC
  s.homepage     = "https://github.com/react-native-community/react-native-cameraroll"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.xcconfig     = { "OTHER_LDFLAGS" => "-ObjC" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RnDuoYuAd.git", :tag => "master" }
  s.source_files  = "RnDuoYuAd/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  