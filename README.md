# JUICyclesImageView
一款简易易用的图片无限轮播控件

异步加载图片使用了SDWebImage库

实现原理:
    scrollView实现轮播重复使用了(左中右)三个UIImageView, 启动时显示中间的那一个
    每次滚动到下一个page并在滚动结束时, 在delegate方法scrollViewDidEndDecelerating和scrollViewDidEndDragging中替换三个UIImageView的图片
    并让scrollView滚回到中间,取消动画,形成一种已经滚到下一张图片的错觉,由此实现无限图片轮播
    scrollViewDidEndDragging方法要注意判断decelerate为否
