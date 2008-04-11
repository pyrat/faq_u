module FaqAdminHelper

  # Returns a div for each key passed if there's a flash
  # with that key
  def flash_div *keys
    divs = keys.select { |k| flash[k] }.collect do |k|
      content_tag :div, flash[k], :class => "flash #{k}"
    end
    divs.join
  end


end
