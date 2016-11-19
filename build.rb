require_relative 'app'

def build_app(app_name)
  jason = AppFn app_name
  jason = { "$jason": jason }
  jason_json = Oj.dump jason, indent: 2
  File.open("dist/#{app_name}.json", "w") do |f|
    f.write jason_json
  end
end

# build_app # app_name

build_app "hello_world"
build_app "hello_world_refresh"
build_app "hello_image"

build_app "chat"
build_app "company_details"
build_app "weather"
build_app "test"
build_app "hello_world_kb" # laser cat
build_app "ipfs_upload"
build_app "ipfs_upload_add"

#


# ---------
#
# Jason = AppFn "hello_world"
# Jason = AppFn "hello_world_refresh"
# Jason = AppFn "hello_image"
#
# # ------------
# # these two components (op_return_...) make network requests (blockcypher api)
# #
# # Jason = AppFn "op_return_contract"
# # Jason = AppFn "op_return_contract_marriage"
# Jason = AppFn "chat"
# Jason = AppFn "company_details"
# Jason = AppFn "weather"
# Jason = AppFn "test"
# Jason = AppFn "hello_world_kb" # laser cat
#
# p Jason
