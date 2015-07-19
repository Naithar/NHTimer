# NHTimer

[![Build Status](https://travis-ci.org/Naithar/NHTimer.svg?branch=master)](https://travis-ci.org/Naithar/NHTimer)
[![Version](https://img.shields.io/cocoapods/v/NTimer.svg?style=flat)](http://cocoapods.org/pods/NTimer)
[![Coverage Status](https://coveralls.io/repos/Naithar/NTimer/badge.svg?branch=master)](https://coveralls.io/r/Naithar/NTimer?branch=master)


## Author

Naithar, devias.naith@gmail.com

## Setup
* Add ```pod 'NTimer', :git => 'https://github.com/naithar/NHTimer.git'``` to your [Podfile](http://cocoapods.org/)
* Run ```pod install```
* Open created ```.xcworkspace``` file
* Add ```#import <NHTimer/NHTimer.h>``` in your source code

## Usage
```objc
[[[[[NHTimer timer] repeat:5] interval:0.1] timerBlock:^(NHTimer *timer) {
    ...your code...
}] start];
```

```objc
[[NHTimer alloc] initWithRepeatCount:5 interval:0.1 timerBlock:^(NHTimer *timer) {
    ...your code...
}];
```


## License

NHTimer is available under the MIT license. See the LICENSE file for more info.
