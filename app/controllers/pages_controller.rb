class PagesController < ApplicationController

    def home
        ContactMailer.contact(Post.first).deliver_now
        flash.now[:success]="Bonjour ! Un email a été envoyé :)"
    end

end
