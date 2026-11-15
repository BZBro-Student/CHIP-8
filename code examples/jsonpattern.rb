user = { name: "Jordan", role: :admin, active: true }

case user
in { role: :admin, active: true, name: }
  puts "Welcome back, Admin #{name}!"
in { active: false }
  puts "Account is suspended."
else
  puts "Standard user access."
end