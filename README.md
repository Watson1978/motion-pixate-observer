# Motion::Pixate::Observer

この gem は、CSS ファイルを変更すると即座に Pixate Framework を利用したアプリに変更内容を適用するという機能を提供します。

CSS ファイルを変更するたびにアプリをビルドし直す必要も、アプリ上での操作も一切必要ありません。CSS ファイルをエディタで編集し保存するだけです。

## Requirements

- RubyMotion 1.0 or greater (see http://www.rubymotion.com).
- Pixate Framework 1.0 or greater (see http://www.pixate.com/).

## Installation

```
$ gem install motion-pixate-observer
```

## Usage

- `Rakefile` で `motion-pixate-observer` を require してください。

```ruby
require 'rubygems'
require 'motion-pixate-observer'
```

- メインのコントローラで Motion::Pixate::Observer を include してください。`viewDidLoad` で `startObserving` を呼び出すと動作します。

```ruby
class MainViewController < UIViewController
  include Motion::Pixate::Observer  # メインのコントローラで Motion::Pixate::Observer を include する

  def viewDidLoad
    super

    startObserving # startObserving を呼ぶとサーバを探して通信し始める

    ....
  end
```

- あらかじめサーバを起動しておきます。サーバを起動する際に MacRuby がインストールされている必要があります。

```
$  ./pixate_server css_file_path
```

サーバを起動した後、RubyMotion アプリを起動します。

- CSS ファイルを更新し保存すると、即座にアプリに反映されます。

