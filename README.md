# README

## アプリケーション名 Accommodation_review

## アプリケーション概要
宿泊施設をレビューできるアプリケーションです。

## 開発背景
元々前職で観光関係の仕事をしていた事や、カリキュラムでの内容、また独学で学んだ外部の知識や経験を活かして、世代や性別を問わず思い出や情報を共有できる様な、アプリケーションを目指して作成を行いました。

## 工夫した点
カリキュラムの範囲外のgemや初めて知る様な技術、初めて使用するCSSフレームワークを使用していたので、オリジナルアプリ作成の存在を知った段階から自分にしか作れない様なアプリケーションを目標に、プライベートプライベートな時間を使って事前にリサーチを行っていました。
アプリケーションの環境も考慮し比較的に自分の理想に近いコードやgemや、参考にコンテンツのバージョンの相互関係の解消を吟味した上で選ぶ形になりましたのでリサーチの仕方を少しずつ変更し機能の実装を実現しました。

## 苦労した点
初めて使う技術やgem、CSSフレームワークを使用したので環境系のエラーが出ないように各コンテンツの開発環境やシステム同士の影響や、バージョン差で生じる問題の対応に苦労しました。しかしカリキュラムを等して得た仮説、分析能力を元に考え得る全ての可能性でのリサーチや試行錯誤で無事に各機能の実装まで到達出来ました。

## デプロイ済みURL
https://accommodation-review.herokuapp.com/

## ローカル環境でのアプリケーションの立ち上げ方
% cd<br>
% cd projects (御自身のディレクトリで大丈夫です)<br>
% git clone https://github.com/yasfu/Accommodation_review.git<br>
% li<br>
% cd Accommodation_review<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails db:migrate<br>
% rails s

## テスト用アカウント
| name | email | password |
| ---- | --------- | -------- |
| hoge | hoge@hoge | 1234hoge |
| abc | abc@1234 | 1234abc |

## 利用方法
・ログインしていなければ全体の評価の閲覧しかできず、絞り込みもできない。  
・ログインしているユーザーで有れば宿泊施設の投稿やレビューができる。  
・投稿された宿泊施設はログインユーザーは自由に更新できる。  
・投稿されている宿泊施設はカテゴリー毎に検索で絞り込める。  
・レビューは星一つ以上の選択が必須でコメントは無くても可能。  
・自身の投稿したレビューは自分しか削除できない。

## 目指した課題解決
年齢・性別問わず、宿泊施設利用者に思い出や感動等を基準に宿泊施設の評価を可視化してもらい、これから宿泊施設利用を検討しているユーザーの判断基準の材料になる物を目指しました。

## 洗い出した要件

| 優先順位 (高：3、中：2、低：1) | 機能    | 目的          | 詳細          | ストーリー(ユースケース)               | 見積もり (所要時間：〇h) |
| -------------------------- | ------ | ------------- | ------------ | ---------------------------- | -------------------- |
|  3  |    DB設計   | アプリ制作の全体像を把握する必要がある為、必要テーブルを洗い出す | 必要テーブルusers/sns_credentials/hotels/reviews |   |  5  |
|  3  | ユーザー管理 | ログインユーザーしか投稿やレビュー出来ない様に制限する | コントローラーによる制御を可能にする | ・ログインしているユーザーしか投稿やレビュー出来ない |  5  |
|  2  | SNS認証 | ユーザーアカウント登録方法の選択肢を増やす | SNSアカウント（Googleアカウン、Facabookアカウント）を利用したログイン方法を選択肢として追加する | ・ユーザーアカウントの登録方法を「手打ち入力」「Googleアカウントを利用」「Facabookアカウントを利用」の3つから選べるようにする  <br>・SNSアカウントを選択した場合、既にパスワードは入力されてる状態で表示される |  5  |
|  3  | 宿泊施設投稿 | 宿泊施設を投稿する | 複数条件を指定した上で投稿を可能にする | ・宿泊施設名、カテゴリー、画像の一つでも欠けていると投稿できない<br>・投稿できるとそのままレビュー画面に遷移する |  6  |
|  3  | 宿泊施設編集 | 宿泊施設を編集する | 複数条件を指定した上で更新を可能にする | ・宿泊施設一覧、検索先画面、レビュー画面、レビュー一覧画面から名前かカテゴリーをクリックすると編集画面に遷移する<br>・宿泊施設名とカテゴリーを選択すれば誰でも編集できる |  5  |
|  3  | レビュー投稿 | 宿泊施設のレビューする | 星評価機能やコメント欄を使用したレビューを可能にする | ・宿泊施設が投稿されている事が前提<br>・星の数を選択してレビューを行えば、投稿件数と星評価の統計が表示される<br>・コメントは無くてもレビュー可能 |  7  |
|  3  | レビュー削除 | 自身の投稿したレビューを削除する | 自身がレビューした内容の削除を可能にする | ・レビューをしている事が前提<br>・自分が行ったレビューを削除しレビュー件数と星評価の統計が更新される|  7  |
|  2  | カテゴリー検索 | カテゴリーから検索する事で条件を絞れるようにする | カテゴリーを使った絞り込みを可能にする | ・カテゴリーで検索で指定されたカテゴリーのみを絞り込む<br>・該当するカテゴリーの宿泊施設が有れば表示する |  6  |
|  2  | ページネーション | 大量に投稿された時に整理する | 投稿された宿泊施設件数に応じてページネーションを可能にする | ・一つのページに5件以上の投稿がされていれば次のページを作成し遷移用のリンクが表示される |  1  |
|  3  | S3 | 宿泊施設の投稿画像のリンク切れを解消する | AWSのサービスを使用して画像の長期保存を可能にする | ・画像のリンク切れを無くし投稿した画像が長期に渡り保存できる |  3  |
|  1  | 評価ボタン | 自身や他者のレビューに対して評価する | 自身や他者のレビューに対して評価ボタンを付け加える | ・投稿されたレビューに対して評価を行え、高評価ボタンを押すと高評価され、統計が変化する。<br>・高評価されたボタンは低評価に切り替わり、押すと自身の高評価を取り消し、統計が変化する | 8(未実装) |

## 実装機能紹介Gyazo
ユーザー登録
[![Image from Gyazo](https://i.gyazo.com/923ef8914f0f28b9b65b908d28fee0cd.gif)](https://gyazo.com/923ef8914f0f28b9b65b908d28fee0cd)

SNSユーザー登録(test testさんの場合)
[![Image from Gyazo](https://i.gyazo.com/6cd9ea402d0251200660a14180ac8f8f.gif)](https://gyazo.com/6cd9ea402d0251200660a14180ac8f8f)

ユーザーログイン
[![Image from Gyazo](https://i.gyazo.com/b643a80fda5009ffd80ffa36973660e6.gif)](https://gyazo.com/b643a80fda5009ffd80ffa36973660e6)

SNSユーザーログイン(test testさんの場合)
[![Image from Gyazo](https://i.gyazo.com/0cc44a34c5d200db94d764a85260bd76.gif)](https://gyazo.com/0cc44a34c5d200db94d764a85260bd76)

新しく宿泊施設を投稿する
[![Image from Gyazo](https://i.gyazo.com/f820f2daa38e300a236368dec21ec13f.gif)](https://gyazo.com/f820f2daa38e300a236368dec21ec13f)

レビューする
[![Image from Gyazo](https://i.gyazo.com/60bfc0cec1280e94a7630290a37ce060.gif)](https://gyazo.com/60bfc0cec1280e94a7630290a37ce060)

宿泊施設情報を変更する
[![Image from Gyazo](https://i.gyazo.com/a775be2a19e8964b773a0d80df8f54b3.gif)](https://gyazo.com/a775be2a19e8964b773a0d80df8f54b3)

自分のレビューを削除する
[![Image from Gyazo](https://i.gyazo.com/af9fc41581b78481981a1ad5a44f454a.gif)](https://gyazo.com/af9fc41581b78481981a1ad5a44f454a)

カテゴリー検索
[![Image from Gyazo](https://i.gyazo.com/246486382ca4c0b0cef63441df4aae8b.gif)](https://gyazo.com/246486382ca4c0b0cef63441df4aae8b)

ページネーション機能(投稿数が５件を超えると次のページが生成され、遷移できるようになる。)
[![Image from Gyazo](https://i.gyazo.com/2318db9f26c55b9472503942ce1d6db6.gif)](https://gyazo.com/2318db9f26c55b9472503942ce1d6db6)

## モデル単体テストコードGyazo

### user-model
[![Image from Gyazo](https://i.gyazo.com/b31f4b4dcafb0137af31d57ea9e0529c.png)](https://gyazo.com/b31f4b4dcafb0137af31d57ea9e0529c)

### hotel-model
[![Image from Gyazo](https://i.gyazo.com/0ff073fe14037692b965863b0a13abb1.png)](https://gyazo.com/0ff073fe14037692b965863b0a13abb1)

### review-model
[![Image from Gyazo](https://i.gyazo.com/947ac7982f77e63644f4fa02ed8a3182.png)](https://gyazo.com/947ac7982f77e63644f4fa02ed8a3182)


## 今後実装予定の機能
評価ボタンを実装して各レビューに対して反映できる様にしたいと考えています。


## データベース設計
[![Image from Gyazo](https://i.gyazo.com/6673539b389bea4d15dced154ff75fb6.png)](https://gyazo.com/6673539b389bea4d15dced154ff75fb6)

## sns_credentials テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| provider                  | string     | null: false                    |
| uid                       | string     | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## users テーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| name                      | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |

### Association
- has_many :reviews
- has_many :hotels
- has_many :sns_credentials

## hotelsテーブル

| Column      | Type   | Options     |
| ----------- | ------ | ------------|
| name        | string | null: false |
| category_id | int    | null: false |


### Association
- belongs_to :user
- has_many :reviews
- has_many :hotel_tags

## reviewsテーブル

| Column        | Type       | Options  
| ------------- | ---------- | ------------------------------ |
| comment       | text       |                                |
| user          | references | null: false, foreign_key: true |
| hotel         | references | null: false, foreign_key: true |
| total_score   | int        | null: false                    |


### Association
- belongs_to :user
- belongs_to :hotel


## パッケージ
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

## バージョン
ruby '2.6.5'

## 使用gem一覧
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem 'bulma-rails'
gem 'devise'
gem 'active_hash'

gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'pry-rails'
gem 'ransack'
gem 'kaminari'

gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem "omniauth-rails_csrf_protection"
gem 'omniauth', '~>1.9.1'

gem "aws-sdk-s3", require: false

group :development do
  gem 'rubocop', require: false
end