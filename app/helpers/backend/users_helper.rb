module Backend::UsersHelper
  def display_roles_select_box roles
    roles.map{|k, _v| [k, k]}
  end

  def load_table_user user
    return if current_user.member?
    "#{link_to t('.edit'), edit_backend_user_path(user)}
      #{link_to t('.delete'), backend_user_path(user),
        method: :delete, data: {confirm: t('.you_sure')}}"
  end
end
