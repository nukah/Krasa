module TypesHelper
  def active_type
      if session[:active_type]
        Type.find_by_permalink!(session[:active_type])
      else
        Type.where(:first => true).first
      end
  end
end
