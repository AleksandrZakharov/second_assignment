class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  def initialize (content,line_number)
    @line_number = line_number
    @content = content
    @highest_wf_words=[]
    calculate_word_frequency
  end
  
  def calculate_word_frequency
    words = self.content.downcase.split(' ')
    def count_words(words)
      words.each_with_object (Hash.new 0 ) do |word, counter|
        counter[word] += 1
      end
    end
    @highest_wf_count = 1
    count_words(words).each do |word, count|
      if @highest_wf_count < count
        @highest_wf_count = count
      end
    end
    count_words(words).each do |word, count|
      if @highest_wf_count == count
        @highest_wf_words << word
      end
    end
  end
end

class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  def initialize()
    @analyzers=[]
  end
  def analyze_file()
  :number
  number = 1  
    File.open('test.txt') do |f|
      f.each_line do |line|
        @analyzers << LineAnalyzer.new(line,number)
          number += 1
      end
    end
  end
  def calculate_line_with_highest_frequency()
    @highest_count_words_across_lines = []
    @highest_count_across_lines = 1
    @analyzers.each do |analyzer|
      if @highest_count_across_lines < analyzer.highest_wf_count
        @highest_count_across_lines = analyzer.highest_wf_count
      end
    end
    @analyzers.each do |analyzer|
      if @highest_count_across_lines == analyzer.highest_wf_count
        @highest_count_words_across_lines << analyzer
      end
    end
  end
  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:\n"
    @highest_count_words_across_lines.each do |words|
      puts "#{words} (appears in line #)"
    end
  end
end