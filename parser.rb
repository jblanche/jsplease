require 'nokogiri'
require 'open-uri'

class Feature
  attr_accessor :name, :kind, :tags, :status, :filename, :standard
  attr_accessor :min_ie, :ff, :sf, :webkit, :chrome, :opera

  def filename
    filename = name.gsub(/[\. ]/, "_").gsub(/[\"]/, "") + ".md"
  end

  def status
    if min_ie && min_ie.gsub(/[^0-9]/, '').to_i <= 7 &&  ff == :old &&  sf == :old &&  webkit == true &&  chrome == :old &&  opera == :old
      return 'use'
    elsif min_ie && min_ie.gsub(/[^0-9]/, '').to_i <= 9 &&  ff != false &&  sf != false &&  webkit = true &&  chrome != false &&  opera != false
      return 'caution'
    end
    return 'avoid'
  end

  def doc
    return <<EOF
feature: #{name}
status: #{status}
standard: #{standard}
min_ie: #{min_ie}
ff: #{ff}
sf: #{sf}
webkit: #{webkit}
chrome: #{chrome}
opera: #{opera}
tags:
kind:
polyfillurls:

EOF
  end

  def save
    File.open("posts/#{filename}", 'w') {|f| f.write(doc) }
  end
end

standard_index = './data/es5-compat-table/index.html'
non_standard_index = './data/es5-compat-table/non-standard/index.html'

[standard_index, non_standard_index].each do |index|
  doc_uri = index
  doc = Nokogiri::HTML(open(doc_uri))

  doc.css('tbody tr').each do |f|
    feature = nil
    f.search('td:first-child').each do |name|
      feature = Feature.new
      feature.name = name.text.gsub(/\[[0-9]\]/, '').strip
    end

    next unless feature

    feature.standard = !doc_uri.include?('non-standard')

    #IE
    feature.min_ie = false
    f.search("td[class*='ie']").each do |ie_version|
      version = ie_version['class'].gsub(/[^0-9]/, '')
      is_supported = ie_version['class'].start_with?('yes')
      feature.min_ie = "gtie#{version}" and break if is_supported
    end

    #FF
    feature.ff = false
    f.search("td[class*='firefox']").each do |ff_version|
      version = ff_version['class'].gsub(/[^0-9]/, '')[0]
      is_supported = ff_version['class'].start_with?('yes')
      if is_supported
        feature.ff = :old and break if version.to_i <= 3
        feature.ff = :new and break if version.to_i >= 4
      end
    end

    #SF
    feature.sf = false
    f.search("td[class*='safari']").each do |sf_version|
      version = sf_version['class'].gsub(/[^0-9]/, '')[0]
      is_supported = sf_version['class'].start_with?('yes')
      if is_supported
        feature.sf = :old and break if version.to_i <= 4
        feature.sf = :new and break if version.to_i >= 5
      end
    end

    #Webkit
    feature.webkit = false
    f.search("td[class*='webkit']").each do |webkit_version|
      is_supported = webkit_version['class'].start_with?('yes')
      if is_supported
        feature.webkit = true
      end
    end

    #Chrome
    feature.chrome = false
    f.search("td[class*='chrome']").each do |chrome_version|
      version = chrome_version['class'].gsub(/[^0-9]/, '')
      is_supported = chrome_version['class'].start_with?('yes')
      if is_supported
        feature.chrome = :old and break if version.to_i <= 12
        feature.chrome = :new and break if version.to_i >= 13
      end
    end

    #Opera
    feature.opera = false
    f.search("td[class*='opera']").each do |opera_version|
      version = opera_version['class'].split('_').first.gsub(/[^0-9]/, '')
      is_supported = opera_version['class'].start_with?('yes')
      if is_supported
        feature.opera = :old and break if version.to_i <= 11
        feature.opera = :new and break if version.to_i >= 12
      end
    end

    feature.save
  end
end




