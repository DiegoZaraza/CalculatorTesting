class CalculatorPage < SitePrism::Page
  set_url "https://codepen.io/freeCodeCamp/full/rLJZrA"
  set_url_matcher /codepen.io\/?/

  element :frame, :xpath, '//*[@id="result"]'
  element :contain_buttons, :xpath,  '//*[@id="buttons"]'
  element :txt_answer, :xpath, '//*[@id="answer"]'
  element :txt_history, :xpath, '//*[@id="history"]'

  def change_frame
    page.driver.browser.switch_to.frame 'result'
  end

  def click_button(value)
    contain_buttons.all('button').find do |button_value|
      if button_value.text.eql?(value)
          button_value.click
      end
    end
  end

  def get_result
    txt_answer.text
  end

  def get_history
    txt_history.text
  end
end
