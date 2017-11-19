module Bartleby
  # Accept user inputs and provide the opportunity to validate substitutions
  class Interact

    def self.test_substitutions(dict, header)
      search_terms = set_search_terms(dict, header)
      search_results = conduct_search(dict, search_terms)
      test_subs(search_results)
    end

    def self.test_subs(search_results)
      search_results.each do |x|
        puts "#{x[0]} -> #{x[0].gsub("O", "JOE")}"
      end
    end

    def self.conduct_search(dict, search_terms)
      results = []
      dict.each do |entry|
        entry[1].each_cons(search_terms.size) do |subsequence|
          results << entry if subsequence == search_terms
        end
      end
      results
    end

    def self.set_search_terms(dict, header)
      # We want the target to be at 0, so let's shuffle things a little
      # Let's not think for now about how ugly this is
      header.delete("TARGET")
      header.unshift("TARGET")

      search = []
      loop do
        puts "Enter a sequence of space-separated integers to choose a phonemic sequence."
        header.each_with_index do |x, i|
          puts "#{i}: #{x}"
        end
        print "\n>>"
        usr_input = gets.chomp("\n")
        # split(" ")
        unless /^[[0-8] ]+$/ =~ usr_input
          puts "Input must be a space-separated series of integers from 0 to 8.\n\n"
          redo
        end

        usr_input.split(" ").each { |x| search << header.at(x.to_i)}
        unless search.include?("TARGET")
          puts "TARGET must be included in your search sequence.\n\n"
          search = []
          redo
        end
        break
      end
      puts search.join(", ")
      search
    end
  end
end