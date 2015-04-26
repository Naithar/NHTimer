#
# Be sure to run `pod lib lint NTimer.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NTimer"
  s.version          = "0.5.0"
  s.summary          = "Сustom block-based timer"
  s.description      = <<-DESC
                       Custom block-based timer with repeat functionallity.
                       DESC
  s.homepage         = "https://github.com/naithar/NTimer"
  s.license          = 'MIT'
  s.author           = { "Naithar" => "devias.naith@gmail.com" }
  s.source           = { :git => "https://github.com/naithar/NTimer.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/naithar'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/**/*'

  s.public_header_files = 'Pod/**/*.h'
end
