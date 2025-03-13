class TarotCardsController < ApplicationController
    skip_before_action :authenticate_user, only: [:index, :show] 

    before_action :set_tarot_card, only: %i[show update destroy]
  
    # GET /tarot_cards
    def index
      @tarot_cards = TarotCard.all
      render json: @tarot_cards
    rescue StandardError => e
      render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
    end
  
    # GET /tarot_cards/:id
    def show
      render json: @tarot_card
    end
  
    # POST /tarot_cards
    def create
      @tarot_card = TarotCard.new(tarot_card_params)
      if @tarot_card.save
        render json: @tarot_card, status: :created
      else
        render json: { error: @tarot_card.errors.full_messages }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: "Failed to create tarot card: #{e.message}" }, status: :internal_server_error
    end
  
    # PATCH /tarot_cards/:id
    def update
      if @tarot_card.update(tarot_card_params)
        render json: @tarot_card
      else
        render json: { error: @tarot_card.errors.full_messages }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: "Failed to update tarot card: #{e.message}" }, status: :internal_server_error
    end
  
    # DELETE /tarot_cards/:id
    def destroy
      if @tarot_card.destroy
        head :no_content
      else
        render json: { error: "Failed to delete tarot card" }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: "Failed to delete tarot card: #{e.message}" }, status: :internal_server_error
    end
  
    private
  
    def set_tarot_card
        return render json: { error: "Invalid tarot card ID" }, status: :bad_request unless params[:id].to_i.positive?
      
        @tarot_card = TarotCard.find_by(id: params[:id])
        return render json: { error: "Tarot card not found" }, status: :not_found unless @tarot_card

    end
      
  
    def tarot_card_params
      params.require(:tarot_card).permit(:name, :img_link, :arcana_type, :element, :description)
    end
  end
  