# みゅじから Musicolor

YoutubeのURLより音楽を共有するWebアプリケーションです。
自分の好きな音楽を共有したり、他のユーザーの好きな音楽を知ることができます。
コメントやいいねをすることでユーザーと音楽を通してつながることができます。
レスポンシブ対応しているのでスマホで利用することもできます。

URLはこちら  
http://musicolor.herokuapp.com

![2021-11-23](https://user-images.githubusercontent.com/62203578/142884877-b3fc67ba-4738-4706-8d28-b4cf4cd1e1ea.png)

## 使用技術

* Ruby  2.6.3
* Ruby on Rails 6.1.3
* Puma  5.3.2
* PostgreSQL  1.1.4
* Heroku

## 機能一覧

* ログイン機能
  * ゲストログイン
* ユーザー登録
* 投稿機能
  * Youtube埋め込み
* いいね機能(Ajax)
* コメント機能(Ajax)
* ページネーション(kaminari)
