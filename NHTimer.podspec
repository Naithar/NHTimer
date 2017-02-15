Pod::Spec.new do |s|
  s.name             = "NHTimer"
  s.version          = "0.5.2"
  s.summary          = "Сustom block-based timer."
  s.homepage         = "https://github.com/naithar/NHTimer"
  s.license          = 'MIT'
  s.author           = { "Naithar" => "devias.naith@gmail.com" }
  s.source           = { :git => "https://github.com/naithar/NHTimer.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/naithar'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/**/*'

  s.public_header_files = 'Pod/**/*.h'
end
