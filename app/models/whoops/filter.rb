class Whoops::Filter
  include Mongoid::Document
  include FieldNames
  
  [:service, :environment, :event_type, :message, :details].each do |document_field|
    field document_field
  end
    
  def to_query_document
    attributes.except(:_id).delete_if{|k, v| v.blank?}
  end
end
