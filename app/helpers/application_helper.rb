module ApplicationHelper
    def gravatar_for(user)
        # gravatar urls are based on MD5 hash of user's email address
        # in Ruby, this is implemented using the HEX digest method
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        # img-circle from BootStrap 
        image_tag(gravatar_url, alt: user.username, class: "rounded-circle mx-auto d-block")
    end
end
