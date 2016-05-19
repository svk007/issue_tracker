authorization do
  role :developer do
    # add permissions for guests here, e.g.
    # has_permission_on :conferences, :to => :read
    has_permission_on :issues, to: [:read]
  end
  
  # permissions on other roles, such as
  role :admin do
     has_omnipotence
  end
  role :user do
     has_permission_on :welcome, :to => [:read]
  #   has_permission_on :conferences, :to => [:update, :delete] do
  #     if_attribute :user_id => is {user.id}
  #   end
  end
  # See the readme or GitHub for more examples
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
