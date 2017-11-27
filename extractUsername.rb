f = open('user200', 'w')
users = User.all
for u in users
  f.write(u.username)
  f.write("\n")
end
f.close()

