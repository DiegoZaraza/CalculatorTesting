Given('Enter de calculator') do
  @CalculatorPage = CalculatorPage.new
  @CalculatorPage.load
  @CalculatorPage.change_frame
  @values = Array.new
end

When('Click the button {string}') do |value|
  value.chars.each { |e| @CalculatorPage.click_button(e)}
  @values << value
end

When('Click the button CE') do
  @CalculatorPage.click_button('CE')
  position = @values.length - 1
  @values.delete(@values[position])
end

When('Click the button equal') do
  @CalculatorPage.click_button('=')
end

Then('Validate result operation') do
  result = operations(@values)
  expect(@CalculatorPage.get_result.to_f.round(2)).to eq(result)
  sleep 5
end

Then('Validate error in the operation') do
  expect(@CalculatorPage.get_history).to eq('Digit Limit Met')
  sleep 5
end
