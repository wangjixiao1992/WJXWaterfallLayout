  # WJXWaterfallLayout
    
   ## 介绍
    瀑布流

   ## 版本
    1.0.0
    
   ## 版本
    source 'https://github.com/wangjixiao1992/WJXWaterfallLayout.git'
    platform :ios, '8.0'
    
    target 'TargetName' do
    pod 'WJXWaterfallLayout', '~> 1.0.0'
    end

   ## 演示代码
   ```swift
   - (WJXWaterfallLayout *)flowlayout
   {
       if (!_flowlayout) {
           _flowlayout = [[WJXWaterfallLayout alloc] init];
           _flowlayout.minimumInteritemSpacing = 0;
           _flowlayout.minimumLineSpacing = 0;
           _flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
           _flowlayout.delegate = self;
      }
      return _flowlayout;
   }
```
   ## 联系我们
   如有疑问请发送邮件.谢谢~
   15037535383@163.com


