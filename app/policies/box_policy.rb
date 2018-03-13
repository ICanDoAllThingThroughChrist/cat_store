#that allows updating a post if the user is an admin, or if the post is unpublished
class BoxPolicy < ApplicationPolicy
    attr_reader :user, :post
  
    def initialize(user, post)
      @user = user
      @post = post
    end
  
    def update?
      user.admin? or not post.published?
    end
  end