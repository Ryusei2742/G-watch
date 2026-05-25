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
  { name: 'ゲストユーザー', email: 'user@example.com' },
  { name: '佐藤 悠', email: 'sato@example.com' },
  { name: '高橋 莉子', email: 'takahashi@example.com' },
  { name: '中村 拓也', email: 'nakamura@example.com' },
  { name: '小林 みなみ', email: 'kobayashi@example.com' }
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
  {
    title: '機動戦士ガンダム',
    series: '宇宙世紀',
    year: 1979,
    recommended: 4.5,
    description: 'シリーズの原点として、戦争の中で成長していく若者たちの視点を軸に描いた作品です。古典的な雰囲気はありつつも、人物同士の距離感や選択の重さが今見ても印象に残ります。'
  },
  {
    title: 'Zガンダム',
    series: '宇宙世紀',
    year: 1985,
    recommended: 3.5,
    description: '前作から続く世界観を引き継ぎながら、組織同士の対立や登場人物の複雑な関係性をより濃く描いた作品です。明るさよりも緊張感のあるドラマを楽しみたい人に向いています。'
  },
  {
    title: 'ガンダムSEED',
    series: 'オルタナティブ',
    year: 2002,
    recommended: 4.0,
    description: '現代的なテンポと見やすいキャラクター描写で、シリーズを初めて見る人にも入りやすい作品です。友情や立場の違いが物語の軸になっており、次の展開を追いやすい構成です。'
  },
  {
    title: '鉄血のオルフェンズ',
    series: 'オルタナティブ',
    year: 2015,
    recommended: 3.5,
    description: '過酷な環境から自分たちの居場所をつかもうとする少年たちを中心にした作品です。泥臭い空気感や仲間同士の結びつきが特徴で、重めのドラマをじっくり見たい人に合います。'
  },
  {
    title: '水星の魔女',
    series: 'オルタナティブ',
    year: 2022,
    recommended: 4.5,
    description: '学園を舞台にした親しみやすい導入から、企業や家族関係をめぐる物語へ広がっていく作品です。映像の見やすさとテンポの良さがあり、最近の作品から試したい人にもおすすめです。'
  }
].map do |attrs|
  Work.create!(
    title: attrs[:title],
    description: attrs[:description],
    year: attrs[:year],
    series: attrs[:series],
    recommended: attrs[:recommended] || 0.0
  )
end

# レビュー
reviews_by_title = {
  '機動戦士ガンダム' => [
    { user: 'ゲストユーザー', rating: 5, status: 'watched', comment: '思っていたより見やすかったです。最初の一作として見ておくと、他のシリーズの見え方も変わりそうです。' },
    { user: '佐藤 悠', rating: 4, status: 'watched', comment: '派手さよりも人間関係の変化が印象に残りました。作画の時代感はありますが、物語の芯はかなり強いと思います。' },
    { user: '高橋 莉子', rating: 4, status: 'watched', comment: 'シリーズの出発点として見てみました。派手さだけではなく、長く語られている理由が少し分かった気がします。' },
    { user: '中村 拓也', rating: 5, status: 'watched', comment: '入門として少し身構えていましたが、想像よりもドラマとして見やすかったです。キャラクターの未熟さが丁寧に描かれていました。' }
  ],
  'Zガンダム' => [
    { user: '佐藤 悠', rating: 4, status: 'watched', comment: '全体的に重めで、見終わったあとに余韻が残る作品でした。人物の感情が簡単に整理できないところが魅力だと思います。' },
    { user: '高橋 莉子', rating: 4, status: 'watched', comment: '前作から続けて見ました。少し難しい部分もありましたが、世界観の広がり方に見応えがありました。' },
    { user: '小林 みなみ', rating: 4, status: 'watched', comment: '政治的な対立や組織の空気が濃く、気軽に見るというより集中して追いたい作品でした。好きな人が多いのも納得です。' }
  ],
  'ガンダムSEED' => [
    { user: 'ゲストユーザー', rating: 4, status: 'watched', comment: 'テンポがよくて見やすいです。初めてガンダムを見る人にもすすめやすそうだと感じました。' },
    { user: '中村 拓也', rating: 5, status: 'watched', comment: '見やすさとドラマ性のバランスが良かったです。序盤から続きが気になる作りで、最後まで一気に見進められました。' },
    { user: '小林 みなみ', rating: 4, status: 'watched', comment: '周りで名前を聞くことが多くて見てみました。絵柄や雰囲気が入りやすく、思ったよりテンポよく楽しめました。' },
    { user: '高橋 莉子', rating: 4, status: 'watched', comment: '感情のぶつかり合いが分かりやすく、シリーズ初心者でも置いていかれにくい印象でした。人におすすめしやすい一作です。' }
  ],
  '鉄血のオルフェンズ' => [
    { user: '佐藤 悠', rating: 4, status: 'watched', comment: '泥臭い雰囲気と仲間同士の距離感がよく出ていました。明るい作品ではありませんが、先が気になる力があります。' },
    { user: '中村 拓也', rating: 3, status: 'watched', comment: '重い展開も多いので好みは分かれそうです。ただ、独自の空気感があり、他シリーズとは違う魅力を感じました。' },
    { user: '小林 みなみ', rating: 4, status: 'watched', comment: '硬派な雰囲気があり、腰を据えて見る作品だと感じました。仲間同士の距離感が印象に残っています。' }
  ],
  '水星の魔女' => [
    { user: 'ゲストユーザー', rating: 5, status: 'watched', comment: '映像がきれいで入りやすかったです。最近の作品から見たい人にはかなり良さそうです。' },
    { user: '高橋 莉子', rating: 5, status: 'watched', comment: 'キャラクターの表情や会話のテンポが自然で、初回から引き込まれました。初めてのガンダムとしても選びやすいと思います。' },
    { user: '小林 みなみ', rating: 4, status: 'watched', comment: '明るい入り口と緊張感のある展開の差が印象的でした。話数も追いやすく、スクリーンショット映えする作品だと思います。' },
    { user: '中村 拓也', rating: 4, status: 'watched', comment: '新しい作品から見てみました。話数の区切りも追いやすく、最初の一本として選びやすい印象でした。' }
  ]
}

users_by_name = users.index_by(&:name)
works.each do |work|
  reviews_by_title.fetch(work.title).each do |review_attrs|
    Review.create!(
      work: work,
      user: users_by_name.fetch(review_attrs[:user]),
      rating: review_attrs[:rating],
      status: review_attrs[:status],
      comment: review_attrs[:comment]
    )
  end
end

puts 'Done seeding!'
