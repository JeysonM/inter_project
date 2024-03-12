module Api
  module V1
    class BooksController < ApplicationController
    before_action :set_book, only: [:show, :update, :destroy]

    # GET /books
    def index
      @books = Book.all

      render json: @books
    end

    def ruby_versions
      @apiRelease = 'https://api.github.com/repos/rails/rails/releases'
      resp = HTTP.get(@apiRelease).body
      releases = []
      json_data = JSON.parse(resp)
      json_data.each do |release|
          value = { release:  release['name']}
          releases << value
      end
      render json: releases


      apirRelease = ""
      resp = Http.get(apirRelease).body
      json_data = JSON.parse(resp)

      

    end

    # GET /books/1
    def show
      render json: @book
    end

    # POST /books
    def create
      @book = Book.new(book_params)

      if @book.save
        render json: @book, status: :created, location: @book
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /books/1
    def update
      if @book.update(book_params)
        render json: @book
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end

    # DELETE /books/1
    def destroy
      @book.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_params
        params.require(:book).permit(:title, :autor, :description)
      end
    end
  end
end
