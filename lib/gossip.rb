

require 'csv'

class Gossip

	attr_accessor :author, :content

	def initialize(author, content)
		@content = content
		@author = author
	end
	

	def save
		CSV.open("/home/dev/Bureau/The_gossip_sinatra/db/gossip.csv", "ab") do |csv|
			csv << ["#{@author}", "#{@content}"]
		end
	end


	def self.all
  all_gossips = []
  CSV.read("/home/dev/Bureau/The_gossip_sinatra/db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
 		 end
 		 return all_gossips
	end


def self.find(id)
    @id = id
    return Gossip.all[id.to_i]
  end


	def edit(id)
		 @id = id
		CSV.update("/home/dev/Bureau/The_gossip_sinatra/db/gossip.csv", "ab") do |csv|
			  return Gossip.update[id]
		end
	end

end


