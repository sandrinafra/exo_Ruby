#!/usr/bin/ruby -w

# nex class html

class Dup_file < StandardError

  def initialize(file)
    @title = file
  end

  def show_state
    puts "A file named #{@title} was already there: #{Dir.pwd}/#{@title}.html"
  end

  def correct
    @title = "#{@title}.new"
    correct if File.file? "#{@title}.html"
    return @title
  end

  def explain
    puts "Appended .new in order to create requested file: #{Dir.pwd}/#{@title}.html"
  end

end

class Body_closed < StandardError

  def initialize(page_name)
    @title = page_name
  end

  def show_state
    puts "In #{@title} body was closed :"
  end

  def correct(str)
    array = []
    File.open(@title + '.html', 'r').each_line.with_index do |line, i|
      array << line unless line.include? "</body>"
      @i = i + 1
    end
    File.open(@title + '.html', 'w')do |file|
      array.each { |line| file << line }
    end
  end

  def explain
    puts "> ln :#{@i} </body> : text has been inserted and tag moved at the end of it."
  end

end

class Html
  attr_reader :page_name

  def initialize(title)
    @page_name = title
    begin
      raise Dup_file, title if File.file?(title + '.html')
    rescue Dup_file => error
      error.show_state
      @page_name = error.correct
      error.explain
    end
    head
  end

  def head
    File.open(@page_name + '.html', 'w') do |file|
      file << "<!DOCTYPE html>\n"
      file << "<html>\n"
      file << "<head>\n"
      file << "<title>#{@page_name}</title>\n"
      file << "</head>\n"
      file.write "<body>\n"
    end
  end

  def dump(str)
    File.open(@page_name + '.html', 'a+') do |file|
      begin
        msg = "There is no body tag in #{@page_name}.html"
        raise msg if /<body>/.match(file.read).nil?
        file.seek 0
        msg = "Body has already been closed in #{@page_name}.html"
        raise Body_closed, @page_name  if %r{<\/body>} =~ file.read
      rescue Body_closed => error
        error.show_state
        error.correct(str)
        error.explain
      end
      file << "  <p>#{str}</p>\n"
    end
  end

  def finish
    File.open(@page_name + '.html', 'a+') do |file|
      begin
        msg = "#{@page_name}.html has already been closed"
        raise msg if %r{<\/body>} =~ file.read
      end
      file << "</body>\n"
    end
  end
end

if $PROGRAM_NAME == __FILE__
  # a = Html.new('test')
  a = Html.new('test')
  10.times { |x| a.dump("titi_number#{x}") }
  a.finish
  a.dump("hello titi")
  a.finish
end
