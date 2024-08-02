#!/usr/bin/ruby
require 'digest'

passwordHash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"
charset = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a  # Character set to brute force

def recursive_brute_force(passwordHash, max_length, current = "")
  return current if Digest::SHA256.hexdigest(current) == passwordHash
  return nil if current.length >= max_length
  charset.each do 
