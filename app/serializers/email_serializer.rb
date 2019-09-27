class EmailSerializer < ActiveModel::Serializer
  attributes :id, :title, :priority, :sender, :sender_name
  has_many :sent_mails
end
