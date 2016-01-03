# Password Checker

## Description

You have been hired by Initech to tighten up their security. Your first assignment is to write a program to verify that a given password is secure, i.e. that it conforms to the following corporate standards for passwords:

* has a length of 8 to 16 characters
* contains at least 2 digits
* contains at least 2 uppercase letters and at least 2 lowercase letters
* contains at least 1 of the following _special_ characters: {!, @, #, $, ^, &, ?, <, >}

If a password does not meet any of the above requirements, your program should list the rule or rules that are not satisfied.

For Ruby, write your program to prompt the user for the password. You can use the following to protect the secrecy of the password:

```ruby
require 'io/console'

print 'Please enter your password: '
password = STDIN.noecho(&:gets).chomp
```

> Hint: Ruby strings have a `count` method that you may find helpful, see [count](http://ruby-doc.org/core-2.2.0/String.html#method-i-count)

## Examples

### Example 1:

Password: 'abc'
Program output:

```
Password is too short: does not meet length requirement of 8 to 16 characters
Password does not contain at least 2 digits
Password does not contain at least 2 uppercase letters
Password does not contain at least 1 special character
Password has a total of 4 violations.
```

### Example 2:

Password: 'App1ePi3'
Program output:

```
Password does not contain at least 1 special character
Password has a total of 1 violations.
```

### Example 3:

Password: 'SantA_C1au$3'
Program output:

```
Password is valid
```

## Metadata

TAGS=[ruby, control-flow]
