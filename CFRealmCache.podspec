Pod::Spec.new do |s|
s.name = 'CFRealmCache'
s.version = '0.1.0'
s.license= { :type => "MIT", :file => "LICENSE" }
s.summary = 'CFRealmCache is a Swift module for Realm'
s.homepage = 'https://github.com/swift365/CFRealmCache'
s.authors = { 'chengfei.heng' => 'hengchengfei@sina.com' }
s.source = { :git => 'https://github.com/swift365/CFRealmCache.git', :tag => "0.1.0" }
s.ios.deployment_target = '9.0'
s.source_files = "CFRealmCache/Classes/*", "CFRealmCache/Classes/**/*.swift"
s.dependency 'RealmSwift'
end

