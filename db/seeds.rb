# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with(:truncation)
attributes = Hash.new

# Category
attributes[:category] = Hash.new
attributes[:category][:title] = %w{最新消息 系所簡介 組織成員 課程資訊 留學資訊 榮譽榜 常見問題 相片集錦 相關連結}
attributes[:category][:en_title] = %w{News About People Admission Exchange Alumni FAQ Gallery Link}
attributes[:category][:main_url] = %w{/posts /pages/about /members/faculty /pages/course /pages/exchange /pages/honors /pages/faq /gallery /pages/links}

# Page

attributes[:page] = Hash.new
attributes[:page][:title] = []
attributes[:page][:en_title] = []
attributes[:page][:url] = []
attributes[:page][:is_pure_link] = []
attributes[:page][:category_id] = []

## Category #1: 最新消息
attributes[:page][:title] += %w{一般公告 演講公告 留學公告 競賽公告 招生公告}
attributes[:page][:en_title] += %w{News Seminar International Contest Admission}
attributes[:page][:url] += %w{/post_categories/news /post_categories/seminar /post_categories/international /post_categories/contest /post_categories/admission}
attributes[:page][:is_pure_link] += [true, true, true, true, true]
attributes[:page][:category_id] += [1, 1, 1, 1, 1]

## Category #2: 系所簡介
attributes[:page][:title] += %w{主任的話 學習環境 本班特色 本班大事紀 IEEE認證}
attributes[:page][:en_title] += %w{Chairman Environment Feature History IEEE\ Certificate}
attributes[:page][:url] += %w{chairman environment feature history ieee}
attributes[:page][:is_pure_link] += [false, false, false, false, false]
attributes[:page][:category_id] += [2, 2, 2, 2, 2]

## Category #3 系所成員
attributes[:page][:title] += %w{班務委員 輔導教官與諮商老師 行政人員}
attributes[:page][:en_title] += %w{Faculty\ Commitee Consultant Staff}
attributes[:page][:url] += %w{/member_categories/faculty /member_categories/consultant /member_categories/staff}
attributes[:page][:is_pure_link] += [true, true, true]
attributes[:page][:category_id] += [3, 3, 3]

## Category #4 招生資訊
attributes[:page][:title] += %w{課程規劃 修業規定}
attributes[:page][:en_title] += %w{Course Curriculum}
attributes[:page][:url] += %w{courses curriculum}
attributes[:page][:is_pure_link] += [false, false, false]
attributes[:page][:category_id] += [4, 4, 4]

## Category #5 留學規劃
attributes[:page][:title] += %w{規劃主旨 姊妹校介紹 留學問題集錦 國外頂尖實驗室交流 國外姊妹校專題}
attributes[:page][:en_title] += %w{Program Sis}
attributes[:page][:url] += %w{courses curriculum}
attributes[:page][:is_pure_link] += [false, false, false]
attributes[:page][:category_id] += [4, 4, 4]

# MemberCategory
attributes[:member_category] = Hash.new
attributes[:member_category][:title] = %w{班務委員 輔導教官與諮商老師 行政人員}
attributes[:member_category][:en_title] = %w{Faculty\ Commitee Consultant Staff}
attributes[:member_category][:url] = %w{faculty consultant staff}

ActiveRecord::Base.transaction do 
  attributes.each do |model, model_attributes|
    objects = model_attributes.values.transpose
    model.to_s.camelize.constantize.import(model_attributes.keys, objects)
  end
end

