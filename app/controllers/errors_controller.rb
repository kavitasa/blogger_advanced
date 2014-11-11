class ErrorsController < ApplicationController
  def not_found
    render "404", :status => 404
  end

  def unprocessable
    render "422", :status => 422
  end

  def server_error
    @exception = request.env["action_dispatch.exception"]
    render "500", :status => 500
  end
end
