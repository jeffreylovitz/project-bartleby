module Bartleby
  class Builder

    # Parse the phoneme dictionary, storing all terms with the taget phonem
    def self.build_dictionary
      rx = /^([a-zA-Z]+)  ([a-zA-Z].* #{Bartleby.target}.*)/
      candidates = {}
      File.open(File.join("data", "cmudict-0.7b"), "r").each_line do |term|
        # TODO CRs?
        # Extract the word and the phoneme sequence for every definition containing the target

        # Doesn't work with interpolations
        # success = /^(?<word>[a-zA-Z]+)  (?<phoneme_string>[a-zA-Z].* OW.*)/ =~ term
        match = rx.match(term)
        next unless match
        word = match[1].downcase
        phoneme_string = match[2]
        # TODO I guess let's just drop stresses for now and reconsider if they start to seem important
        candidates[word] = phoneme_string.gsub(/[0-3]+/, "").split(" ")
      end
      # TODO necessary?
      candidates
    end

    def self.build_language_types
      # This file lists every phoneme and the sound type it represents
      # These can include markers of no stress, secondary stress, or primary stress, but we're
      # currently stripping them out in the above loop
      types = {}

      File.open(File.join("data", "cmudict-0.7b.phones"), "r").each_line do |term|
        x = term.chomp("\n").split("\t")
        types[x[0]] = x[1]
      end
      types[Bartleby.target] = "TARGET"
      types
    end

    def self.simplify_dictionary(dictionary, types)
      # Replace all individual sounds in each word with their type, except our target
      # which will be separately labeled
      skeletons = {}
      dictionary.each do |x|
        parts = []
        x[1].each { |y| parts << types[y] }
        skeletons[x[0]] = parts
      end
      skeletons
    end
  end
end