# Motion::Pixate::Observer


## Installation

```
$ gem install motion-pixate-observer
```

## Usage

```ruby
class MainViewController < UIViewController
  include PixateStyleObserver  # メインのコントローラで PixateStyleObserver を include する

  def viewDidLoad
    super
    
    startObserving # startObserving を呼ぶとサーバを探して通信し始める

    ....
  end

```

あらかじめサーバを起動しておきます。
```
$  ./pixate_server css_file_path
```

CSS ファイルを更新し保存すると、即座にアプリに反映されます。

