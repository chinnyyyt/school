#!/usr/bin/env ruby

require 'digest'

# Hidden password hash
password_hash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"

# Function to brute force by generating all combinations
def brute_force(password_hash)
  characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  max_length = 6 # Set the maximum length of the password
  
  (1..max_length).each do |length|
    characters.repeated_permutation(length).each do |guess|
      guess_str = guess.join
      guess_hash = Digest::SHA256.hexdigest(guess_str)
      puts("Trying password #{guess_str}: #{guess_hash}")
      
      if guess_hash == password_hash
        puts("Password has been cracked! It was #{guess_str}")
        return
      end
    end
  end
  puts "Password not found within the given length limit."
end

# Run the brute force attack
brute_force(password_hash)
