class Machinery < ApplicationRecord
  belongs_to :provider
  belongs_to :enterprise
end
