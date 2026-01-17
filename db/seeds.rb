puts 'Seeding database...'

# 全削除（開発環境向け）
Review.destroy_all
Work.destroy_all
User.destroy_all

# 管理者ユーザー
admin = User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

# 一般ユーザー数人
users = [
  { name: 'アムロ', email: 'amuro@example.com' },
  { name: 'シャア', email: 'char@example.com' },
  { name: 'カミーユ', email: 'kamille@example.com' }
].map do |attrs|
  User.create!(
    name: attrs[:name],
    email: attrs[:email],
    password: 'password',
    password_confirmation: 'password'
  )
end

# 作品
works = [
  { title: '機動戦士ガンダム', series: '宇宙世紀', year: 1979, recommended: true },
  { title: 'Zガンダム', series: '宇宙世紀', year: 1985 },
  { title: 'ガンダムSEED', series: 'オルタナティブ', year: 2002 },
  { title: '鉄血のオルフェンズ', series: 'オルタナティブ', year: 2015 },
  { title: '水星の魔女', series: 'オルタナティブ', year: 2022, recommended: true }
].map do |attrs|
  Work.create!(
    title: attrs[:title],
    description: "#{attrs[:title]} の説明テキスト（サンプル）です。",
    year: attrs[:year],
    series: attrs[:series],
    recommended: attrs[:recommended] || false
  )
end

# レビュー（各作品に2件ずつ）
works.each do |work|
  2.times do
    user = users.sample
    Review.create!(
      work: work,
      user: user,
      rating: rand(3..5),
      comment: "#{work.title} に関するレビューコメント（サンプル）です。"
    )
  end
end

puts 'Done seeding!'
