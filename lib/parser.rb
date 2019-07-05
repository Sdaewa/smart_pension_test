record = "webserver.log"
address = /\d{0,9}\.\d{0,9}\.\d{0,9}\.\d{0,9}/


def unique_views(record, address)
  log = File.open(record)
  unique_views = { }
  pages = { "/help_page/1" => [ ], "/contact" => [ ], "/home" => [ ], "/about/2" => [ ], "/index" => [ ], "/about" => [ ] }

  log.each do |row|
    page = row.gsub(address, " ").delete("\n").strip
    ip = address.match(row).to_s
    if !unique_views.include?(page) && !pages[page].include?(ip)
      unique_views[page] = 1
      pages[page]<<ip
    elsif unique_views.include?(page) && !pages[page].include?(ip)
      unique_views[page] += 1
      pages[page] << ip
    end
  end
  arranged = unique_views.sort_by { |k, v| v }.reverse.to_h
  results(arranged, true)
end

def total_views(record,address)
  log = File.open(record)
  total_views = {}
  log.each do |row|
    page = row.gsub(address, " ").delete("\n").strip
    if total_views.include?(page)
      total_views[page] += 1
    else
      total_views[page] = 1
    end
  end
  arranged = total_views.sort_by { |k, v| v }.reverse.to_h
  results(arranged, false)
end

def results(arranged, unique)
  arranged.each do |r, a|
    if unique
      p "#{r}-#{a}" " unique pages views"
    else
      p "#{r}-#{a}" " pages views"
    end
  end
end

p"~~~~~~~~~~~~~~~~~~~~~~~"
p "Most unique page views"
p"~~~~~~~~~~~~~~~~~~~~~~~"
puts
unique_views(record, address)
puts
p"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
p "Most pages viewto less page views"
p"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts
total_views(record, address)