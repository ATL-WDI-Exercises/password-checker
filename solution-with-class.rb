require 'io/console'

class PasswordChecker
  attr_reader :violation_count, :violation_messages

  def initialize(min_length,
                 max_length,
                 min_numbers,
                 min_lowercase,
                 min_uppercase,
                 min_special_chars)
    @min_length = min_length
    @max_length = max_length
    @min_numbers = min_numbers
    @min_lowercase = min_lowercase
    @min_uppercase = min_uppercase
    @min_special_chars = min_special_chars
  end

  def verify_password(password)
    violation_count = 0
    violation_messages = []

    if password.length < @min_length
      violation_count += 1
      violation_messages.push "Password is too short: does not meet length requirement of #{@min_length} to #{@max_length} characters"
    end

    if password.length > @max_length
      violation_count += 1
      violation_messages.push "Password is too long: does not meet length requirement of #{@min_length} to #{@max_length} characters"
    end

    if count_numbers(password) < @min_numbers
      violation_count += 1
      violation_messages.push "Password does not contain at least 2 digits"
    end

    if count_lowercase(password) < @min_lowercase
      violation_count += 1
      violation_messages.push "Password does not contain at least 2 lowercase letters"
    end

    if count_uppercase(password) < @min_uppercase
      violation_count += 1
      violation_messages.push "Password does not contain at least 2 uppercase letters"
    end

    if count_special_chars(password) < @min_special_chars
      violation_count += 1
      violation_messages.push "Password does not contain at least 1 special character"
    end

    if (violation_count > 0)
      violation_messages.push "Password has a total of #{violation_count} violations."
    else
      violation_messages.push "Password is valid"
    end

    violation_messages
  end

  private

  def count_numbers(password)
    password.count "0-9"
  end

  def count_lowercase(password)
    password.count "a-z"
  end

  def count_uppercase(password)
    password.count "A-Z"
  end

  def count_special_chars(password)
    password.count "!, @, #, $, ^, &, ?, <, >"
  end
end

checker = PasswordChecker.new(8, 16, 2, 2, 2, 1)

while true
  print 'Please enter your password: '
  password = STDIN.noecho(&:gets).chomp
  break if password.length == 0
  puts
  puts checker.verify_password(password)
end
