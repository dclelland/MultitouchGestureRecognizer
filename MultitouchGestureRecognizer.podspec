#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                    = "MultitouchGestureRecognizer"
  s.version                 = "2.1.0"
  s.summary                 = "MultitouchGestureRecognizer is a UIGestureRecognizer subclass providing a richer API for working with multiple touches."
  s.homepage                = "https://github.com/dclelland/MultitouchGestureRecognizer"
  s.license                 = { :type => 'MIT' }
  s.author                  = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source                  = { :git => "https://github.com/dclelland/MultitouchGestureRecognizer.git", :tag => "2.0.0" }
  s.platform                = :ios, '8.0'
  s.ios.deployment_target   = '8.0'
  s.ios.source_files        = 'MultitouchGestureRecognizer.swift'
  s.requires_arc            = true
end
