module ApplicationHelper
  def full_title page_title
    base_title = t "base_title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def category_select
    Category.select_category.map{|category| [category.name, category.id]}
  end

  def status_select
    Order.statuses.map{|k, v| [k, v]}
  end
end
