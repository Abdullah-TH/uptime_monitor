class Ping < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :domain
end
