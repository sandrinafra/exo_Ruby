#!/usr/bin/ruby -w

# nex class html
class Html
  attr_reader :page_name

  def initialize(title)
    begin
      msg = "A file named #{title}.html already exist!"
      raise msg if File.file?(title + '.html')
    end
    @page_name = title
    head
  end

  def head
    File.open(@page_name + '.html', 'w') do |file|
      file << "<!DOCTYPE html>\n"
      file << "<html>\n"
      file << "<head>\n"
      file << "<title>#{@page_name}</title>\n"
      file << "</head>\n"
      file << "<body>\n"
    end
  end

  def dump(str)
    File.open(@page_name + '.html', 'a+') do |file|
      begin
        msg = "There is no body tag in #{@page_name}.html"
        raise msg if /<body>/.match(file.read).nil?
        file.seek 0
        msg = "Body has already been closed in #{@page_name}.html"
        raise msg if %r{<\/body>} =~ file.read
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
      file << "</html>\n"
    end
  end
end

if $PROGRAM_NAME == __FILE__
  # a = Html.new('test')
  a = Html.new('test')
  10.times { |x| a.dump("titi_number#{x}") }
  a.finish
  # a.dump("hello titi")
  # a.finish
end
