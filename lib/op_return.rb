require_relative "vendor/blockcypher_address" # BCA - BCypherAddress

class OPReturn
  include BCA::Cache

  def self.all(address:)
    new.all address: address
  end

  def all(address:)
    address = BCypherAddress.new address

    cache :data do
      data = address.get_data
      puts "data: #{data}"
      data
    end
  end

end

puts "op_returns:"
# p OPReturn.all address: "1C9CBnURHVbsLtpwby75jWnm36CQH6WKXJ"
# 12RXhCqxnXgJyfJLL2mvcqT3jCQ2o6rMAR # marriage contract
# p OPReturn.all address: "1M97nyNGSDA9ijSGwCTfoiPMKUUSVV8Vmc"
p OPReturn.all address: "1FVfHt4erqCtroBaDyVc9rAsyYAdheF4tF"
