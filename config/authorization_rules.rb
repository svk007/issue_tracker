authorization do
  role :Developer do
    # add permissions for guests here, e.g.
    # has_permission_on :conferences, :to => :read
    has_permission_on :issues, to: [:index, :show]
  end
  
  # permissions on other roles, such as
  role :Admin do
     has_omnipotence
  end

  role :guest do
    has_permission_on :issues, to: [:new, :create, :index, :show, :show_user_submissions]
  end
  
  
  #   has_permission_on :conferences, :to => [:update, :delete] do
  #     if_attribute :user_id => is {user.id}
  #   end
  # See the readme or GitHub for more examples
end

