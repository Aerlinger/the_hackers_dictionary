require 'spec_helper'

shared_examples_for "all pages" do
  describe "should have alphabetical links at top" do
    it { should have_alphabetical_links }
  end

  describe "should show search box" do
    it { should show_search_box }
  end
end