module Jsonify

  def from_json(json)
    Oj.load json
  end

  def to_json(json)
    Oj.dump
  end

  # alias json

end
