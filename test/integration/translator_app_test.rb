require 'test_helper'

class TranslatorAppTest < ActiveSupport::TestCase
  include Capybara
  
  setup { sign_in(admin) }
  
  teardown { Translator.reload! }
  
  def admin
    @admin ||= Admin.create!(:email => "admin_#{Admin.count}@example.org", :password => "123456")
  end
  
  def sign_in(admin)
    visit "/admins/sign_in"
    fill_in "Email", :with => admin.email
    fill_in "Password", :with => admin.password
    click_button "Sign in"
  end
    
  test "can translate messages from a given locale to another" do
    assert_raise(I18n::MissingTranslationData) do
      I18n.l(Date.new(2010, 04, 17), :locale => :pl)
    end
    
    visit "/translator/en/pl"
    fill_in "date.formats.default", :with => %{"%d-%m-%Y"}
    click_button "Store translations"
    
    assert_match("Translations stored with success!", page.body)
    assert_equal("17-04-2010", I18n.l(Date.new(2010, 04, 17), :locale => :pl))
  end
end