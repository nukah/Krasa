module TypesHelper
  def active_type
      # if not (session[:active_type] and Type.find_by_permalink(session[:active_type]))
      #         session[:active_type] ||= Type.where(:first => true).first.id
      #       end
  end
end
