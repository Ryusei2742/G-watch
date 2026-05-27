# G-watch

ガンダムシリーズ作品のレビュー共有サービスです。  
作品情報の閲覧、レビュー投稿、平均評価の確認、視聴記録の整理を行えます。

---

## サービス概要

G-watch は、ガンダムシリーズ作品の情報閲覧とレビュー投稿ができる Web アプリです。

ガンダムシリーズは作品数が多く、初見ユーザーが「どこから見るべきか」「他ユーザーがどう感じたか」を把握しづらいと感じたことから制作しました。

G-watch では、作品ごとのレビューや平均評価を一覧化し、シリーズ選びや視聴記録を整理しやすい構成を目指しています。

- サービスURL: `https://your-app-url.example.com`
- GitHub: `https://github.com/your-name/G-watch`

---

## 主な機能

- ユーザー登録 / ログイン / ログアウト
- 作品一覧の閲覧
- 作品詳細の閲覧
- 作品ごとのレビュー投稿
- 平均評価とレビュー数の表示
- 自分のレビュー一覧表示
- 自分のレビュー削除
- 管理者による作品の作成 / 編集 / 削除

---

## 使用技術

| Category | Technology |
| --- | --- |
| Backend | Ruby 3.3 / Ruby on Rails 6.1 |
| Database | PostgreSQL |
| Frontend | ERB / SCSS |
| Infrastructure | Render |
| Authentication | has_secure_password |
| Test | RSpec / FactoryBot |

---

## セットアップ

```bash
git clone https://github.com/your-name/G-watch.git
cd G-watch

bundle install
yarn install

rails db:create
rails db:migrate
rails db:seed

bin/dev
```

---

## テスト

```bash
bundle exec rspec
```

---

## 画面一覧

### トップページ

![トップページ](screenshots/top.png)

### 作品一覧

![作品一覧](screenshots/works-index.png)

### 作品詳細

![作品詳細](screenshots/work-show.png)

### マイレビュー

![マイレビュー](screenshots/reviews.png)

### ログイン

![ログイン](screenshots/login.png)

### ユーザー登録

![ユーザー登録](screenshots/signup.png)

---

## 工夫した点

- レビュー投稿時に `user_id` をフォームから受け取らず、ログイン中ユーザーへ自動紐付けする構成にしました。
- 一覧画面の並び替え処理を controller 側へ移動し、view ロジックを整理しました。
- 作品一覧ではカードUIを採用し、シリーズごとに抽象的なグラデーションと略称バッジを用いて視認性を改善しました。
- 作品詳細ページでは、平均評価 → レビュー本文へ自然に視線が流れるよう情報設計を調整しました。
- レビュー一覧では情報密度と可読性を意識し、2カラムレイアウトと compact なレビューカードUIへ改善しました。
- ログイン / ユーザー登録画面は、全体UIトーンに合わせて統一感のあるフォームデザインへ調整しました。
- 管理者機能と一般ユーザー機能を分離し、作品管理とレビュー投稿の責務を整理しました。
- RSpec による request spec / model spec を導入し、主要機能の動作確認を行っています。

---

## 今後の改善

- 作品検索・絞り込み機能
- ページネーション機能
- レビュー編集機能
- お気に入り機能
- タグ分類機能
- レスポンシブUIのさらなる最適化
- テスト範囲の拡充
- ER図の追加
- 画面スクリーンショットの追加