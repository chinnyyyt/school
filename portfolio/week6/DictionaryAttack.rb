#!/usr/bin/ruby
require 'digest'

# Define the target password hash
passwordHash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"

# Read the wordlist into an array
wordlist = IO.readlines("wordlist.txt").map(&:chomp)

# Method to generate permutations of a given length from the wordlist
def generate_permutations(length, wordlist)
  wordlist.repeated_permutation(length).each do |combination|
    yield combination.join
  end
end

# Method to attempt brute force attack using permutations
def brute_force_attack(passwordHash, wordlist, max_length)
  (1..max_length).each do |length|
    generate_permutations(length, wordlist) do |password|
      # Hash the password
      passwordHashAttempt = Digest::SHA256.hexdigest(password)
      puts("Trying password #{password}: #{passwordHashAttempt}")

      # Check if the hash matches the target hash
      if passwordHashAttempt == passwordHash
        puts("Password has been cracked! It was #{password}")
        return
      end
    end
  end

  puts("Password not found within the given length.")
end

# Set the maximum length of permutations to try
max_length = 2 # Adjust this length as needed

# Start the brute force attack
brute_force_attack(passwordHash, wordlist, max_length)
