module CurrentBox 
    private 
    def set_box 
        @box = Box.find(session[:box_id])
    rescue ActiveRecord::RecordNotFound 
        @box = Box.create 
        session[:box_id] = @box.id 
    end 
end