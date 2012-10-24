include ApplicationHelper
include StaticPagesHelper

RSpec::Matchers.define :have_alphabetical_links do |message|
  alphabet = ("A".."Z")
  match do |page|
    alphabet.each do |letter|
      page.should have_selector("a", text: letter)
    end
  end
end

RSpec::Matchers.define :show_search_box do |message|
  match do |page|
    page.should have_selector("div", id: "search-box")
    page.should have_selector("input", id: "search-input")
    page.should have_selector("input", id: "search_for_name")
    page.should have_selector("input", id: "search_for_name")
  end
end