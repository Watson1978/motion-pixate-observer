task :default => :build

desc "Build Gem file"
task :build do
  mkdir_p "lib/Socket"
  sh "cd Socket; xcodebuild -arch armv6 -arch armv7 -arch armv7s"
  sh "cd Socket; xcodebuild -sdk iphonesimulator"
  sh "lipo -create Socket/build/Release-iphoneos/libSocket.a Socket/build/Release-iphonesimulator/libSocket.a -output lib/Socket/libSocket.a"
  cp "Socket/Socket/Socket.h", "lib/Socket"
  cp "Socket/Socket/Socket-Prefix.pch", "lib/Socket"

  sh "gem build motion-pixate-observer.gemspec"
end

desc "Clean builded files"
task :clean do
  sh "rm -rf Socket/build"
  sh "rm -rf Socket/.build"
  sh "rm -rf lib/Socket"
  sh "rm -f motion-pixate-observer*.gem"
end
