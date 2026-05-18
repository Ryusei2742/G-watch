# G-watch

G-watch は、ガンダムシリーズ作品の情報を管理し、ログインユーザーが作品ごとにレビューを投稿できる Web アプリです。

作品の一覧・詳細表示、レビュー投稿、マイレビュー確認、管理者による作品管理を行えます。Rails の基本的な CRUD、セッション認証、権限制御を中心に実装した個人開発ポートフォリオです。

## 主な機能

- ユーザー登録 / ログイン / ログアウト
- 作品一覧・作品詳細の閲覧
- 管理者ユーザーによる作品の作成・編集・削除
- ログインユーザーによるレビュー投稿
- 自分のレビュー一覧表示
- 自分のレビュー削除
- 作品詳細でレビュー平均評価を表示
- 未ログイン時のレビュー投稿制限

## 使用技術

- Ruby `3.3.3`
- Ruby on Rails `6.1`
- PostgreSQL
- ERB / SCSS
- Webpacker
- bcrypt / `has_secure_password`
- RSpec / FactoryBot

## テーブル概要

### users

ユーザー情報、認証情報、管理者フラグを保持します。

主なカラム:

- `name`
- `email`
- `password_digest`
- `admin`

### works

作品情報を保持します。

主なカラム:

- `title`
- `description`
- `year`
- `series`
- `recommended`
- `thumbnail`

### reviews

ユーザーが作品に投稿したレビューを保持します。

主なカラム:

- `user_id`
- `work_id`
- `status`
- `rating`
- `comment`

### 関連

- `User has_many reviews`
- `Work has_many reviews`
- `Review belongs_to user`
- `Review belongs_to work`

## セットアップ方法

```bash
git clone https://github.com/Ryusei2742/G-watch.git
cd G-watch
```

依存関係をインストールします。

```bash
bundle install
yarn install
```

データベースを作成し、マイグレーションと seed を実行します。

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

ローカルサーバーを起動します。

```bash
bundle exec rails server
```

ブラウザで `http://localhost:3000` を開きます。

## テスト実行方法

全テストを実行します。

```bash
bundle exec rspec
```

request spec の実行例です。

```bash
bundle exec rspec spec/requests/works_spec.rb
bundle exec rspec spec/requests/reviews_spec.rb
```

model spec の実行例です。

```bash
bundle exec rspec spec/models/review_spec.rb
```

## 工夫した点

- レビュー投稿時に `user_id` をフォームから受け取らず、`current_user` から紐付ける設計にしました。
- 作品の作成・編集・削除は管理者ユーザーに限定しました。
- レビュー削除は投稿者本人のみ可能にしました。
- 作品詳細ページでレビュー平均評価を計算して表示しました。
- 未ログインユーザーにはレビュー投稿フォームではなくログイン導線を表示しました。

## 今後の改善点

- 作品検索・絞り込み機能の追加
- バリデーションとエラーメッセージ表示の改善
- UI / レスポンシブ対応の改善
- README に ER 図画像を追加
- デプロイ手順または公開 URL の追記
- テスト範囲の拡充
