#!/usr/bin/ruby -w

def head(file_html)
  file_html << "<!DOCTYPE html>\n"
  file_html << "<html>\n"
  file_html << "  <head>\n"
  # file_html << "<link rel='stylesheet' href='periodic_table.css'>"
  file_html << "    <meta charset='utf-8'>\n"
  file_html << "    <title>Periodic table</title>\n"
  file_html << "  </head>\n"
  file_html << "  <body>\n"
  file_html << "    <table style='width: 100%'; margin='auto'; border-spacing='5px;'>\n"
end

def finish(file_html)
  file_html << "    </table>\n"
  file_html << "  </body>\n"
  file_html << "</html>"
end

def hash(line)
  attributes = line.split(',')
  hash = {name: line.split[0],
    position: attributes[0].split(':')[1],
    number: attributes[1].split(':')[1],
    small: attributes[2].split(':')[1].strip,
    molar: attributes[3].split(':')[1],
    electron: attributes[4].split(':')[1].strip}
    return(hash)
end

  def print_elem(elem, file_html)
    file_html << "        <td style='width: 5.55555%; border: 1px solid black;'>\n"
    file_html << "        <h4 style='font-size:0.8vw'>#{elem[:name]}</h4>\n"
    file_html << "          <ul style='list-style:none; margin:0px; padding:0px;'>\n"
    file_html << "            <li style='font-size:0.8vw'>#{elem[:number]}</li>\n"
    file_html << "            <li style='font-size:0.8vw'>#{elem[:small]}</li>\n"
    file_html << "            <li style='font-size:0.8vw'>#{elem[:molar]}</li>\n"
    file_html << "          <ul>\n"
    file_html << "        </td>\n"
  end

  def table
    file = open('periodic_table.txt', 'r')
    file_html = open('periodic_table.html', 'w')
    head(file_html)
    prev_pos = 0
    file.each do  |line|
      elem = hash(line)
      if elem[:position].to_i > prev_pos + 1
        offset = elem[:position].to_i - (prev_pos + 1)
        file_html << "        <td colspan='#{offset}' style='width:5.55555'></td>\n"
      end
      file_html << "      <tr>\n" if elem[:position] == 0
      print_elem(elem, file_html)
      file_html << "      </tr>\n" if elem[:position] == "17"
      prev_pos = elem[:position].to_i
    end
    finish(file_html)
  end

  table if $PROGRAM_NAME == __FILE__
