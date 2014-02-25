class Udemy < ActiveRecord::Base

def self.course_insert(course_type, page_number)
		page_number.times do |pagenumber|
		pagenumber += 1
		doc = Nokogiri::HTML(open("https://www.udemy.com/courses/#{course_type}/?view=list&p=#{pagenumber}&sort=newest"))
        doc.css('#courses li').each do |link|
        title = link.css('.title').to_s.sub('<span class="title ellipsis">', '').sub('</span>','').tr("\n","")
        description = link.css('.desc').to_s.sub('<span class="desc ellipsis">', '').sub('</span>','').tr("\n","")
        count = link.css('.count').to_s.sub('<span class="count spb">', '').sub('</span>','').sub('<b>','').sub('</b>','').sub('students','').tr("\n","")
        price = link.css('.price').to_s.sub('<span class="
                                    price">', '').sub('</span>','').tr("\n","")
        rating = link.css('.small-rating').to_s.sub('<span class="small-rating">
<span style="width:', '').sub('</span>','').sub('%">','').sub('</span>','').tr("\n","")
        self.create(:title => title, :description => description, :count => count, :price => price, :rating => rating, :course_type => course_type)
        
        end
        end
	end

    def self.aux_insert
    end

    def currency_to_integer(price)
        price.sub('$','').to_i
    end

    def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |udemy|
      csv << udemy.attributes.values_at(*column_names)
    end
  end
end
end
