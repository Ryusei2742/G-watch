# G-watch

G-watch は、ガンダムシリーズ作品の情報を管理し、ログインユーザーが作品ごとにレビューを投稿できる Web アプリです。

作品の一覧・詳細表示、レビュー投稿、マイレビュー確認、管理者による作品管理を行えます。Rails の基本的な CRUD、セッション認証、権限制御を中心に実装した個人開発ポートフォリオです。

## アプリURL

https://g-watch.onrender.com

## テスト用アカウント

### 一般ユーザー

- Email: `user@example.com`
- Password: `password`

### 管理者ユーザー

- Email: `admin@example.com`
- Password: `password`

## 制作背景

Rails の CRUD、認証、権限制御を実践的に学ぶことを目的として制作しました。

題材には自分の興味関心であるガンダムシリーズを選び、作品情報の管理とレビュー機能を組み合わせたアプリとして設計しました。

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
- Render

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

## Render デプロイ手順

Render の Free プランと PostgreSQL を利用する場合は、`render.yaml` を使って Web Service と Database を作成します。

事前に変更内容を GitHub に push します。

```bash
git add .
git commit -m "Add Render deployment settings"
git push origin main
```

Render Dashboard で Blueprint を作成し、このリポジトリを選択します。`render.yaml` により、以下の設定が使われます。

- Build Command: `./bin/render-build.sh`
- Start Command: `bundle exec rails server`
- Database: Render PostgreSQL Free plan

環境変数 `RAILS_MASTER_KEY` は Render Dashboard で手動設定します。値にはローカルの `config/master.key` の内容を設定してください。

初回デプロイ後は、以下の動作を確認します。

- トップページが表示されること
- 作品一覧・作品詳細が表示されること
- ログインできること
- レビュー投稿ができること

Render の Free プランでは、一定時間アクセスがないと Web Service がスリープします。また、Free PostgreSQL には利用期限があります。継続公開する場合は有料プランへの移行を検討してください。

## 工夫した点

- レビュー投稿時に `user_id` をフォームから受け取らず、`current_user` から紐付ける設計にしました。
- 作品の作成・編集・削除は管理者ユーザーに限定し、権限制御を実装しました。
- レビュー削除は投稿者本人のみ可能にしました。
- 作品詳細ページでレビュー平均評価を計算して表示しました。
- 未ログインユーザーにはレビュー投稿フォームではなくログイン導線を表示しました。
- Render へのデプロイ時には Webpacker と Node.js 周りの依存関係問題を調査・修正し、本番環境で動作する構成に調整しました。

## 今後の改善点

- 作品検索・絞り込み機能の追加
- バリデーションとエラーメッセージ表示の改善
- UI / レスポンシブ対応の改善
- README に ER 図画像を追加
- テスト範囲の拡充
- ページネーション機能の追加