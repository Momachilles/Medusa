Pod::Spec.new do |s|
  s.name              = "Medusa"
  s.version           = "1.0.0"
  s.summary           = "A NSOperation Network Framework."
  s.homepage          = "https://github.com/Momachilles/Medusa"
  s.license           = "MIT"
  s.author            = { "David Alarcon" => "momachilles@gmail.com" }
  s.social_media_url  = "http://twitter.com/Momachilles"
  s.platform          = :ios, "11.0"
  s.source            = { :git => "git@github.com:Momachilles/Medusa.git", :tag => "#{s.version}" }
  s.source_files      = "Medusa","Medusa/**/*.{h,m,swift}"
end
