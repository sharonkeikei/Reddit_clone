class VotesController < ApplicationController
  def create
    # post_id = params[:vote][:post_id]
    post_id = params[:post_id]
    # vote = Vote.new(vote_params)
    vote = Vote.new
    vote.post_id = params[:post_id]
    vote.upvote = params[:upvote]
    vote.account_id = current_account.id

    #check if vote by this user exisits
    exisiting_vote = Vote.where(account_id: current_account.id, post_id: post_id)
    @new_vote = exisiting_vote.size < 1
    
    respond_to do |format|   
      format.js {
        if exisiting_vote.size > 0
          #remove exiting vote
          exisiting_vote.first.destroy
        else
          #save the new vote
          if vote.save
            @success = true
          else
            @success = false
          end
        end
        @post = Post.find(post_id)
        @is_upvote = params[:upvote]
        render 'votes/create'
      }
    end
    end

  

  private
  def vote_params
  params.require(:vote).permit(:upvote, :post_id)
  end
end