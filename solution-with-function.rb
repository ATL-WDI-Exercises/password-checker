require 'io/console'

def verify_password(password)
  violation_count = 0

  if password.length < 8
    violation_count += 1
    puts "Password is too short: does not meet length requirement of 8 to 16 characters"
  end

  if password.length > 16
    violation_count += 1
    puts "Password is too long: does not meet length requirement of 8 to 16 characters"
  end

  if password.count("0-9") < 2
    violation_count += 1
    puts "Password does not contain at least 2 digits"
  end

  if password.count("a-z") < 2
    violation_count += 1
    puts "Password does not contain at least 2 lowercase letters"
  end

  if password.count("A-Z") < 2
    violation_count += 1
    puts "Password does not contain at least 2 uppercase letters"
  end

  if password.count("!, @, #, $, ^, &, ?, <, >") < 1
    violation_count += 1
    puts "Password does not contain at least 1 special character"
  end

  if (violation_count > 0)
    puts "Password has a total of #{violation_count} violations."
  else
    puts "Password is valid"
  end
end

print 'Please enter your password: '
password = STDIN.noecho(&:gets).chomp
puts
verify_password(password)
