class Current < ActiveSupport::CurrentAttributes
	attribute :user  #for store teacher in variable for processing the request so it will automatically cleared on new request
end