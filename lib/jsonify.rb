module Jsonify

  def from_json(json)
    Oj.load json
  end

  def to_json(json)
    # Oj.dump json
    json.to_json
  end

  # alias json

end
