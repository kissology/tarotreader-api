class ReadingsController < ApplicationController

     # GET /readings
  def index
    readings = Reading.all.includes(:client, :reading_type, tarot_cards: :reading_cards)
    render json: readings, include: [:client, :reading_type, tarot_cards: { only: [:id, :name, :arcana_type, :element], methods: [:position] }]
  rescue StandardError => e
    render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
  end

  def show
    if @reading
      render json: @reading, include: [:client, :reading_type, tarot_cards: { only: [:id, :name, :arcana_type, :element], methods: [:position] }]
    else
      render json: { error: "Reading not found" }, status: :not_found
    end
  end

  def create
    ActiveRecord::Base.transaction do
      reading = Reading.new(reading_params)
  
      reading.client_id = params[:client_id]

      required_cards = Reading::REQUIRED_CARDS[reading.reading_type_id]
      return render json: { error: "Invalid reading type" }, status: :unprocessable_entity if required_cards.nil?

      selected_cards = TarotCard.order(Arel.sql("RANDOM()")).limit(required_cards)
  
      shuffled_cards = selected_cards.shuffle
      shuffled_cards.each do |card|
        reading.reading_cards.build(
          tarot_card_id: card.id,
          position: [1, 2].sample  
        )
      end
  
      if reading.save
        render json: reading, include: [:reading_type, { reading_cards: { include: :tarot_card, methods: [:position] } }], status: :created
      else
        render json: { error: "Validation failed", details: reading.errors.full_messages }, status: :unprocessable_entity
      end
    end
  rescue StandardError => e
    render json: { error: "Failed to create reading: #{e.message}" }, status: :internal_server_error
  end

  private

  def set_reading
    @reading = Reading.find_by(id: params[:id])
  end

  def reading_params
    params.require(:reading).permit(:client_id, :reading_type_id, :reading_date)
  end
end
