# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[
	["idady","0000",true,"idady@gmail.com","対よろ","idady","3","10",true],
	["yamasugi","1111",true,"yamasugi@gmail.com","ぽきた！w","yamasugi","3","10",true]
].each do |name,nfcid,registered,mail,comment,password,wincount,hispeed,slowfast|
	User.create!(
		{ name: name, nfcid: nfcid, registered: registered, mail: mail, comment: comment, password: password, wincount: wincount, hispeed: hispeed, slowfast: slowfast}
		)
end

[
	[1,1,1,100,100,80,50,20,0,2,1,200,200,1,2,3,4]
].each do|music_id,p1_id,p1_difficulty,p1_score,p1_perfect,p1_great,p1_good,p1_bad,p1_miss,p2_id,p2_difficulty,p2_score,p2_perfect,p2_great,p2_good,p2_bad,p2_miss|
	Result.create!(
		{music_id: music_id, p1_id: p1_id, p1_difficulty: p1_difficulty, p1_score: p1_score, p1_perfect: p1_perfect, p1_great: p1_great, p1_good: p1_good, p1_bad: p1_bad, p1_miss: p1_miss, p2_id: p2_id, p2_difficulty: p2_id, p2_score: p2_score, p2_perfect: p2_perfect, p2_great: p2_great, p2_good: p2_good, p2_bad: p2_bad, p2_miss: p2_miss}

	)
end
