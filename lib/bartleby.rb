#!/usr/bin/env ruby
require_relative "builder"
require_relative "interact"
require 'pry'

module Bartleby
  # TODO not the right place
  def self.apply_rules(templated_dictionary, dictionary)
    # Regex helpers
    vowels = "aeiou"
    templated_dictionary.each do |x|
      original_word = x[0]
      ind = x[1].find_index("TARGET")
      prev = x[1][ind - 1]



      # V
      # case prev
      # when "stop"
        # # Let's assume for the moment that stops are always one character
        # # Then we are interested in word[target_index - 1 .. word.length - target_index + 1]
        # # This will crudely skip out the characters that cannot be replaced if each phoneme
        # # is one character
        # replacement = original_word[ind-1..-1]
        # binding.pry
      # end

      # # First, try to guess where the target is
      # binding.pry
    end
  end

  # This should be an argument (or we can derive the phoneme from a word argument that exists in our lookup)
  # This looks really stupid. What is the actual right way to do this?
  def self.target
    @target_phoneme
  end

  # For the moment, target can be passed on command line or defaults to OW
  @target_phoneme = ARGV[0] || "OW"
  ARGV.shift

  dictionary = Builder.build_dictionary
  types = Builder.build_language_types
  templated_dictionary = Builder.simplify_dictionary(dictionary, types)

  # Interact.test_substitutions(templated_dictionary, types.values.uniq, dictionary)
  apply_rules(templated_dictionary, dictionary)



  binding.pry
  # if 0 == stop and 1 == target, replace both

  # Let's just do random shit to figure out replacement rules
  # sets = {}
  # templated_dictionary.each do |x|
    # ind = x[1].find_index("TARGET")
    # if ind.zero?
      # sets[x[0]] = ["TARGET", x[1][ind + 1]]
    # elsif ind == x[1].count - 1
      # sets[x[0]] = [x[1][ind - 1], "TARGET"]
    # else
      # sets[x[0]] = [x[1][ind - 1], "TARGET", x[1][ind + 1]]
    # end
  # end

  # Words sorted by sound before target
  # sets.sort_by { |h| h[1][0] }

  # Have to find target in orginal word to know where to make replacement
  # (tell that O and EAU are the same, etc)

end
