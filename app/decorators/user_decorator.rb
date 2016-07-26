class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :photo_thumbnail

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def photo_thumbnail
    object.photo.thumbnail
  end
end
