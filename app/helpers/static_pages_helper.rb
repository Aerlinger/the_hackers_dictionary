module StaticPagesHelper
  def full_title(sub_title)
    sub_title = "| #{sub_title}"
    "The Hacker's Dictionary #{sub_title}"
  end

  def alphabetical_nav_links(separator = " ")
    alphabet = ("A".."Z")

    alphabetical_links = alphabet.collect do |letter|
      link_to(letter, definitions_path(letter: letter), {id: letter, class: "alphabet_links"})
    end

    raw alphabetical_links.join(separator)
  end

  def category_nav_links(num=20, separator = " / ")

    category_links = Category.limit(num).each_with_index.collect do |category, index|
      link_to(category.name, category, {id: "category#{index}", class: "category_links"})
    end

    raw category_links.join(separator)
  end

  def top_rated_links(top_links, limit = 10)
    link_list = top_links.to(limit-1).collect do |link|
      content_tag(:li) do
        link_to(link, link, class: "top-link")
      end
    end
    raw link_list.join("")
  end

end
