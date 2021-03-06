require 'spec_helper'

describe Admin::ResearchProjectsController do
  describe "Get new" do
    it_behaves_like "require sign in" do
      let(:action) { get :new }
    end
    it_behaves_like "require admin" do
      let(:action) { get :new }
    end

    it "sets the @ researchproject to a new research project" do
      set_current_admin
      get :new
      expect(assigns(:research_project)).to be_instance_of ResearchProject
    end

    it "sets the flash error message for regular user" do
      set_current_user
      get :new
      expect(flash[:alert]).to be_present
    end
  end

  describe "POST create" do

    it_behaves_like "require sign in" do
      let(:action) { post :create }
    end
    it_behaves_like "require admin" do
      let(:action) { post :create }
    end

    context "with valid input" do

      it "creates a new research project" do
        set_current_admin
        post :create, research_project: Fabricate.attributes_for(:research_project)
        expect(ResearchProject.count).to eq(1)
      end

      it "redirects to the admin research projects page" do
        set_current_admin
        post :create, research_project: Fabricate.attributes_for(:research_project) 
        expect(response).to redirect_to admin_research_projects_path
      end

      it "sets the flash success message" do
        set_current_admin
        post :create, research_project: Fabricate.attributes_for(:research_project) 
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do
      it "does not create a new research project" do
        set_current_admin
        post :create, research_project: Fabricate.attributes_for(:research_project, title: "") 
        expect(ResearchProject.count).to eq(0)
      end

      it "renders the new template" do
        set_current_admin
        post :create, research_project: Fabricate.attributes_for(:research_project, title: "") 
        expect(response).to render_template :new
      end

      it "sets the flash alert message" do
        set_current_admin
        post :create, research_project: Fabricate.attributes_for(:research_project, title: "") 
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "PUT #update" do

    let(:research_project) { Fabricate(:research_project) }

    it_behaves_like "require sign in" do
      let(:action) { post :update, id: research_project.id }
    end

    it_behaves_like "require admin" do
      let(:action) { post :update, id: research_project.id }
    end
    
    context "with valid input" do
      it "updates an existing record" do
        set_current_admin
        put :update, id: research_project.id, research_project: { title: "edited title" }
        expect(ResearchProject.find(research_project.id).title).to eq("edited title")
      end

      it "sets a flash success message" do
        set_current_admin
        put :update, id: research_project.id, research_project: { title: "edited title" }
        expect(flash[:notice]).to be_present
      end

      it "redirects to the reserch projects page" do
        set_current_admin
        put :update, id: research_project.id, research_project: { title: "edited title" }
        expect(response).to redirect_to admin_research_projects_path
      end
    end

    context "with invalid input" do
      it "does not update an existing record" do
        set_current_admin
        put :update, id: research_project.id, research_project: { title: "" }
        expect(ResearchProject.find(research_project.id).title).not_to eq("")
      end

      it "renders the edit page" do
        set_current_admin
        put :update, id: research_project.id, research_project: { title: "" }
        expect(response).to render_template :edit
      end

      it "set a flash alert message" do
        set_current_admin
        put :update, id: research_project.id, research_project: { title: "" }
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do

    let(:research_project) { Fabricate(:research_project) }

    it_behaves_like "require sign in" do
      let(:action) { post :update, id: research_project.id }
    end

    it_behaves_like "require admin" do
      let(:action) { post :update, id: research_project.id }
    end

    it "deletes the research project" do
      set_current_admin
      delete :destroy, id: research_project.id
      expect(ResearchProject.count).to eq(0)
    end

    it "redirects to the admin research projects page" do
      set_current_admin
      delete :destroy, id: research_project.id
      expect(response).to redirect_to admin_research_projects_path
    end

    it "set the flash message" do
      set_current_admin
      delete :destroy, id: research_project.id
      expect(flash[:notice]).to be_present
    end
  end
end
