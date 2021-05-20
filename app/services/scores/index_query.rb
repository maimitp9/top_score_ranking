# frozen_string_literal: true

module Scores
  class IndexQuery
    include Searchable

    search_from model: Score, serializer: ScoreSerializer

    attr_accessor :before_score_date, # Date
                  :after_score_date, # Date
                  :name, # String,
                  :limit, # Int
                  :offset # Int

    validates :before_score_date, date_format: true, if: -> { before_score_date.present? }
    validates :after_score_date, date_format: true, if: -> { after_score_date.present? }
    validates :limit, numericality: { greater_than: 0 }
    validates :offset, numericality: { greater_than_or_equal_to: 0 }

    def call
      perform_search do |_score|
        filter_by('players.name', name, csv: true)
        filter_by_score_at
      end
    end

    private

    # Filter
    def filter_by(attr, value, csv: false)
      return @query if value.blank?

      value = value.to_s.split(',') if csv
      @query = query.where(attr => value)
    end

    # rubocop:disable Metrics/AbcSize
    def filter_by_score_at
      return @query if before_score_date.blank? && after_score_date.blank?

      @query =
        case true # rubocop:disable Lint/LiteralAsCondition
        when before_score_date.present? && after_score_date.present?
          query.where('DATE(score_at) BETWEEN ? AND ?', after_score_date.to_date, before_score_date.to_date)
        when before_score_date.present?
          query.where('DATE(score_at) <= ?', before_score_date.to_date)
        when after_score_date.present?
          query.where('DATE(score_at) >= ?', after_score_date.to_date)
        end
    end
    # rubocop:enable Metrics/AbcSize
  end
end
