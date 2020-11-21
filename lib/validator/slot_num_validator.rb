class SlotNumValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    slots = (1..5).to_a.map do |n| #slot1~slot5に選ばれた数字を配列で保持
      record.__send__ "slot#{n}"
    end
    slots.combination(2).each do |n| #配列から２つずつ取り出して比較
      puts "(#{n[0]},#{n[1]})" # for debug
      if n[0] == n[1]
        record.errors.add(attribute, "が重複しています")
        break
      end
    end
  end
end