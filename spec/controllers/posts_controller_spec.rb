require 'rails_helper'

describe PostsController do
    login_user
    describe "GET #index" do
        it "populates an array of posts" do
            post = FactoryBot.create(:post)
            get :index
            expect(assigns(:posts)).to eq([post])
        end

        it "renders the :index view" do
            get :index
            expect(response).to render_template :index
        end
    end 

    describe "GET #show" do
        it "assigns the requested post to @post" do
            post = FactoryBot.create(:post)
            get :show, params: {id: post }
            expect(assigns(:post)).to eq(post)
        end

        it "renders #show view" do
            get :show, params: {id: FactoryBot.create(:post)}
            expect(response).to render_template :show
        end 
    end
    
    describe "GET #new" do
        it "assigns a title and content to the new post" do
            get :new
            expect(assigns(:post)).to be_a_new(Post)
        end
    end 

    describe "POST #create" do 
        context "with valid attributes" do
            it "creates a new contact" do
                params = FactoryBot.attributes_for(:post)
                puts params
                #assigns({post :create, :post => post_params}).should change(Post, :count).by(1)
                expect{ post :create, params: {post: params}}.to change(Post, :count).by(1)
            end

            it "redirects to the new contact" do
                post :create, params: {post: FactoryBot.attributes_for(:post)}
                expect(response).to redirect_to Post.last
            end
        end
    end 

    describe "PUT update" do
        before :each do
            @post = FactoryBot.create(:post,title: "Tytul",content: "Kontent")
        end 

        context "valid attributes" do
            it "located the requested @post" do
                put :update, params: {id: @post, post: FactoryBot.attributes_for(:post)}
                expect(assigns(:post)).to eq(@post)
            end 

            it "changes @post's attributes" do
                put :update, params:{id: @post, post: FactoryBot.attributes_for(:post,title: "Tytul2",content:"Kontent2")}
                @post.reload
                expect(@post.title).to eq("Tytul2")
                expect(@post.content).to eq("Kontent2")
            end 

        
        end 

        context "invalid attributes" do
            it "locates the requested @post" do
                put :update, params: {id: @post, post: FactoryBot.attributes_for(:invalid_post)}
                expect(assigns(:post)).to eq(@post)
            end 

            it "does not change @contact's attributes" do
                put :update, params: {id: @post, post: FactoryBot.attributes_for(:post,title: "Tytul2",content: nil)}
                @post.reload
                expect(@post.title).not_to eq("Tytul2")
                expect(@post.content).not_to eq(nil)
            end 

            it "re-renders the edit method" do
                put :update, params: {id:@post, post: FactoryBot.attributes_for(:invalid_post)}
                expect(response).to render_template :edit
            end

        end
    end 

    describe "Delete #destroy" do
        before :each do
            @post = FactoryBot.create(:post)
        end 

        it "deleete the contact" do 
            expect{delete :destroy, params: {id: @post}}.to change(Post, :count).by(-1)
        end 

        it "redirects to posts#index" do 
            delete :destroy, params: {id: @post}
            expect(response).to redirect_to root_path
        end 
    end 
end 