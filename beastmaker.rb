puts 'Are we generating a double-tap trigger, a simultaneous trigger, or hold and press trigger?'
type = gets.chomp.downcase

puts "Enter the key(s) you want to trigger the string."
trigger = gets.chomp.upcase.to_s
trigger = [trigger]
puts "Enter your sequence of letters and modifiers(command, control, option)." 
puts "=> Separate them with spaces and enter the modifers AFTER the modified key"
puts "=> EX: for cmd-x, type 'x command'."

#include a regex expression here to strip out the commas if there are any.
  
array = gets.chomp.to_s.upcase.split(" ")

num_array = (0..9).to_a.map{ |index| index.to_s }
letter_array = ('A'..'Z').to_a
# modifier_array = ['shift', 'control', 'ctrl', 'opt', 'option' ]
# final_array = []

def creator(array, num_array, letter_array)
  array.map do |key|
    if num_array.include?(key[0])
      key = 'KeyCode::KEY_' + key
    elsif letter_array.include?(key)
      key = 'KeyCode::' + key.upcase
    elsif key.include?("LEFT")
      key = 'KeyCode::CURSOR_LEFT'
    elsif key.include?('RIGHT')
      key = 'KeyCode::CURSOR_RIGHT'
    elsif key.include?('UP')
      key = 'KeyCode::CURSOR_UP'
    elsif key.include?('DOWN')
      key = 'KeyCode::CURSOR_DOWN'
    elsif ['CONTROL', 'CTRL', 'CNTRL'].include?(key)
      key = 'ModifierFlag::CONTROL_L'
    elsif ['OPTION', 'OPT', 'OP'].include?(key)
      key = 'ModifierFlag::OPTION_L'
    elsif ['COMM', 'COMMAND', 'CMD'].include?(key)
      key = 'ModifierFlag::COMMAND_L'
    elsif ['SHIFT', 'SHFT', 'SHIF'].include?(key)
      key = 'ModifierFlag::SHIFT_L'
    elsif ['PERIOD', 'DOT'].include?(key)
      key = 'KeyCode::DOT'
    elsif ['SEMICOLON', 'SEMI-COLON', 'SEMI_COLON'].include?(key)
      key = 'KeyCode::SEMICOLON'
    elsif ["BR", 'BRACKET', 'BRACE', 'BRACE_L', 'BRACKET_L', 'BRACKET_LEFT', 'LEFT_BRACKET'].include?(key)
      key = 'KeyCode::BRACKET_L'  
    elsif [ 'BRACE_R', 'BRACKET_R', 'BRACKET_RIGHT', 'RIGHT_BRACKET' ].include?(key)
      key = 'KeyCode::BRACKET_R'
    end
  end
end

new_array = creator(array, num_array, letter_array)
trigger_array = creator(trigger, num_array, letter_array)
final_array = trigger_array.push(new_array)
p final_array.join(', ')


def email_regex()

end