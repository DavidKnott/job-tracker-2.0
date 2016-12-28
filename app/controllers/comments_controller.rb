class CommentsController < ApplicationController


  def create
   @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "You've successfully left a comment!"
      redirect_to company_job_path(@job.company, @job)
    else
      redirect_to company_job_path(@job.company, @job)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    job = comment.job
    comment.destroy
    flash[:success] = "You've successfully destroyed a comment!"
    redirect_to company_job_path(job.company, job)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end