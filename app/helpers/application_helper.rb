module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def filepicker_user_image_tag_for user
    if user.filepicker_url?
      src = user.filepicker_url + '/convert?w=115&h=115&fit=crop'
    else
      src = "/assets/blank-profile.png"
    end

    return "<img src='#{src}' class='user-img' />".html_safe
  end
  
  def filepicker_trip_image_tag_for trip
    if trip.filepicker_url?
      src = trip.filepicker_url + '/convert?w=215&h=180&fit=crop'
    elsif trip.category == "Adventure"
      src = "/assets/adventure-trip.png"
    elsif trip.category == "Beach"
      src = "/assets/beach-trip.png"
    elsif trip.category == "City"
      src = "/assets/city-trip.png"
    elsif trip.category == "Family"
      src = "/assets/family-trip.png"
    elsif trip.category == "Historical"
      src = "/assets/historical-trip.png"
    elsif trip.category == "Luxury"
      src = "/assets/luxury-trip.png"
    elsif trip.category == "Outdoors"
      src = "/assets/outdoors-trip.png"
    elsif trip.category == "Relaxing"
      src = "/assets/relaxing-trip.png"
    elsif trip.category == "Road trip"
      src = "/assets/road-trip.png"
    elsif trip.category == "Romantic"
      src = "/assets/romantic-trip.png"
    else
      src = "/assets/blank-trip.png"
    end

    return "<img src='#{src}' class='trip-img' />".html_safe
  end
  
  def filepicker_trip_link_src_for trip
    if trip.filepicker_url?
      src = trip.filepicker_url + '/convert?w=215&h=180&fit=crop'
    elsif trip.category == "Adventure"
      src = "/assets/adventure-trip.png"
    elsif trip.category == "Beach"
      src = "/assets/beach-trip.png"
    elsif trip.category == "City"
      src = "/assets/city-trip.png"
    elsif trip.category == "Family"
      src = "/assets/family-trip.png"
    elsif trip.category == "Historical"
      src = "/assets/historical-trip.png"
    elsif trip.category == "Luxury"
      src = "/assets/luxury-trip.png"
    elsif trip.category == "Outdoors"
      src = "/assets/outdoors-trip.png"
    elsif trip.category == "Relaxing"
      src = "/assets/relaxing-trip.png"
    elsif trip.category == "Road trip"
      src = "/assets/road-trip.png"
    elsif trip.category == "Romantic"
      src = "/assets/romantic-trip.png"
    else
      src = "/assets/blank-trip.png"
    end

    return src
  end 
  
end