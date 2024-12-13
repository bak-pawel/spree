module Spree
  module Admin
    class PromotionsController < Spree::Admin::BaseController
      before_action :load_promotion, only: [:edit, :update, :destroy]

      def index
        @promotions = Spree::Promotion.all
      end

      def new
        @promotion = Spree::Promotion.new
      end

      def create
        @promotion = Spree::Promotion.new(promotion_params)
        if @promotion.save
          redirect_to spree.admin_promotions_path, notice: 'Promocja została utworzona.'
        else
          render :new
        end
      end

      def edit
      end

      def update
        if @promotion.update(promotion_params)
          redirect_to spree.admin_promotions_path, notice: 'Promocja została zaktualizowana.'
        else
          render :edit
        end
      end

      def destroy
        @promotion.destroy
        redirect_to spree.admin_promotions_path, notice: 'Promocja została usunięta.'
      end

      private

      def load_promotion
        @promotion = Spree::Promotion.find(params[:id])
      end

      def promotion_params
        params.require(:promotion).permit(:name, :description, :code, :starts_at, :expires_at, :usage_limit, :match_policy, :path, :advertise, :per_code_usage_limit, :combine, rules_attributes: [:type, :preferences, :_destroy], actions_attributes: [:type, :preferences, :_destroy])
      end
    end
  end
end
