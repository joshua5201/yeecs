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
attributes[:category][:main_url] = %w{/posts /pages/feature /member_categories/ /pages/course /pages/exchange_program /pages/award /pages/faq /gallery /pages/link}
attributes[:category][:en_hidden] = [false, false, false, false, false, true, true, true, true]

# Page

attributes[:page] = Hash.new
attributes[:page][:title] = []
attributes[:page][:en_title] = []
attributes[:page][:url] = []
attributes[:page][:is_pure_link] = []
attributes[:page][:category_id] = []

## Category #1: 最新消息
attributes[:page][:title] += %w{一般公告 演講公告 留學公告 競賽公告 招生公告}
attributes[:page][:en_title] += %w{Announcement Seminar International Contest Admission}
attributes[:page][:url] += %w{/post_categories/announcement /post_categories/seminar /post_categories/international /post_categories/contest /post_categories/admission}
attributes[:page][:is_pure_link] += [true, true, true, true, true]
attributes[:page][:category_id] += [1, 1, 1, 1, 1]

## Category #2: 系所簡介
attributes[:page][:title] += %w{主任的話 學習環境 本班特色 本班大事紀 IEEE認證}
attributes[:page][:en_title] += %w{Chairman Environment Feature History IEEE\ Certificate}
attributes[:page][:url] += %w{chairman environment feature history ieee}
attributes[:page][:is_pure_link] += [false, false, false, false, false]
attributes[:page][:category_id] += [2, 2, 2, 2, 2]

## Category #3 系所成員
attributes[:page][:title] += %w{單位主管 班務委員 輔導教官 諮商老師 行政人員}
attributes[:page][:en_title] += %w{Manager Faculty\ Commitee Millitary Instructor Consultant Staff}
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
attributes[:page][:url] += %w{exchange_program /affiliated_schools exhcange_faq lab_internship exchange_story}
attributes[:page][:is_pure_link] += [false, true, false, false, false]
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
attributes[:member_category][:title] = %w{單位主管 班務委員 輔導教官 諮商老師 行政人員}
attributes[:member_category][:en_title] = %w{Manager Faculty\ Commitee Millitary Instructor Consultant Staff}
attributes[:member_category][:url] = %w{faculty consultant staff}

# MemberDepartment
attributes[:member_department] = Hash.new
attributes[:member_department][:title] = %w{電機系 電子系 光電系 資工系}
attributes[:member_department][:en_title] = %w{ECE EE IEO CS}

# LinkBlock
attributes[:link_block] = Hash.new
attributes[:link_block][:title] = %w{高中生專區 留學資訊 課程資訊}
attributes[:link_block][:link] = %w{/public/highschool/ /pages/exchange_program /pages/course}

# AffiliatedSchool
attributes[:affiliated_school] = Hash.new
attributes[:affiliated_school][:title] = %w{美國伊利諾大學香檳校區 美國卡內基美濃大學 美國紐約大學}
attributes[:affiliated_school][:en_title] = %w{University\ of\ Illinois\ at\ Urbana-Champaign Carnegie\ Mellon\ University New\ York\ University}
attributes[:affiliated_school][:url] = %w{http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=2 http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=1 https://www.nyu.edu/ }

ActiveRecord::Base.transaction do 
  attributes.each do |model, model_attributes|
    objects = model_attributes.values.transpose
    model.to_s.camelize.constantize.import(model_attributes.keys, objects)
  end
end

AffiliatedSchool.create([
  {title: '美國紐澤西理工學院',
   en_title: 'New Jersey Institute of Technology',
   url: 'https://www.njit.edu/'}
])

AffiliatedSchool.create([
  {title: '美國華盛頓大學',
   en_title: 'University of Washington-Seattle',
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=4'}
])

AffiliatedSchool.create([
  {title: '比利時魯汶大學',
   en_title: 'Katholieke Universiteit',
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=3'}
])

AffiliatedSchool.create([
  {title: '德國慕尼黑工業大學',
   en_title: 'Technische University Munchen',
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=16'}
])

AffiliatedSchool.create([
  {title: '德國漢諾瓦萊布尼茲大學',
   en_title: 'Leibniz Universitat Hannover',
   url: 'https://www.uni-hannover.de/en/'}
])

AffiliatedSchool.create([
  {title: '德國阿亨工業大學',
   en_title: 'RWTH Aachen University',
   url: 'http://www.rwth-aachen.de/cms/root/Zielgruppenportale/~uzn/Internationale/?lidx=1'}
])

AffiliatedSchool.create([
  {title: '土耳其柯克大學',
   en_title: 'KOC University',
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=17'}
])

AffiliatedSchool.create([
  {title: '法國高等電力學院',
   en_title: "Ecole Superieure d' Electricite",
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=5'}
])

AffiliatedSchool.create([
  {title: '法國國立電信學院管理學院',
   en_title: "Telecom and Management Sudparis",
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=7'}
])

AffiliatedSchool.create([
  {title: '法國里昂天主教工藝技術學院',
   en_title: "ECAM Lyon",
   url: 'http://www.ecamengineering.com/'}
])

AffiliatedSchool.create([
  {title: '日本筑波大學',
   en_title: "Graduate School of Pure and Applied Sciences",
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=6'}
])

AffiliatedSchool.create([
  {title: '日本名古屋大學',
   en_title: "Nagoya University",
   url: 'http://www.ece.nctu.edu.tw/globalization/co_detail.aspx?nid=18'}
])

AffiliatedSchool.create([
  {title: '日本奈良先端科學技術大學院大學',
   en_title: "Nara Institute of Science and Technology",
   url: 'http://www.naist.jp/en/'}
])

AffiliatedSchool.create([
  {title: '香港香港大學',
   en_title: "University of Hong Kong",
   url: 'http://www.hku.hk/'}
])

AffiliatedSchool.create([
  {title: '中國上海交大',
   en_title: "",
   url: ''}
])


# Managers
#
Member.create([
  {name: '洪崇智', member_category_id: 1, title: '教授', full_title: '交通大學電機工程學系教授（兼電機資訊學士班主任）', education_background: '美國俄亥俄州立大學電機工程博士', 
content: ' 
姓名：洪崇智<br>
聯絡電話：03-5712121 #54535<br>
Email：cchung@mail.nctu.edu.tw<br>
Office Hour：Tuesday CD、Wednesday CD、Thursday CD<br>
專長領域：類比與混合信號積體電路設計、電源管理積體電路設計、生醫積體電路設計<br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/">個人網址</a><br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/" >實驗室：類比積體電路實驗室</a><br>
',
en_content: ' 
Name：Chung-Chih Hung<br>
Contact：03-5712121 #54535<br>
Email：cchung@mail.nctu.edu.tw<br>
Office Hour：Tuesday CD、Wednesday CD、Thursday CD<br>
Research Field：Analog and Mixed-Signal IC Design, Power Management IC Design, Biomedical IC Design<br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/">Homepage</a><br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/" >Lab. ：Analog & Mixed-Signal Integrated Circuit Laboratory</a><br>
'
}])

Member.create([
  {name: '曹孝櫟', member_category_id: 1, title: '副教授', full_title: '交通大學資訊工程學系副教授（兼電機資訊學士班副主任）', education_background: '國立成功大學工程科學博士', 
content: '
姓名：曹孝櫟<br>
聯絡電話：03-5712121 #54717<br>
Email：sltsao@cs.nctu.edu.tw<br>
Office Hour：Monday CDGH、Wednesday CD<br>
專長領域：節能計算、嵌入式系統、無線網路<br>
<a href="http://people.cs.nctu.edu.tw/~sltsao/">個人網址：</a><br>
實驗室：綠色運算與嵌入式系統實驗室
',
en_content: '
姓名：曹孝櫟<br>
聯絡電話：03-5712121 #54717<br>
Email：sltsao@cs.nctu.edu.tw<br>
Office Hour：Monday CDGH、Wednesday CD<br>
專長領域：節能計算、嵌入式系統、無線網路<br>
<a href="http://people.cs.nctu.edu.tw/~sltsao/">個人網址：</a><br>
實驗室：綠色運算與嵌入式系統實驗室
'}
])

# Member

Member.create([
  {name: '洪崇智', member_category_id: 2, member_department_id: 1, title: '教授', full_title: '交通大學電機工程學系教授（兼電機資訊學士班主任）', education_background: '美國俄亥俄州立大學電機工程博士', 
content: ' 
姓名：洪崇智<br>
聯絡電話：03-5712121 #54535<br>
Email：cchung@mail.nctu.edu.tw<br>
Office Hour：Tuesday CD、Wednesday CD、Thursday CD<br>
專長領域：類比與混合信號積體電路設計、電源管理積體電路設計、生醫積體電路設計<br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/">個人網址</a><br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/" >實驗室：類比積體電路實驗室</a><br>
',
en_content: ' 
Name：Chung-Chih Hung<br>
Contact：03-5712121 #54535<br>
Email：cchung@mail.nctu.edu.tw<br>
Office Hour：Tuesday CD、Wednesday CD、Thursday CD<br>
Research Field：Analog and Mixed-Signal IC Design, Power Management IC Design, Biomedical IC Design<br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/">Homepage</a><br>
<a href="http://cmbsd.cm.nctu.edu.tw/~aiclab/" >Lab. ：Analog & Mixed-Signal Integrated Circuit Laboratory</a><br>
'
}])

Member.create([
  {name: '曹孝櫟', member_category_id: 2, member_department_id: 4, title: '副教授', full_title: '交通大學資訊工程學系副教授（兼電機資訊學士班副主任）', education_background: '國立成功大學工程科學博士', 
content: '
姓名：曹孝櫟<br>
聯絡電話：03-5712121 #54717<br>
Email：sltsao@cs.nctu.edu.tw<br>
Office Hour：Monday CDGH、Wednesday CD<br>
專長領域：節能計算、嵌入式系統、無線網路<br>
<a href="http://people.cs.nctu.edu.tw/~sltsao/">個人網址：</a><br>
實驗室：綠色運算與嵌入式系統實驗室
',
en_content: '
姓名：曹孝櫟<br>
聯絡電話：03-5712121 #54717<br>
Email：sltsao@cs.nctu.edu.tw<br>
Office Hour：Monday CDGH、Wednesday CD<br>
專長領域：節能計算、嵌入式系統、無線網路<br>
<a href="http://people.cs.nctu.edu.tw/~sltsao/">個人網址：</a><br>
實驗室：綠色運算與嵌入式系統實驗室
'}
])

Member.create([
  {name: ' 蘇育德', member_category_id: 2, member_department_id: 1, title: '教授', full_title: '交通大學電機工程學系教授', education_background: '美國南加州大學電機博士', 
content: '
姓名：蘇育德<br>
聯絡電話：03-5731820<br>
Email：ytsu@mail.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
專長領域：通訊系統設計、無線網路、統計信號處理、錯誤控制<br>
<a href="http://www.eed.nctu.edu.tw/people/bio.php?PID=87">個人網址</a><br>
實驗室：通訊與網路研究室
  ',
  en_content: '
Name：Su Yu Ted<br>
Contact：03-5731820<br>
Email：ytsu@mail.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
Research Field：Communication System Design, Wireless Networks, Statistical Signal Processing, Error Control Theory<br>
<a href="http://www.eed.nctu.edu.tw/people/bio.php?PID=87">homepage</a><br>
Lab. ：Communication and Network Research Lab
  '}
])

Member.create([
  {name: '張添烜', 
  member_category_id: 2, 
  member_department_id: 2,
  title: '副教授', 
  content: '
姓名：張添烜<br>
聯絡電話：03-5731925<br>
Email：tschang@twins.ee.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
專長領域：系統晶片設計、多媒體訊號處理、計算機結構<br>
<a href="https://sites.google.com/site/tiansheuanchang/">個人網址</a><br>
實驗室：VLSI Signal Processing Lab
  ',
  en_content: '
Name：Tian-Sheuan Chang<br>
Contact：03-5731925<br>
Email：tschang@twins.ee.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
Research Field：System-on-Chip Design, Multimedia Signal Processing, Computer Architecture<br>
<a href="https://sites.google.com/site/tiansheuanchang/">Homepage</a><br>
Lab. ：VLSI Signal Processing Lab
'}
])

Member.create([
  {name: '陳富強', 
  member_category_id: 2, 
  member_department_id: 2, 
  title: '副教授', 
  full_title: '交通大學電機工程學系副教授', 
  education_background: '美國伊利諾香檳大學電機博士', 
  content: '
姓名：陳富強<br>
聯絡電話：03-5131428<br>
Email：fchen@faculty.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
專長領域：應用電磁、微波工程、天線設計、手機行動通訊<br>
<a href="http://www.eed.nctu.edu.tw/people/bio.php?PID=93">個人網址</a>
實驗室：應用電磁實驗室
  ', en_content: '
Name：Chen, Fu-Chiarng<br>
Contact：03-5131428<br>
Email：fchen@faculty.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
Research Field：Applied Electromagnetics, Microwave Engineering, Antenna Design, Mobile Phone Communication System<br>
<a href="http://www.eed.nctu.edu.tw/people/bio.php?PID=93">Homepage</a>
Lab. ：Applied Electromagnetics Laboratory (http://www.eed.nctu.edu.tw/app-op/lab.php?Sn=222)
  '}
])

Member.create([
  {name: '廖育德', 
  member_category_id: 2, 
  member_department_id: 1, 
  title: '助理教授', 
  full_title: ' 交通大學電機工程學系助理教授', 
  education_background: '美國華盛頓大學電機工程學系博士', 
  content: '
姓名：廖育德<br>
聯絡電話：03-5712121 #54394<br>
Email：yudoliao@g2.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
專長領域：類比/射頻積體電路設計、生醫電子、無線感測器系統及介面電路設計<br>
<a href="http://www.eed.nctu.edu.tw/people/bio.php?PID=10456">個人網址</a><br>
實驗室：Wireless Integrated Microsystems Lab
  ', en_content: '
Name：Liao, Yu-Te<br>
Contact：03-5712121 #54394<br>
Email：yudoliao@g2.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
Research Field：Analog/RF Circuits and Systems, Biomedical Electronics, Wireless Sensor Systems and Interface Design<br>
<a href="http://www.eed.nctu.edu.tw/people/bio.php?PID=10456">Homepage</a><br>
Lab. ：Wireless Integrated Microsystems Lab
  '}
])

Member.create([
  {name: '吳重雨', 
  member_category_id: 2, 
  member_department_id: 1, 
  title: '教授', 
  full_title: '交通大學電機工程學系教授', 
  education_background: '', 
  content: '
姓名：吳重雨<br>
聯絡電話：03-5712121 #54148<br>
Email：peterwu@mail.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
聯絡電話：Biomedical electronic devices and systems, intelligent bio-inspired vision sensor systems, nanoeletronic circuits and systems for RF/microwave communication<br>
<a href="http://www.ics.ee.nctu.edu.tw/~cywu/">個人網頁</a><br>
<a href="http://www.alab.ee.nctu.edu.tw/wpmu/ed307/" >Lab. </a>
  ', en_content: '
  Name：Chung-Yu Wu<br>
Contact：03-5712121 #54148<br>
Email：peterwu@mail.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
Research Field：Biomedical electronic devices and systems, intelligent bio-inspired vision sensor systems, nanoeletronic circuits and systems for RF/microwave communication<br>
<a href="http://www.ics.ee.nctu.edu.tw/~cywu/">Homepage</a><br>
<a href="http://www.alab.ee.nctu.edu.tw/wpmu/ed307/" >Lab. </a>

  '}
])


Member.create([
  {name: '賴伯承', 
  member_category_id: 2, 
  member_department_id: 2, 
  title: '助理教授', 
  full_title: '交通大學電子工程學系助理教授', 
  education_background: '美國加州大學洛杉磯分校博士', 
  content: '
姓名：賴伯承 <br>
聯絡電話：03-5731927 <br>
Email：bclai@mail.nctu.edu.tw <br>
Office Hour：Thursday EF <br>
專長領域：系統晶片設計、計算機輔助設計、多處理器系統 <br>
<a href="https://sites.google.com/a/g2.nctu.edu.tw/bclai">個人網址</a> <br>
實驗室：平行運算系統實驗室 <br>
  ', en_content: '
Name：Bo-Cheng Lai <br>
Contact：03-5731927 <br>
Email：bclai@mail.nctu.edu.tw <br>
Office Hour：Thursday EF <br>
Research Field：SoC and VLSI System Design, Computer-Aided Design, Multi-Core System Design <br>
<a href="https://sites.google.com/a/g2.nctu.edu.tw/bclai">Homepage</a> <br>
Lab. ：Parallel Computing System Lab (https://sites.google.com/a/g2.nctu.edu.tw/parallel-computing-lab/)<br>
  '}
])

Member.create([
  {name: '林怡欣', 
  member_category_id: 2, 
  member_department_id: 3, 
  title: '副教授', 
  full_title: '交通大學光電工程學系副教授', 
  education_background: '美國中佛羅里達大學光學博士', 
  content: '
姓名：林怡欣 <br>
聯絡電話：03-5712121 #56376 <br>
Email：yilin@mail.nctu.edu.tw <br>
Office Hour：Wednesday GH <br>
專長領域：液晶光電元件、液晶物理光學、表面凝態物理 <br>
<a href="http://web.it.nctu.edu.tw/~yilin/">個人網址</a> <br>
實驗室：液態晶體實驗室
  ', en_content: '
Name：Yi-Hsin Lin <br>
Contact：03-5712121 #56376 <br>
Email：yilin@mail.nctu.edu.tw <br>
Office Hour：Wednesday GH <br>
Research Field：Tunable liquid crystal devices, physics and optics of liquid crystal, surface and condense physics<br>
<a href="http://web.it.nctu.edu.tw/~yilin/">Homepage</a> <br>
Lab. ：Liquid Crystal Laboratory (http://web.it.nctu.edu.tw/~yilin/)
  '}
])


Member.create([
  {name: '單智君', 
  member_category_id: 2, 
  member_department_id: 4, 
  title: '副教授', 
  full_title: '交通大學資訊工程學系副教授', 
  education_background: '國立交通大學資訊博士', 
  content: '
姓名：單智君 <br>
聯絡電話：03-5731832 <br>
Email：jjshann@cs.nctu.edu.tw <br>
Office Hour：Wednesday GH <br>
專長領域：計算機架構、平行處理、嵌入式系統、即時編譯技術 <br>
<a href="https://www.cs.nctu.edu.tw/cswebsite/members/detail/jjshann">個人網址</a> <br>
實驗室：系統實驗室
  ', en_content: '
Name：Jyh-Jiun Shann <br>
Contact：03-5731832 <br>
Email：jjshann@cs.nctu.edu.tw <br>
Office Hour：Wednesday GH <br>
Research Field：Computer Architecture, Parallel Processing, Embedded Systems, Just-in-time Compilation <br>
<a href="https://www.cs.nctu.edu.tw/cswebsite/members/detail/jjshann">個人網址</a> <br>
Lab.：
  '}
])

Member.create([
  {name: '李毅郎', 
  member_category_id: 2, 
  member_department_id: 4, 
  title: '教授', 
  full_title: '交通大學資訊工程學系教授', 
  education_background: '國立清華大學資訊工程博士', 
  content: '
姓名：李毅郎 <br>
聯絡電話：03-5131364 <br>
Email：ylli@cs.nctu.edu.tw <br>
Office Hour：Wednesday GH <br>
專長領域：奈米晶片設計自動化、組合最佳化演算法、多核硬體加速處理器、平行處理 <br>
<a href="http://people.cs.nctu.edu.tw/~ylli/">個人網址</a> <br>
超大型積體電路設計自動化實驗室
  ', en_content: '
Name：Yih-Lang Li <br>
Contact：03-5131364 <br>
Email：ylli@cs.nctu.edu.tw <br>
Office Hour：Wednesday GH <br>
Research Field：Design Automation for Nanometer IC, Combinatorial Optimization, Many-Core Hardware Accelerator, Parallel Processing <br>
<a href="http://people.cs.nctu.edu.tw/~ylli/">個人網址</a> <br>
Lab. ：VLSI Desing Automation Lab
  '}
])

Member.create([
  {name: '游逸平', 
  member_category_id: 2, 
  member_department_id: 4, 
  title: '助理教授', 
  full_title: '交通大學資訊工程學系助理教授', 
  education_background: '國立清華大學資訊工程學系博士', 
  content: '
姓名：游逸平 <br>
聯絡電話：03-5712121 #56688 <br>
Email：ypyou@cs.nctu.edu.tw <br>
Office Hour：Monday CD <br>
專長領域：編譯器最佳化、系統軟體、GPU虛擬化 <br>
<a href="http://people.cs.nctu.edu.tw/~ypyou/">個人網址</a> <br>
實驗室：系統軟體實驗室
  ', en_content: '
Name：Yi-Ping You <br>
Contact：03-5712121 #56688 <br>
Email：ypyou@cs.nctu.edu.tw <br>
Office Hour：Monday CD <br>
Research Field：Optimizing compilers, system software, GPU virtualization <br>
<a href="http://people.cs.nctu.edu.tw/~ypyou/">Homepage</a> <br>
Lab. ：System Software Lab (http://sslab.cs.nctu.edu.tw/)
  '}
])

Member.create([
  {name: '嚴力行', 
  member_category_id: 2, 
  member_department_id: 4, 
  title: '教授', 
  full_title: '交通大學資訊工程學系教授', 
  education_background: '國立交通大學資訊工程博士', 
  content: '
姓名：嚴力行</br>
聯絡電話：03-5712121 #54755</br>
Email：lhyen@cs.nctu.edu.tw</br>
專長領域：無線網路、分散式計算、賽局理論</br>
<a href="http://people.cs.nctu.edu.tw/~lhyen/">個人網址</a>
  ', en_content: '
Name：Li-Hsing Yen</br>
Contact：03-5712121 #54755</br>
Email：lhyen@cs.nctu.edu.tw</br>
Research Field：Wireless Networking, Distributed Computing, Game Theory</br>
<a href="http://people.cs.nctu.edu.tw/~lhyen/">homepage</a>
  '}
])

Member.create([
  {name: '董蘭榮', 
  member_category_id: 2, 
  member_department_id: 1, 
  title: '助理教授', 
  full_title: '交通大學資訊工程學系助理教授', 
  education_background: '國立清華大學資訊工程學系博士', 
  content: '
姓名：董蘭榮</br>
聯絡電話：03-5131567</br>
Email：lennon@faculty.nctu.edu.tw</br>
Office Hour：Monday EF</br>
專長領域：數位信號處理晶片設計、電池管理系統設計、生醫信號處理與分析</br>
<a href="http://soclab.cn.nctu.edu.tw/">個人網址</a></br>
實驗室：系統晶片實驗室/ VLSI實驗室
  ', en_content: '
Name：Dung, Lan-Rong</br>
Contact：03-5131567</br>
Email：lennon@faculty.nctu.edu.tw</br>
Office Hour：Monday EF</br>
Research Field：DSP IC Design, Battery Management System, Biomedical Signal Processing</br>
<a href="http://soclab.cn.nctu.edu.tw/">Homepage</a></br>
Lab.：SOC Lab(http://soclab.cn.nctu.edu.tw/)
  '}
])

Member.create([
  {name: '田仲豪', 
  member_category_id: 2, 
  member_department_id: 3, 
  title: '教授', 
  full_title: '交通大學光電工程學系教授', 
  education_background: '', 
  content: '
姓名：田仲豪<br>
聯絡電話：03-5712121 #31584<br>
Email：chtien@mail.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
專長領域：統計光學、計算光學、影像系統<br>
<a href="http://www.ieo.nctu.edu.tw/oislab/">個人網址</a><br>
實驗室：光資訊系統實驗室
  ', en_content: '
Name： Chung-Hao Tien<br>
Contact：03-5712121 #31584<br>
Email：chtien@mail.nctu.edu.tw<br>
Office Hour：Wednesday GH<br>
Research Field：Optical Design Micro-Optics Devices and Optical Data storage<br>
<a href="http://www.ieo.nctu.edu.tw/oislab/">Homepage</a><br>
Lab. ：Optical Information System Lab (http://www.ieo.nctu.edu.tw/oislab/)
  '}
])

Member.create([
  {name: '陳明仁', 
  member_category_id: 3, 
  title: '教官', 
  full_title: '教官', 
  education_background: '', 
  content: '
  Name：陳明仁
Contact：03-5712121轉分機50707
Email：chenmj50707@g2.nctu.edu.tw

  ', en_content: '
  Name：Li-Yen Wu
Contact：03-5712121轉分機50707
Email：chenmj50707@g2.nctu.edu.tw
  '}
])

Member.create([
  {name: '吳立研', 
  member_category_id: 3, 
  title: '諮商老師', 
  full_title: '諮商老師', 
  education_background: '', 
  content: '
姓名：Li-Yen Wu <br>
聯絡電話：03-5712121#51319 <br>
Email：liyenwu@nctu.edu.tw <br>
辦公室： 學生活動中心三樓<br>
研究領域：精神分析取向心理治療、多元文化議題、英語諮商  

  ', en_content: '
Name：Li-Yen Wu <br>
Contact：03-5712121#51319 <br>
Email：liyenwu@nctu.edu.tw <br>
Office：Student Activity Center 3F <br>
Field：Group and individual counseling, psychotherapy, and psychological testing
  '}
])


