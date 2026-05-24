# G-watch

G-watch は、ガンダムシリーズ作品の情報を管理し、ユーザーごとにレビューを投稿できる Web アプリです。

作品一覧・詳細表示、レビュー投稿、マイレビュー確認、管理者による作品管理機能を実装しています。

Rails の CRUD、認証、権限制御を中心に開発した個人開発ポートフォリオです。

## アプリURL

https://g-watch.onrender.com

※ Render Freeプランを利用しているため、初回アクセス時は起動まで数十秒かかる場合があります。

---

## テスト用アカウント

### 一般ユーザー

- Email: `user@example.com`
- Password: `password`

### 管理者ユーザー

- Email: `admin@example.com`
- Password: `password`

---

## 制作背景

ガンダムシリーズは作品数が多く、シリーズごとの整理や「どの作品から見るべきか」を把握しづらいと感じていました。

また、作品ごとの感想や評価をまとめて管理し、他ユーザーのレビューも参考にできるサービスがあれば便利だと考え、本アプリを制作しました。

G-watch では、作品情報の一覧・詳細表示だけでなく、ユーザーごとのレビュー投稿機能や、管理者による作品管理機能を実装しています。

Rails の CRUD、認証、権限制御などの基礎技術を活用しながら、実際にユーザーが利用することを意識して開発しました。

---

## 主な機能

### トップページ

※ 画像追加予定

### 作品一覧・作品詳細表示

※ 画像追加予定

### レビュー投稿機能

※ 画像追加予定

### 管理者機能

※ 画像追加予定

- ユーザー登録 / ログイン / ログアウト
- 作品一覧・作品詳細の閲覧
- 管理者ユーザーによる作品の作成・編集・削除
- ログインユーザーによるレビュー投稿
- 自分のレビュー一覧表示
- 自分のレビュー削除
- 作品詳細でレビュー平均評価を表示
- 未ログイン時のレビュー投稿制限

---

## 使用技術

| Category | Technology |
|---|---|
| Backend | Ruby 3.3.3 / Ruby on Rails 6.1 |
| Database | PostgreSQL |
| Frontend | ERB / SCSS |
| JavaScript | Webpacker |
| Authentication | bcrypt / has_secure_password |
| Test | RSpec / FactoryBot |
| Infrastructure | Render |
| Version Control | Git / GitHub |

---

## テーブル概要

### users

ユーザー情報、認証情報、管理者フラグを保持します。

| Column | Type |
|---|---|
| name | string |
| email | string |
| password_digest | string |
| admin | boolean |

---

### works

作品情報を保持します。

| Column | Type |
|---|---|
| title | string |
| description | text |
| year | integer |
| series | string |
| recommended | boolean |
| thumbnail | string |

---

### reviews

ユーザーが作品に投稿したレビューを保持します。

| Column | Type |
|---|---|
| user_id | references |
| work_id | references |
| rating | integer |
| comment | text |

---

## テーブル関連

- User has_many reviews
- Work has_many reviews
- Review belongs_to user
- Review belongs_to work

---

## セットアップ方法

### リポジトリを clone

```bash
git clone https://github.com/Ryusei2742/G-watch.git
cd G-watch
```

### 依存関係をインストール

```bash
bundle install
yarn install
```

### データベース作成・マイグレーション

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### ローカルサーバー起動

```bash
bundle exec rails server
```

ブラウザで以下へアクセスします。

```text
http://localhost:3000
```

---

## テスト実行方法

### 全テスト実行

```bash
bundle exec rspec
```

### request spec 実行例

```bash
bundle exec rspec spec/requests/works_spec.rb
bundle exec rspec spec/requests/reviews_spec.rb
```

### model spec 実行例

```bash
bundle exec rspec spec/models/review_spec.rb
```

---

## Render デプロイ手順

Render の Free プランと PostgreSQL を利用してデプロイしています。

### デプロイ手順

```bash
git add .
git commit -m "Deploy settings"
git push origin main
```

Render Dashboard で Blueprint を作成し、`render.yaml` を利用して以下を構築します。

- Web Service
- PostgreSQL Database

### 使用設定

- Build Command: `./bin/render-build.sh`
- Start Command: `bundle exec rails server`

### 環境変数

```text
RAILS_MASTER_KEY
```

には、ローカルの `config/master.key` の内容を設定します。

---

## 工夫した点

- レビュー投稿時に `user_id` をフォームから受け取らず、`current_user` から紐付ける設計にしました。
- 管理者ユーザーのみ作品の作成・編集・削除ができるよう権限制御を実装しました。
- レビュー削除は投稿者本人のみ可能にしました。
- 作品詳細ページでレビュー平均評価を計算して表示しました。
- 未ログインユーザーにはレビュー投稿フォームではなくログイン導線を表示しました。
- Render へのデプロイ時には Webpacker と Node.js 周りの依存関係問題を調査・修正し、本番環境で動作する構成に調整しました。

---

## 今後の改善点

- 作品検索・絞り込み機能の追加
- UI / UX の改善
- レスポンシブデザイン強化
- ページネーション機能の追加
- テスト範囲の拡充
- README への ER図追加
- 画像アップロード機能改善