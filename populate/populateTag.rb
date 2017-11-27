ARGV.each do|a|
  puts "Argument#{ARGV.index(a)}: #{a}"
end
num = ARGV[0]
num = num.to_i
o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
begin
    for i in 1..num
        puts "#{i}th tags"
        name = (0...10).map { o[rand(o.length)] }.join
        ActsAsTaggableOn::Tag.create(:name => name)  
    end
    users = User.all
    tags = ActsAsTaggableOn::Tag.all
    puts "user tags"
    for u in users
        for t in tags
            if(rand(10) >= 7)
                TagFollowing.create(:tag_id => t.id, :user_id => u.id)
            end
        end
    end
    puts "tag and posts, comments, mentions"
    posts = Post.all
    for po in posts
        for t in tags
            if(rand(100) >= 98 and ! t.name.in? po.text)
                po.text = "#" + t.name + " " + po.text
                po.save
            end    
        end
        for u in users
            if(rand(100) > 98)
                Mention.create(:post_id => po.id, :person_id => u.person_id)
            end
            text = (0...100).map { o[rand(o.length)] }.join
            if(rand(100) > 98)
                Comment.create(:text => text, :commentable_id => po.id, :author_id => u.person_id)
            end
            
        end
    end
    puts "finish tags" 
end