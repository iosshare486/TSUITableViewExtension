#
#  Be sure to run `pod spec lint TSUITableViewExtension.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

s.name         = "TSUITableViewExtension"
s.version      = "1.0.0"
s.summary      = "This a tool for UITableView"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description  = <<-DESC
TODO: UITableView 工具的集合,目前存放了空白页逻辑工具
DESC

s.homepage     = "https://gitlab.caiqr.com"

 s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


s.author             = { "Hongli183" => "261930323@qq.com" }



s.source       = { :git => "http://gitlab.caiqr.com/ios_module/TSUITableViewExtension.git", :tag => "#{s.version.to_s}" }


s.source_files  = "TSUITableViewExtension/TSTableViewExtensionFile/*.{h,m}"
#  s.subspec 'TS_TableView_Empty' do |ss|
#    TS_TableView_Empty.source_files = 'TSUITableViewExtension/TSTableViewExtensionFile/TS_TableView_Empty/*'
#  end


end
