# -*- encoding : utf-8 -*-
Administrator.create!(account: 'admin', password: '123456', password_confirmation: '123456', name: 'David Price', available: true)
Category.create!([
  { en_name: 'people', zh_name: '人物', permalink: 'people', position: 1, visible: true },
  { en_name: 'places', zh_name: '地方', permalink: 'places', position: 2, visible: true },
  { en_name: 'style', zh_name: '时尚', permalink: 'style', position: 3, visible: true },
  { en_name: 'shopping', zh_name: '购物', permalink: 'shopping', position: 4, visible: true },
  { en_name: 'food & drink', zh_name: '饮食', permalink: 'food-drink', position: 5, visible: true },
  { en_name: 'speed', zh_name: '时速', permalink: 'speed', position: 6, visible: true },
  { en_name: 'tech', zh_name: '高科技', permalink: 'tech', position: 7, visible: true },
  { en_name: 'culture', zh_name: '文化', permalink: 'culture', position: 8, visible: true },
  { en_name: 'music', zh_name: '音乐', permalink: 'music', position: 9, visible: true },
  { en_name: 'heritage', zh_name: '遗产', permalink: 'heritage', position: 10, visible: true }
])