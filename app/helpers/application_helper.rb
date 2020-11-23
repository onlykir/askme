module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declination_of_word(count, form_, form_a, form_ov)
    return form_ov if (11..14).include?(count % 100)

    last_num = count % 10

    return form_ if last_num == 1
    return form_a if (2..4).include?(last_num)
    form_ov
  end

end
