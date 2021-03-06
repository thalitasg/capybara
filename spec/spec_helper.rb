require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  if config.files_to_run.one?
    config.default_formatter = "doc"
  end
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  config.include Capybara::DSL

  config.before(:example) do
    #page.current_window.resize_to(1280, 800)

    #full HD
    page.current_window.resize_to(1920, 1080)
  end

  config.after(:example) do |e|
    nome =  e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')
    page.save_screenshot('log/' + nome + '.png') if e.exception
  end 
end

Capybara.configure do |config|
  #Firefox
  #config.default_driver = :selenium

  #Chrome
 # config.default_driver = :selenium_chrome_headless
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'
end