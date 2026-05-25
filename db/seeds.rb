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
  },
  {
    title: '逆襲のシャア',
    series: '宇宙世紀',
    year: 1988,
    recommended: 4.2,
    description: '宇宙世紀の流れを知っているほど味わいが増す劇場作品です。短い時間の中に人物同士の関係や緊張感が詰まっており、シリーズの節目として印象に残ります。'
  },
  {
    title: 'ガンダムUC',
    series: '宇宙世紀',
    year: 2010,
    recommended: 4.3,
    description: '宇宙世紀の要素を現代的な映像とテンポで楽しめる作品です。過去作への接続を感じつつも、ひとつの物語として追いやすい構成になっています。'
  },
  {
    title: 'ガンダム00',
    series: 'オルタナティブ',
    year: 2007,
    recommended: 4.1,
    description: '現実に近い世界情勢を背景に、組織や理念の違いを軸に展開していく作品です。スタイリッシュな雰囲気と分かりやすい対立構造があり、テンポよく見進められます。'
  },
  {
    title: 'ガンダムW',
    series: 'オルタナティブ',
    year: 1995,
    recommended: 3.8,
    description: '個性の強いキャラクターと独特の空気感が魅力の作品です。時代を感じる部分もありますが、印象に残る場面が多く、シリーズの幅広さを感じられます。'
  },
  {
    title: 'Gガンダム',
    series: 'オルタナティブ',
    year: 1994,
    recommended: 3.7,
    description: '他のシリーズとはかなり違う熱量と勢いを持った作品です。分かりやすい盛り上がりがあり、シリアスな作品の合間に見ると新鮮に楽しめます。'
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
  ],
  '逆襲のシャア' => [
    { user: '佐藤 悠', rating: 4, status: 'watched', comment: '短い時間の中に緊張感があり、劇場作品らしい見応えがありました。宇宙世紀を少し追ってから見るとより楽しめそうです。' },
    { user: '中村 拓也', rating: 5, status: 'watched', comment: '映像や音楽の雰囲気が印象的で、見終わったあとにしばらく余韻が残りました。シリーズの節目として強い作品だと思います。' },
    { user: '小林 みなみ', rating: 4, status: 'watched', comment: '初見だと背景を少し調べたくなる部分もありましたが、人物同士の距離感には引き込まれました。' }
  ],
  'ガンダムUC' => [
    { user: 'ゲストユーザー', rating: 4, status: 'watched', comment: '映像が見やすくて、思ったより入りやすかったです。宇宙世紀に興味を持つきっかけになりました。' },
    { user: '高橋 莉子', rating: 5, status: 'watched', comment: '過去作の雰囲気を感じながらも、現代的なテンポで見られるのが良かったです。音楽も含めて印象に残りました。' },
    { user: '中村 拓也', rating: 4, status: 'watched', comment: '設定は濃いですが、話の流れは追いやすかったです。宇宙世紀作品を少し見たあとに戻ってきたい作品です。' }
  ],
  'ガンダム00' => [
    { user: '佐藤 悠', rating: 4, status: 'watched', comment: '現実寄りの世界観から始まるので、入り口が分かりやすかったです。組織ごとの考え方の違いも見どころでした。' },
    { user: '高橋 莉子', rating: 4, status: 'watched', comment: 'スタイリッシュでテンポがよく、初めて見るシリーズとしても選びやすいと思います。キャラクターの目的が追いやすいです。' },
    { user: '小林 みなみ', rating: 5, status: 'watched', comment: '序盤から引きが強く、続きが気になる作りでした。少し硬めの雰囲気が好きな人には合いそうです。' }
  ],
  'ガンダムW' => [
    { user: 'ゲストユーザー', rating: 3, status: 'watched', comment: '独特の雰囲気があって、最初は少し驚きました。キャラクターの強さが印象に残る作品です。' },
    { user: '佐藤 悠', rating: 4, status: 'watched', comment: '時代感はありますが、個性的な登場人物が多くて記憶に残ります。ほかの作品と並べると違いが分かりやすいです。' },
    { user: '中村 拓也', rating: 4, status: 'watched', comment: '勢いと雰囲気で見せる場面が多く、シリーズの幅を感じました。好みは分かれそうですが、自分は楽しめました。' }
  ],
  'Gガンダム' => [
    { user: 'ゲストユーザー', rating: 4, status: 'watched', comment: 'かなり熱い作品で、想像していたガンダムとは違う楽しさがありました。気分を変えたいときに見やすいです。' },
    { user: '高橋 莉子', rating: 3, status: 'watched', comment: '勢いが強いので最初は戸惑いましたが、分かりやすい盛り上がりがあって最後まで楽しく見られました。' },
    { user: '小林 みなみ', rating: 4, status: 'watched', comment: 'シリアスな作品が続いたあとに見ると新鮮でした。キャラクターの熱量が高く、印象に残る場面が多いです。' }
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
