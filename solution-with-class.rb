require 'io/console'

class PasswordVerifyer
  attr_reader :violation_count, :violation_messages

  def initialize(password,
                 min_length,
                 max_length,
                 min_numbers,
                 min_lowercase,
                 min_uppercase,
                 min_special_chars)
    @password = password
    @min_length = min_length
    @max_length = max_length
    @min_numbers = min_numbers
    @min_lowercase = min_lowercase
    @min_uppercase = min_uppercase
    @min_special_chars = min_special_chars
    @violation_count = 0
    @violation_messages = []
  end

  def verify_password
    if @password.length < @min_length
      @violation_count += 1
      @violation_messages.push "Password is too short: does not meet length requirement of #{@min_length} to #{@max_length} characters"
    end

    if @password.length > @max_length
      @violation_count += 1
      @violation_messages.push "Password is too long: does not meet length requirement of #{@min_length} to #{@max_length} characters"
    end

    if count_numbers < @min_numbers
      @violation_count += 1
      @violation_messages.push "Password does not contain at least 2 digits"
    end

    if count_lowercase < @min_lowercase
      @violation_count += 1
      @violation_messages.push "Password does not contain at least 2 lowercase letters"
    end

    if count_uppercase < @min_uppercase
      @violation_count += 1
      @violation_messages.push "Password does not contain at least 2 uppercase letters"
    end

    if count_special_chars < @min_special_chars
      @violation_count += 1
      @violation_messages.push "Password does not contain at least 1 special character"
    end

    if (@violation_count > 0)
      @violation_messages.push "Password has a total of #{@violation_count} violations."
    else
      @violation_messages.push "Password is valid"
    end

    self
  end

  private

  def count_numbers
    @password.count "0-9"
  end

  def count_lowercase
    @password.count "a-z"
  end

  def count_uppercase
    @password.count "A-Z"
  end

  def count_special_chars
    @password.count "!, @, #, $, ^, &, ?, <, >"
  end
end

print 'Please enter your password: '
password = STDIN.noecho(&:gets).chomp
puts
puts PasswordVerifyer.new(password, 8, 16, 2, 2, 2, 1).verify_password.violation_messages
