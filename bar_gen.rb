#!/usr/bin/ruby

# Generates a Bar given several parameters
# Created By Jesse Jurman

require 'colorize'

# Generates the bar with the given parameters
# amount        - (int) amount to fill in
# full          - (int) the amount which would fill the bar
# width         - (int) how many characters the bar is
# border_char_l - (string) character for the border
# border_char_r - (string) character for the border
# border_color  - (symbol) color for the border
# bar_on_char   - (string) character to fill the bar with
# bar_off_char  - (string) character to fill the bar with
# bar_colors    - (list symbol) list of colors to fill the bar with
# cut           - (int) returns only a subsegment based on colors (-1 = ALL)
def gen_bar(amount, full, width,
            border_char_l="[", border_char_r="]", border_color=:white,
            bar_on_char="|", bar_off_char=" ", 
            bar_colors=[:green, :yellow, :red],
            cut=-1
           )

  bar_l = border_char_l.send(border_color)
  bar_r = border_char_r.send(border_color)

  barN_amount = (1.0)*(amount)/(full)*(width)
  barN_empty  = width - barN_amount

  bar_use = (bar_on_char * barN_amount)
  bar_space = (bar_off_char * barN_empty)

  bar_fill = bar_use + bar_space
  bar_colored = ""
  bar_colors.each_index do |index|
    start_i = (width / bar_colors.size) * index
    end_i = (width / bar_colors.size) * (index+1)
    filling = bar_fill[ start_i..end_i ].send( bar_colors[index] )
    if cut == index
      return filling.uncolorize
    end
    bar_colored += filling
  end
  
  return "#{bar_l}#{bar_colored}#{bar_r}"
end

# Grab top data for cpu processing
# if mpstat isn't installed, try grabbing sysstat
mp = `mpstat 1 1`
idle_index = mp.split(?\n)[2].split(?\ ).index("%idle")
idle_value = mp.split(?\n)[3].split(?\ )[idle_index]

if (/\d/ =~ ARGV[0]) != nil
  cut = ARGV[0].to_i
else
  puts idle_value
  cut = -1
end

# example
puts gen_bar(100-(idle_value.to_i), 100, 20,
              "[", "]", :white,
              "|", " ", 
              [:cyan, :green, :yellow, :red],
              cut
            )
