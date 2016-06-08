Pod::Spec.new do |s|
  s.name         = "PhotosExtension"
  s.version      = "0.0.2"
  s.summary      = "Photos 的类方法扩展"
  s.description  = "PhotosExtension 可以快速的保存图片到相册中，可以通过参数控制是否保存到以应用名命名的相册"

  s.homepage     = "https://github.com/sunbohong/PhotosExtension"
  s.license      = "MIT"
  s.author             = { "sunbohong" => "sunbohong@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/sunbohong/PhotosExtension.git", :tag => "0.0.2" }
  s.source_files  = "*.{h,m}"
  s.framework  = "Photos"
  s.requires_arc = true
  s.dependency "NSBundle+Extension", "~> 0.0.2"
end
