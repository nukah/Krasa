module TypesHelper
  def default_type
    Type.where(:first => true)
  end
end
