ARGV.each do|a|
  puts "Argument#{ARGV.index(a)}: #{a}"
end
num = ARGV[0]
num = num.to_i
o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
puts "populate users"
begin
    for i in 1..num
        puts "#{i}th user"
        username = (0...10).map { o[rand(o.length)] }.join
        email = (0...8).map { o[rand(o.length)] }.join + "@exapmle.com"
        password =  "12345678"
        opt = {:username => username, :email => email, :password => password, color_theme: "original", language: "en"}
        user = User.build(opt)
        user.save
    end
    users = User.all
    puts "start relationship between users"
    for u in users
        for u2 in users
            p2 = u2.person
            sharing = rand(2)
            receiving = rand(2)
            if sharing || saving and rand(100) > 96 and !Contact.exists?(:user => u, :person => p2, :sharing => sharing, :receiving =>receiving)
                Contact.create(:user => u, :person => p2, :sharing => sharing, :receiving =>receiving)
            end
        end
    end
    puts "finish users relationship"
end