require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #index" do
  context 'when logged in' do
    before :each do
      @user = sign_in create( :user )
    end
    it "should be redirected to signin" do
      login_with nil
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
    it "should let a user see all the categories" do 
      get :index
      expect( response ).to render_template( :index )
    end
    it 'response with 200 status' do
       get :index
       expect(response).to have_http_status(200)
    end
    it "populates an array of categories" do
      category = create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end
end
  describe "GET #show" do
  	before :each do
      login_with create( :user )
    end
	it "assigns the requested category to @category" do
	  category = create(:category)
	  get :show, id: category
	  expect(assigns(:category)).to eq(category)
	end
    it "renders the #show view" do
	  get :show, id: create(:category)
	  expect( response ).to render_template( :show )
	end
	it 'respond with success' do
       category = create(:category)
       get :show, id: category
       expect(response).to be_success
    end
  end

  describe "GET #new" do
    before :each do
      login_with create( :user )
    end
    it 'assigns a new category to @category' do
    get :new
    expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "POST #create" do
  	before :each do
      login_with create( :user, :admin )
    end
    it "creates a new category" do
      expect{
        post :create, category: FactoryGirl.attributes_for(:category)
      }.to change(Category,:count).by(1)
    end
    it "redirects to the new category" do
      post :create, category: FactoryGirl.attributes_for(:category)
      expect(response).to redirect_to Category.last
    end
    it 'does not create the category' do
       post :create, category: FactoryGirl.attributes_for(:category, title: nil)
       expect(Category.count).to eq(0)
     end
     it "re-renders the new method" do
      post :create, category: FactoryGirl.attributes_for(:category, title: nil)
      expect(response).to render_template :new
    end
   end

   describe 'PUT update' do
   	 before :each do
      login_with create( :user, :admin )
     end
     it "located the requested category" do
      category = create(:category)
      put :update, id: category, category: FactoryGirl.attributes_for(:category)
      expect(assigns(:category)).to eq(category)      
    end
    it "changes category's attributes" do
      category = create(:category)
      put :update, id: category,
        category: FactoryGirl.attributes_for(:category, title: "BBB")
      category.reload
      expect(category.title).to eq("BBB")
    end
    it "re-renders the edit method" do
      category = create(:category)
      put :update, id: category, category: FactoryGirl.attributes_for(:category, title: nil)
      expect(response).to render_template :edit
    end
   end

   describe 'DELETE destroy' do
    
     it "deletes the category" do
      login_with create( :user, :admin )
      category = create(:category)
      expect{
      delete :destroy, id: category, category: FactoryGirl.attributes_for(:category)      
        }.to change(Category, :count).by(-1)
   end
 end
end