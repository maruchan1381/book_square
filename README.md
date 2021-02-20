# Book_square 

### 子ども用読書管理アプリ

## 概要

* 子ども(対象：小学生)自身が読んだ本を記録していく。
* 子どもが使えるように、シンプルで簡単な操作。
* タイトルで検索ができる。
* 読んだ日付、感想と共に表紙の画像を残すことで、視覚的に管理しやすい。

## アプリケーションURL

https://book-square-29607.herokuapp.com/

## テスト用アカウント

* Basic認証のID/パスワード
admin/1234
* テスト用ログインID/パスワード
pepper@gmail.com/pepper321


## 利用方法

* トップページから新規登録・ログイン
![新規投稿画面](https://gyazo.com/7ecab8d0517986ee5f2d5d2860bbd43f/raw)


* 一覧画面の右上ボタンから、本の検索画面へ遷移
![トップ画面](https://gyazo.com/e29f833db9b38c56a0368292528a1cb9/raw)


* 本のタイトルを入力して検索を行うと結果が出力(表紙の画像、タイトル、作者)
![検索画面](https://gyazo.com/4d457ad1d30f004a6b46ff47a4fedbf6/raw)


* よんだよ!ボタンを押すと、日付と感想を入力できる
* きろくするボタンを押すと、トップページの一覧画面へ遷移
![感想入力画面](https://gyazo.com/20c0f52f41a0c28fafd44aace0d52112/raw)


* 一覧画面の右上ボタンから、マイページ(自分の本棚)へ遷移(今まで読んだ本の冊数がわかる)
* マイページ(自分の本棚)よりレビュー詳細をみることができる
![自分の本棚](https://gyazo.com/89ba239008033b50e7c13b4028116bef/raw)



## 課題解決

| 課題                                                        | 課題解決                                         |
|------------------------------------------------------------|-------------------------------------------------|
| 図書館などでたくさん本を借りるが、同じ本を借りてしまう              | 記録に残すことで同じ本を借りてしまうことがなくなる       |
| 手書きでノートに文字だけを記録していくと、振り返った時にわかりにくい   | 画像と共に記録を残すことで視覚的にとてもわかりやすい    |
| 手書きだと、作者などまで記録に残すのは手間がかかり、誤字の可能性もある | 検索を使うことで、タイトルや作者を正確に簡単に記録できる |
| 既存のアプリケーションは大人が使う仕様になっており、複雑で難しい      | シンプルな作りで低学年の子供でも扱うことができる        |


## 機能一覧

| 機能           | 概要                                  |
|---------------|---------------------------------------|
| ユーザー管理機能 | 新規登録・ログイン・ログアウトができる      |
| 読書一覧表示機能 | みんなの本棚を見ることができる            |
| 書籍検索機能    | 書籍をタイトルから検索することができる      |
| 書籍登録機能    | 検索結果から選択し、登録ができる           |
| メモ機能       | 感想と日付を記録することができる           |
| マイページ機能  | ログイン中のユーザーの本棚を見ることができる |


## 開発環境

* VScode
* Ruby
* Rails
* mysql
* heroku


# DB設計

## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :books


## books テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| image_url   | string     | null: false                    |
| author      | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user


 ## reviews テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| description | text       | null: false                    |
| date        | date       | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| book_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :user