Pod::Spec.new do |s|

s.name             = 'ATFluidSegmentedControl'
s.version          = '1.0'
s.summary          = 'A segmented control with custom appearance and interactive animations.'

s.description      = <<-DESC
ATFluidSegmented control is a segmented control written in Swift with custom appearance and transition between the segments. It can be easily customized to suit your specific needs.
DESC

s.homepage         = 'https://github.com/arraytag/ATFluidSegmentedControl'
s.screenshots      = 'https://raw.githubusercontent.com/arraytag/ATFluidSegmentedControl/master/Screenshots/screenshot1.png', 'https://raw.githubusercontent.com/arraytag/ATFluidSegmentedControl/master/Screenshots/screenshot2.png', 'https://raw.githubusercontent.com/arraytag/ATFluidSegmentedControl/master/Screenshots/screenshot3.png'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Array Tag, LLC' => 'iosdev@arraytag.com' }
s.source           = { :git => 'https://github.com/arraytag/ATFluidSegmentedControl.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/arraytag'

s.ios.deployment_target = '8.0'

s.source_files = 'ATFluidSegmentedControl/Classes/**/*'

end
