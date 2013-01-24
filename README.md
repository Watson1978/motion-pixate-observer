# Motion::Pixate::Observer


## Installation

```
$ gem install motion-pixate-observer
```

## Usage

`Rakefile` で `motion-pixate-observer` を require してください。
```ruby
require 'rubygems'
require 'motion-pixate-observer'
```

メインのコントローラで PixateStyleObserver を include してください。

```ruby
class MainViewController < UIViewController
  include Motion::Pixate::Observer  # メインのコントローラで Motion::Pixate::Observer を include する

  def viewDidLoad
    super

    startObserving # startObserving を呼ぶとサーバを探して通信し始める

    ....
  end

```

あらかじめサーバを起動しておきます。サーバを起動する際に MacRuby がインストールされている必要があります。
```
$  ./pixate_server css_file_path
```

CSS ファイルを更新し保存すると、即座にアプリに反映されます。

