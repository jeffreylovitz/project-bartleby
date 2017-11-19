#!/usr/bin/env ruby
require_relative "builder"
require_relative "interact"
require 'pry'

module Bartleby

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

  Interact.test_substitutions(templated_dictionary, types.values.uniq)

end
