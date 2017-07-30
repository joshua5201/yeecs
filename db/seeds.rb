# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

attributes = Hash.new

# Category
attributes[:category] = Hash.new
attributes[:category][:title] = %w{最新消息 系所簡介 組織成員 課程資訊 留學資訊 榮譽榜 常見問題 相片集錦 相關連結}
attributes[:category][:en_title] = %w{News About People Admission Exchange Alumni FAQ Gallery Link}
attributes[:category][:main_url] = %w{/posts /pages/about /members/faculty /pages/course /pages/international /pages/honors /pages/faq /gallery /pages/links}

# MemberCategory
attributes[:member_category] = Hash.new
attributes[:member_category][:title] = %w{班務委員 工作人員}
attributes[:member_category][:url] = %w{faculty staff}

ActiveRecord::Base.transaction do 
  attributes.each do |model, model_attributes|
    objects = model_attributes.values.transpose
    model.to_s.camelize.constantize.import(model_attributes.keys, objects)
  end
end

=begin
MemberCategory.create([
  {title: '班務委員', url: 'faculty'},
  {title: '工作人員', url: 'staff'}
])

Member.create([
  {name: '洪崇智', member_category_id: 1, title: '教授', full_title: '交通大學電機工程學系教授（兼電機資訊學士班主任）', content: ' 2003, 2004- 旺宏電子青年講座教授
經歷：
Director @Pixelworks
Staff Engoneer @Prominent Communication
Sr. MTS @S3 Inc

國科會計畫主持人：
2006, 2007, 2008- Gbps無線網路之異質晶片整合系統設計-子計畫一：G-bps無線網路之CMOS類比數位轉換電路設計
2003, 2004, 2005- 低功率系統之設計與自動化-子計畫六：奈米製程之低電壓類比濾波器設計'}
])

Member.create([
  {name: '曹孝櫟', member_category_id: 1, title: '副教授', full_title: '交通大學資訊工程學系副教授（兼電機資訊學士班副主任）', content: 'dawdwadwad;lwajd;kwad dawdaw  wad adawd aふぁあああダアDだ　安田D安田Dアダだwdあああああああ　ｄｓっｄｗｄｗｇｗｇｆｗ'}
])

Category.create([
  {title: "最新消息", en_title: "News", main_url: "/posts"}, 
  {title: "系所簡介", en_title: "About", main_url: "/pages/about"}, 
  {title: "組織成員", en_title: "People", main_url: "/members"}, 
  {title: "課程資訊", en_title: "Admission", main_url: "/pages/admission"}, 
  {title: "留學資訊", en_title: "Exchange", main_url: "/pages/exchange"}, 
  {title: "榮譽榜", en_title: "Alumni", main_url: "/pages/alumni"}, 
  {title: "常見問題", en_title: "FAQ", main_url: "/pages/faq"}, 
  {title: "相片集錦", en_title: "Gallery", main_url: "/gallery"}, 
  {title: "相關連結", en_title: "Link", main_url: "/pages/link"}, 
])

Page.create([
  {title: "一般公告", en_title: 'Announcement', url: '/posts', is_pure_link: true, category_id: 1},
  {title: "演講公告", en_title: 'Seminar', url: '/seminars', is_pure_link: true, category_id: 1},
  {title: "班務委員", en_title: 'Faculty', url: '/member_categories/faculty', is_pure_link: true, category_id: 3}])
=end
