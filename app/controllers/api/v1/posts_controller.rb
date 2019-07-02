module Api
    module V1
        class PostsController <ApplicationController
            def index
                posts = Post.order('created_at DESC')
                render json: { message: 'succesfully', data:posts }, status: :ok
            end

            def show
                post = Post.find(params[:id])
                render json: { message: 'succesfully', data:post }, status: :ok
            end

            def create
                post =Post.new(post_params)

                if post.save
                    render json: { message: 'succesfully', data:post }, status: :ok
                else
                    render json: { message: 'error', data:post.errors }, status: :unprocessable_entity

                end

            end
            def destroy
                post = Post.find(params[:id])
                post.destroy
                render json: { message: 'succesfull', data:post }, status: :ok
            end

            def update
                post = Post.find(params[:id])
                if post.update_attributes(post_params)
                render json: { message: 'succesfull', data:post }, status: :ok
                else
                    render json: { message: 'error', data:post.errors }, status: :unprocessable_entity
                end
            end

            private
            def post_params
                params.permit(:title, :body)
            end

        end
    end
end