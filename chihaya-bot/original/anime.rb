require 'open-uri'
require 'rexml/document'
require 'delegate'

module Syoboi
  module CalChk
    def get()
      xml = REXML::Document.new(open('http://cal.syoboi.jp/cal_chk.php'))

      result = Result.new

      syobocal = xml.elements['syobocal']
      result.url = syobocal.attribute("url").to_s
      result.version = syobocal.attribute("version").to_s
      result.last_update = Time.parse(syobocal.attribute("LastUpdate").to_s)
      result.spid = syobocal.attribute("SPID").to_s
      result.spname = syobocal.attribute("SPNAME").to_s

      xml.elements.each('syobocal/ProgItems/ProgItem'){|item|
        result << {
          :pid => item.attribute("PID").to_s.to_i,
          :tid => item.attribute("TID").to_s.to_i,
          :st_time => Time.parse(item.attribute("StTime").to_s),
          :ed_time => Time.parse(item.attribute("EdTime").to_s),
          :ch_name => item.attribute("ChName").to_s,
          :ch_id => item.attribute("ChID").to_s.to_i,
          :count => item.attribute("Count").to_s.to_i,
          :st_offset => item.attribute("StOffset").to_s.to_i,
          :sub_title => item.attribute("SubTitle").to_s,
          :title => item.attribute("Title").to_s,
          :prog_comment => item.attribute("ProgComment").to_s
        }
      }

      result
    end
    module_function :get

    class Result < DelegateClass(Array)
      attr_accessor :url, :version, :last_update, :spid, :spname

      def initialize
        super([])
      end
    end
  end
end

def format_time(time)
  h = time.hour
  h += 24 if h < 5
  m = time.min

  sprintf("%2d:%02d", h, m)
end

result = Syoboi::CalChk.get()

puts "これから放送されるアニメ＠名古屋\n"

result.select{|prog|
  # 現在から
  st = Time.now

  # 次の朝5時まで
  day = Time.now.hour < 5 ? Date.today : Date.today + 1
  ed = Time.new(day.year, day.month, day.day, 5)

  # 首都圏のチャンネルで放送されるアニメ
  syutoken_ch = [
    1, # NHK総合
    2, # NHK Eテレ
    77, # 東海テレビ
    79, # CBC
    80, # 中京テレビ
    81, # メーテレ
    82, # 三重テレビ
    59, # テレビ愛知
    128, # BS11
  ]

  st < prog[:st_time] and prog[:st_time] < ed and syutoken_ch.include?(prog[:ch_id])
}.sort_by{|prog|
  prog[:st_time] # 放送開始日時で降順に並べ替え
}.each{|prog|
  puts "#{format_time(prog[:st_time])} [#{prog[:ch_name]}] #{prog[:title]} \##{prog[:count]}「#{prog[:sub_title]}」"
}
