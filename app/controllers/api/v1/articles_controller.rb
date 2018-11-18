module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded articles', data:articles}, status: :ok
            end

            # Let's us view the articles in the db.
            def show
                article = Article.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded article', data:article}, status: :ok
            end

            # Let's us add a new article.
            def create
                article = Article.new(article_params)

                if article.save
                    render json: {status: 'SUCCESS', message: 'Added article', data:article}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Article not added.', data:article.errors},
                    status: :unprocessable_entity
                end
            end

            # Allows us to delete an article
            def destroy
                article = Article.find(params[:id])
                article.destroy
                render json: {status: 'SUCCESS', message: 'Deleted article.', data:article}, status: :ok
            end

            def update 
                article = Article.find(params[:id])
                if article.update_attributes(article_params)
                    render json: {status: 'SUCCESS', message: 'Updated article.', data:article}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Article not updated.', data:article.errors},
                    status: :unprocessable_entity
                end
            end

            # Method to ensure that the data entered is permitted.
            private 
            def article_params
                params.permit(:title, :body)
            end
        end
    end
end