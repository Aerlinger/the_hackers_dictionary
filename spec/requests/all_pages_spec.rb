require 'spec_helper'

shared_examples_for "all pages" do

  it "should have category links at the top of page" do
    page.should have_css("div.category_links")
    page.should have_css("a.category_link")
  end

  it "should show search box" do
    page.should have_selector("div", id: "search-input")
    page.should have_selector("input", id: "search_box")
  end

end