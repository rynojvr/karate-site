module MembersHelper

  def belt_options
    belts = Member.select('DISTINCT belt').collect(&:belt).collect {|b| [b, b]}
  end

end
