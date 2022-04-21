# frozen_string_literal: true

# basic user class for crud operations
class BooksController < ApplicationController


  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      redirect_to books_url(@book), notice: 'Book was created successfully'
    else
      redirect_to new_book_url, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end

  def about

  end

  def destroy
    @book.destroy

    redirect_to books_url, notice: 'Book was destroyed successfully'
  end

  private
  def book_params
    params.require(:book).permit(:name, :desc, :id)
  end
end
