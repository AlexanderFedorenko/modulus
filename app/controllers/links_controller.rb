# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  # GET /links/1
  def show
  end

  # GET /1
  def visit
    @link = Link.find_by(short_url: params[:short_url])
    if @link
      redirect_to @link.url
    else
      redirect_to '/'
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links
  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:url)
  end
end
