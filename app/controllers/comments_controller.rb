class CommentsController < ApplicationController


  def create
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "You've successfully left a comment!"
      redirect_to company_job_path(@job.company, @job)
    else
      redirect_to company_job_path(@job.company, @job)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end