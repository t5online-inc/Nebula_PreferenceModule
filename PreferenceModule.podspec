Pod::Spec.new do |spec|
  spec.name         = 'PreferenceModule'
  spec.version      = '1.0.0'
  spec.license      = { :type => 't5online' }
  spec.homepage     = 'https://github.com/t5online-inc/PreferenceModule'
  spec.authors      = { 't5online' => 'yslee@t5online.com' }
  spec.summary      = 'PreferenceModule(Nebula)'
  spec.source       = { :git => 'https://github.com/t5online-inc/PreferenceModule.git' }
  spec.source_files = 'ios/PreferenceModule/Shared/'
  spec.framework    = 'Foundation', 'UIKit'
end
