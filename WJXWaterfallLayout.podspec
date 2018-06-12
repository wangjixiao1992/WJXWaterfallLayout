Pod::Spec.new do |s|
s.name = 'WJXWaterfallLayout'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = '自动实现瀑布流'
s.description = '使用UICollectionView实现瀑布流效果!'
s.homepage = 'https://github.com/wangjixiao1992/WJXWaterfallLayout'
s.authors = {'wangjixiao' => '642907599@qq.com' }
s.source = {:git => "https://github.com/wangjixiao1992/WJXWaterfallLayout.git", :tag => "v1.0.0"}
s.source_files  = "**/*.{h,m}"
s.platform = :ios, "8.0"
s.requires_arc = false
end
