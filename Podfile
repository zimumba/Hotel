platform :ios, '8.0'

inhibit_all_warnings!

use_frameworks!

def shared_pods
  pod 'libextobjc'
end

target ‘Hotel’ do
  shared_pods
end

# Fix Parse modular issue
post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
        configuration.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
end
