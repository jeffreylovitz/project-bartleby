# Project Bartleby

Project Bartleby will allow a user to specify a word or sound (single syllables are better), then update arbitrary text inputs to replace all rhyming graphemes with that input. Special attention is paid to the adjacent graphemes in each word, allowing for substitutions that more closely resemble natural English.

For example, when bro-ing every word in the English language, the word "voter" will be updated to "broter", but the word "wholehearted" will be update to "brohearted". This is because the relative sound parts of "voter" are:

V -'fricative', O - vowel', T -'stop'

While the relative parts of "wholehearted" are:

WH - 'aspirate', O - "vowel", LE - "liquid"

## Attribution
Project Bartleby uses essential grapheme-phoneme translations provided by The Carnegie Mellon Pronouncing Dictionary, which is licensed under the Simplified BSD license contained in cmudict-0.7b (alongside version and source information - Project Bartleby currently uses files from CMUdict v0.07, released 2015-02-18).
