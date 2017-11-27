ARGV.each do|a|
  puts "Argument#{ARGV.index(a)}: #{a}"
end
num = ARGV[0]
num = num.to_i
o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
begin
    users = User.all
    puts "Start posts"
    for u in users
        p = u.person
        for i in 1..rand(num)
            text = (0...100).map { o[rand(o.length)] }.join
            Post.create(:author_id => p.id, :public => true, :type => 'StatusMessage',  :text => text)       
        end
    end
    puts "finish posts"
end