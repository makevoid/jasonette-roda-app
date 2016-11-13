# blockcypher address - get address data - uses BlockCypher::Api

# utils

module HashUtils
  def symbolize_keys(hash)
    raise "You can't symbolize a non-hash - You've got an unexpected nil value" unless hash
    Hash[hash.map{ |key, value| [key.to_sym, value] }]
  end

  alias :sym_keys :symbolize_keys
end

module Logging
  def log(section, message)
    puts "#{section}:"
    puts message
    puts
  end
end

# gem dependencies


# main class definition

# gets all OP_RETURNs of an address - parses json "searching for" valid contracts

#  tx: 13533bb59070836539cd15a9fe781882718c57ba2b299c0c3f9997f103928a81 - contracts like these (name: abcd -> address) - contract not defined completely but connected to a scriptable interface to an immutable datastore (a bitcoin address referring some other op return space to write details about the contract - the 13533.. tx can be an identifier, indicating the "start" of the contract)

class BCypherAddress
  require 'blockcypher'

  include HashUtils
  include Logging

  attr_reader :address, :api

  alias :addr :address

  def initialize(address)
    @address = address
    @api = BlockCypher::Api.new
    def @api.tx(hash)
      puts "Blockypher /tx - hash: #{hash}"
      blockchain_transaction hash
    end
    def @api.address(addr)
      puts "Blockypher /address - address: #{addr}"
      address_details addr, confirmations: 0
      # address_details addr # defaults to 1 confirmations
    end
    def @api.address_full(addr)
      puts "Blockypher /address_full - address: #{addr}"
      address_full_txs addr
    end
  end

  # - get_outputs - ------------

  def get_outputs(transactions)
    transactions.map do |tx|
      tx = sym_keys tx

      # puts "tx: \n#{tx}"

      # tx_hash = tx[:block_hash] # block hash
      # tx_hash = tx[:hash]

      # tx[:block_height] # block
      # tx[:value] # value in satoshi (estimated)
      # tx[:ref_balance] # balance of the address in satoshi (estimated)
      tx_hash = tx[:tx_hash]

      # puts "tx_hash:"
      # puts tx_hash

      tx_details = api.tx tx_hash

      puts "tx_details: \n#{tx_details}"

      tx_details = sym_keys tx_details

      tx_details[:outputs]
    end.flatten
  end

  require 'htmlentities'; # HTMLEntities.new.decode "&#34;"
  def fix_op_returns(messages) # fix blockcypher's op_return encoding (htmlencoded)
    messages.map do |message|
      HTMLEntities.new.decode message
    end
  end

  def get_data
    txs = get_transactions
    # raise txs.inspect

    # DEBUG = true
    #
    # if DEBUG
    # tx = txs.first
    # # tx = txs.last
    # txs = [tx]
    # end

    outputs = get_outputs txs

    outputs.uniq!

    outputs.map!{ |output| sym_keys output }

    op_returns = outputs.select do |out|

      out[:script_type] == "null-data"
      # filters all outputs, gets all op_return data (data_string) from transaction  (type == "data", null-data in blockcypher's api)
    end.map{ |out| out[:data_string] }

    op_returns = fix_op_returns op_returns

    # puts "op_returns:"
    # op_returns
    # puts

    op_returns
  end
  # TODO: cleanup

  alias :data :get_data


  # TODO: add OP_RETURN parsing / OP_RETURN data - https://runkit.com/makevoid/ - https://runkit.com/makevoid/bcypher-op-return (prototype that calls the endpoint for now... TODO)

  def get_transactions
    addr = begin
      @api.address @address
      # @api.address_full @address # - you need to use addr["txs"] when using this
    rescue BlockCypher::Api::Error => e
      raise e
      return
    end
    # addr["txs"] # for address_full
    #

    puts "BCAddress.get_transactions - addess details: #{addr}"

    # config
    #
    # to allow all the transactions (gets non-confirmed op-return messages as well)
    allow_unconfirmed = true

    transactions  = addr["txrefs"] || []

    transactions += addr["unconfirmed_txrefs"] || []  if allow_unconfirmed

    transactions
  end

  alias :get_tx :get_transactions

  # private

  # ...

end




# test code ---------------
# if __FILE__ ... (support irb require and running in shell)

module Caching
  require 'redis'
  require 'oj'
  R = Redis.new
  # R.flushdb if RESET
  # R.flushdb

  def cache(key, &block)
    cache_key = "b_a_cache:#{key}"
    value = R[cache_key]
    puts "cache read: #{value.inspect}"
    value = Oj.load value if value
    return value if value
    value = block.call
    puts "cache write: #{value.inspect}"
    R[cache_key] = Oj.dump value
    value
  end
end

module BCA
module Cache
  include Caching
end
end

# running this file:

# ruby lib/vendor/blockcypher_address.rb


# uncomment the following code:
#
# include Logging
# include Caching
#
#
# # config vars
#
# # address = "1C9CBnURHVbsLtpwby75jWnm36CQH6WKXJ"
# address = "12RXhCqxnXgJyfJLL2mvcqT3jCQ2o6rMAR"
#
#
# # ---
#
# address = BCypherAddress.new address
#
# address_data = cache :data do
#   data = address.get_data
#   puts "data: #{data}"
#   data
# end
#
# log :data,            address_data                      # prints op_return data - arbitrary transaction data format/space/protocol (OP_RETURN)
#
# # tx_id_sample = "6ccb90813afb1ef86cf778be68d43f2625352a03791b22aa4cdb9fbf622a108b"
# #
# # log :tx,            address.api.tx(tx_id_sample)      # tx details
# # log :address,       address.api.address(address)      # address details
# # log :address_full,  address.api.address_full(address) # address details (extended)
#
#
# puts "done"
#
#
# op_returns = address_data.map{ |op_return| Oj.load op_return }
#
# puts "op_returns:"
# require 'pp'
# pp op_returns
# puts

# smart conditions
#
# enabled = address_data.first == "enabled"
# enabled = address_data.first[:enabled] # == true (value parsed from json)

# ------




# otp on btc



# ------

# notes:

# w/o log function
#
# address = BCypherAddress.new "1C9CBnURHVbsLtpwby75jWnm36CQH6WKXJ"
# address_data = address.get_data
# puts "data:"
# puts address_data
# puts "tx:"
# puts address.api.tx
# puts "address:"
# puts address.api.address
# puts "address_full:"
# puts address.api.address_full
