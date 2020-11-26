module ApplicationHelper
  def user_avatar(user)
    if user.avatar.present?
      user.avatar.url
    else
      asset_path 'avatar.jpg'
    end
  end

  def user_profile_background(user)
    if user.profile_background.present?
      user.profile_background
    else
      "#005a55"
    end
  end

  def declination_of_word(count, form, form_a, form_ov)
    return form_ov if (11..14).include?(count % 100)

    last_num = count % 10

    return form if last_num == 1
    return form_a if (2..4).include?(last_num)
    form_ov
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

end
