#!/usr/bin/env ruby
require_relative "builder"
require 'pry'

module Bartleby
  # This should be an argument (or we can derive the phoneme from a word argument that exists in our lookup)
  # This looks really stupid. What is the actual right way to do this?
  @target_phoneme = "OW"
  def self.target
    @target_phoneme
  end

  dictionary = Builder.build_dictionary
  types = Builder.build_language_types
  templated_dictionary = Builder.simplify_dictionary(dictionary, types)

end
