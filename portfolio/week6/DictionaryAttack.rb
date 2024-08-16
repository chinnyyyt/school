#!/usr/bin/ruby
require 'digest'

# Define the target password hash
passwordHash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"

# Define the characters to use in the brute force attack
chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a # Add more if needed

# Method to generate combinations recursively
def brute_force(chars, passwordHash, prefix = "", length)
  if length == 0
    # Hash the generated password
    passwordHashAttempt = Digest::SHA256.hexdigest(prefix)
    puts("Trying password #{prefix}: #{passwordHashAttempt}")

    # Check if the hash matches the target hash
    if passwordHashAttempt == passwordHash
      puts("Password has been cracked! It was #{prefix}")
      exit
    end
  else
    chars.each do |char|
      brute_force(chars, passwordHash, prefix + char, length - 1)
    end
  end
end

# Set the maximum password length to try
max_length = 2 # Adjust this length as needed

# Start brute force attack
(1..max_length).each do |length|
  brute_force(chars, passwordHash, "", length)
end

puts("Password not found within the given length.")
