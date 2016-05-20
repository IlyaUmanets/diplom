$('#user_<%= @user.id %>').replaceWith("<%= j(render @user) %>")
