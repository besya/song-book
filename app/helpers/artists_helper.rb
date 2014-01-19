module ArtistsHelper
    
  def artists_paginate(style = :full_list)
    pg_html = ""

    params["page"] ? current_page = params["page"].to_i : current_page = 1

    pg_links = artist_page_links
    
    case style
    when :full_list  then
      pg_links.each_with_index do |page,key|
        if key == current_page.to_i
          pg_html += "<span class=\"page_link current_page\">#{page}</span>"
        elsif !page.nil?
          pg_html += "<span class=\"page_link\">#{page}</span>"
        end
      end
      if current_page == 1
        pg_html += "<span class=\"page_link current_page\"><b>#{pg_links[1]}</b></span>"
      else
        pg_html += "<span class=\"page_link first_page\"><b>#{pg_links[1]}</b></span>"
      end
 
      if current_page > 3
        pg_html += "<span class=\"page_link\"><b>#{pg_links[current_page-2]}</b></span>"
      end
 
      if current_page > 2
        pg_html += "<span class=\"page_link\"><b>#{pg_links[current_page-1]}</b></span>"
      end
 
      if current_page > 1 and current_page < pg_links.size
        pg_html += "<span class=\"page_link current_page\"><b>#{pg_links[current_page]}</b></span>"
      end
 
      if current_page < pg_links.count - 2
        pg_html += "<span class=\"page_link\"><b>#{pg_links[current_page+1]}</b></span>"
      end
 
      if current_page < pg_links.count - 3
        pg_html += "<span class=\"page_link\"><b>#{pg_links[current_page+2]}</b></span>"
      end
      
      unless current_page == pg_links.count - 1
        pg_html += "<span class=\"page_link last_page\"><b>#{pg_links.last}</b></span>"
      end

    when :prev_next then
      if current_page > 1
        pg_html += "<span class=\"page_link prev_page\"><b>#{pg_links[current_page - 1]}</b></span>"
      end
 
      if current_page < pg_links.size
        pg_html += "<span class=\"page_link next_page\"><b>#{pg_links[current_page + 1]}</b></span>"
      end
    end

    return raw pg_html
  end
  
  def artist_page_links
    pg_links = []
    Artist.pgcount.times do |pg|
      p = pg+1
      pg_links[p] = link_to(p, "/artists/page/#{p}")
    end
    return pg_links
  end
  
end
