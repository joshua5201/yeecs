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
attributes[:category][:title] = %w{最新消息 系所簡介 組織成員 招生資訊 留學規劃 榮譽榜 常見問題 相片集錦 相關連結}
attributes[:category][:en_title] = %w{News About People Admission Exchange Honor FAQ Gallery Link}
attributes[:category][:main_url] = %w{/posts /pages/about /members/faculty /pages/course /pages/exchange_program /pages/award /pages/faq /gallery /pages/link}

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
attributes[:page][:url] += %w{course curriculum}
attributes[:page][:is_pure_link] += [false, false]
attributes[:page][:category_id] += [4, 4]

## Category #5 留學規劃
attributes[:page][:title] += %w{規劃主旨 姊妹校介紹 留學問題集錦 國外頂尖實驗室交流 國外姊妹校專題}
attributes[:page][:en_title] += %w{Exchange\ Program Affiliated\ Schools Exchange\ FAQ Lab\ Internship Exchange\ Story}
attributes[:page][:url] += %w{exchange_program affiliated_schools exhcange_faq lab_internship exchange_story}
attributes[:page][:is_pure_link] += [false, false, false, false, false]
attributes[:page][:category_id] += [5, 5, 5, 5, 5]

## Category #6 榮譽榜
attributes[:page][:title] += %w{學生優秀表現 大一書報專題 大三大四專題研究}
attributes[:page][:en_title] += %w{Award Freshman\ Project Research\ Project}
attributes[:page][:url] += %w{award freshman_project research_project}
attributes[:page][:is_pure_link] += [false, false, false]
attributes[:page][:category_id] += [6, 6, 6]

## /pages/faq, /pages/link
attributes[:page][:title] += %w{常見問題 相關連結}
attributes[:page][:en_title] += %w{FAQ Link}
attributes[:page][:url] += %w{faq link}
attributes[:page][:is_pure_link] += [false, false]
attributes[:page][:category_id] += [nil, nil]

# PostCategory
attributes[:post_category] = Hash.new
attributes[:post_category][:title] = %w{一般公告 演講公告 留學公告 競賽公告 招生公告}
attributes[:post_category][:en_title] = %w{Announcement Seminar International Contest Admission}
attributes[:post_category][:url] = %w{announcement seminar international contest admission}

# MemberCategory
attributes[:member_category] = Hash.new
attributes[:member_category][:title] = %w{班務委員 輔導教官與諮商老師 行政人員}
attributes[:member_category][:en_title] = %w{Faculty\ Commitee Consultant Staff}
attributes[:member_category][:url] = %w{faculty consultant staff}

# LinkBlock
attributes[:link_block] = Hash.new
attributes[:link_block][:title] = %w{高中生專區 留學資訊 課程資訊}
attributes[:link_block][:link] = %w{/public/highschool/ /pages/exchange_program /pages/course}

ActiveRecord::Base.transaction do 
  attributes.each do |model, model_attributes|
    objects = model_attributes.values.transpose
    model.to_s.camelize.constantize.import(model_attributes.keys, objects)
  end
end

Member.create([
  {name: '洪崇智', member_category_id: 1, title: '教授', full_title: '交通大學電機工程學系教授（兼電機資訊學士班主任）', education_background: '美國俄亥俄州立大學電機工程博士', content: ' 
2003, 2004- 旺宏電子青年講座教授<br>
經歷：<br>
Director @Pixelworks<br>
Staff Engoneer @Prominent Communication<br>
Sr. MTS @S3 Inc<br><br>

國科會計畫主持人：<br>
2006, 2007, 2008- Gbps無線網路之異質晶片整合系統設計-子計畫一：G-bps無線網路之CMOS類比數位轉換電路設計<br>
2003, 2004, 2005- 低功率系統之設計與自動化-子計畫六：奈米製程之低電壓類比濾波器設計<br>'}
])

Member.create([
  {name: '曹孝櫟', member_category_id: 1, title: '副教授', full_title: '交通大學資訊工程學系副教授（兼電機資訊學士班副主任）', education_background: '國立成功大學工程科學博士', content: '
   經歷：<br><br>
June 2010- Sept. 2010, July 2011- Sept. 2011, July 2012- June 2013: Visiting Professor, Dept of Computer Science, ETH Zurich, Switzerland<br>
Feb. 2004– Aug. 2009: Assistant Professor, CS/NCTU<br>
Feb. 2004– Dec. 2007: Technical Consultant, ITRI/CCL<br>
July 2007– Aug. 2007: Visiting Professor, Dept. of Electrical & Computer Engineering, University of Waterloo<br>
Oct. 1999– Feb. 2004: Researcher, ITRI/CCL<br>
June 1998– Oct. 1998: Visiting Scholar, Bell Labs./Lucent Technologies<br>
July 1996 – July 1997: Research Assistant, Academic Sinica<br>
June 1995– July 1996: Guest Software Engineering, ITRI/CCL<br><br>
榮譽事蹟：<br>
2013- 國科會傑出技術移轉貢獻獎<br>
2006 ~ 2013- 交通大學傑出人士榮譽獎勵<br>
2010- 教育部系統晶片人才培育計畫推廣成效優良教授<br>
2008- 李國鼎青年研究獎, 交通大學傑出教學獎<br>
2007- 教育部系統晶片人才培育計畫績優教授, 中國電機工程學會優秀青年電機工程師獎, 工業技術研究院優質專利獎, 交通大學優良教學獎, 潘文淵研究考察獎<br>
2004- 工研院研究成就獎<br>
2003- 經濟部特優科專計畫, 經濟部創新技術獎<br>
2002- 工研院研究論文獎<br>
2000- 工研院前瞻技術獎<br>
1999- 龍騰論文獎博士論文<br>'}
])

Member.create([
  {name: ' 蘇育德', member_category_id: 1, title: '教授', full_title: '交通大學電機工程學系教授', education_background: '美國南加州大學電機博士', content: '
   95-97年度國科會電信學門召集人<br>
2006-  指導學生獲中國電機工程青年論文獎<br>
1996- Best paper National Telecommunication Conference<br>
1993- Contribution Award of AOC Taipei Chapter/ AFCEA Taiwan Chapter<br>
1989- Outstanding performance and contributions of LinCom Corp<br>
  '}
])

Member.create([
  {name: '張添烜', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '國立交通大學電子工程系副教授', 
  education_background: '國立交通大學電子工程系博士', 
  content: '
   2007- 中國電機工程學會, 優秀青年電機工程師獎<br>
   2010- 台灣積體電路設計學會, 傑出年輕學者獎<br>
  '}
])

Member.create([
  {name: '陳富強', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '交通大學電機工程學系副教授', 
  education_background: '美國伊利諾香檳大學電機博士', 
  content: '
   2008 - 交大傑出人士榮譽獎勵<br>
2008-  績優教師<br>
2005 - 旺宏電子青年教授講座<br>
1998 - 美國IEEE AP-S Society Best Student Paper Award<br>
  '}
])

Member.create([
  {name: '廖育德', 
  member_category_id: 1, 
  title: '助理教授', 
  full_title: ' 交通大學電機工程學系助理教授', 
  education_background: '美國華盛頓大學電機工程學系博士', 
  content: '
   2015- 指導學生:林袚魄 獲得IC設計競賽類比組佳作,教育部<br>
2014- 指導學生 洪志豪 獲得特優晶片設計獎(RF組),CIC<br>
2014- 指導學生 黃士杰 獲得醫療電子聯盟論文競賽優勝,教育部<br>
2014- 指導學生 Fu-To Lin 獲得中國工程師學生分會論文獎(電機/電子組) 特優,中國工程師學會<br>
2005- 碩士論文獎第一名,中國電機工程師學會<br>
  '}
])

Member.create([
  {name: '吳重雨', 
  member_category_id: 1, 
  title: '教授', 
  full_title: '交通大學電子工程學系教授', 
  education_background: '國立交通大學電子工程博士', 
  content: '
   國科會第二期奈米國家型科技計劃總主持人<br>
國際創新創業協會理事長<br>
台灣生醫電子工程協會理事長<br>
國立交通大學校長<br>
IEEE fellow<br>
IEEE Third Millennium Medal<br>
教育部學術獎<br>
  '}
])

Member.create([
  {name: '蕭得聖', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '交通大學電機工程學系副教授', 
  education_background: '美國柏克萊加州大學機械系博士', 
  content: '
   國科會第二期奈米國家型科技計劃總主持人<br>
國際創新創業協會理事長<br>
台灣生醫電子工程協會理事長<br>
國立交通大學校長<br>
IEEE fellow<br>
IEEE Third Millennium Medal<br>
教育部學術獎<br>
  '}
])

Member.create([
  {name: '賴伯承', 
  member_category_id: 1, 
  title: '助理教授', 
  full_title: '交通大學電子工程學系助理教授', 
  education_background: '美國加州大學洛杉磯分校博士', 
  content: '
   指導學生參加Altera亞洲創新大賽獲得Outstanding Achievement
  '}
])

Member.create([
  {name: '林怡欣', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '交通大學光電工程學系副教授', 
  education_background: '美國中佛羅里達大學光學博士', 
  content: '
   2008- Glenn H. Brown Prizes<br>
2006- OSA NewFocus/ Bookham Award<br>
2009- 98學年度優良教學獎<br>
  '}
])

Member.create([
  {name: '黃乙白', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '交通大學光電工程學系副教授', 
  education_background: '國立交通大學光電博士', 
  content: '
   2007- Optical Photonics Taiwan (OPT) 2007 Best Student Award<br>
2010- 99學年度績優導師<br>
  '}
])

Member.create([
  {name: '單智君', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '交通大學資訊工程學系副教授', 
  education_background: '國立交通大學資訊博士', 
  content: '
   NSC Research Award<br>
NCTU Outstanding Teaching Award<br>
2009- 98學年度累計獲得三次傑出教學獎，現為本校榮譽教學教師<br>
  '}
])

Member.create([
  {name: '李毅郎', 
  member_category_id: 1, 
  title: '教授', 
  full_title: '交通大學資訊工程學系教授', 
  education_background: '國立清華大學資訊工程博士', 
  content: '
   Excellent Tutor Award 2006~2007, Outstanding Tutor Award 2010.<br>
Excellent Teaching Award 2008, 2012.<br>
Outstanding paper award: SASIMI 2009 (Japan)<br>
Best Paper award: VLSI Design/CAD Symposium 2013.<br>
  '}
])

Member.create([
  {name: '陳永昇', 
  member_category_id: 1, 
  title: '副教授', 
  full_title: '交通大學資訊工程學系副教授', 
  education_background: '國立台灣大學資訊工程博士', 
  content: '
   Assistant Professor, Department of Computer Science, National Chiao Tung University, 2003- 2010.<br>
Postdoc, Integrated Brain Research Laboratory, Taipei Veterans General Hospital, 2002-2003.<br>
Adjunct Instructor, Department of Economics, National Taiwan University, 2001- 2003.<br>
Postdoc, Laboratory of Intelligent Systems, Institute of Information Science, Academia Sinica, 2001-2002.<br>
Research Assistant, Institute of Information Science, Academia Sinica, 1995- 2001.<br>
  '}
])

Member.create([
  {name: '游逸平', 
  member_category_id: 1, 
  title: '助理教授', 
  full_title: '交通大學資訊工程學系助理教授', 
  education_background: '國立清華大學資訊工程學系博士', 
  content: '
   2015- Best Paper Award at the International Conference on Compilers, Architectures and Synthesis of Embedded Systems (CASES)<br>
2015- Excellent Teaching Award from National Chiao Tung University<br>
2014- His student, Poyu Chen, received the IICM Master Thesis Award<br>
2014- Distinguished Mentor Award from National Chiao Tung University<br>
2013- Distinguished Award from Ministry of Education for his course development project<br>
2012- Distinguished Mentor Award from National Chiao Tung University<br>
  '}
])
