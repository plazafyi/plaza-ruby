# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::OptimizeTest < Plaza::Test::ResourceTest
  def test_create_required_params
    response =
      @plaza.optimize.create(
        waypoints: {coordinates: [[2.3522, 48.8566], [2.3376, 48.8606], [2.2945, 48.8584]], type: :MultiPoint}
      )

    assert_pattern do
      response => Plaza::OptimizeResult
    end

    assert_pattern do
      case response
      in Plaza::OptimizeCompletedResult
      in Plaza::OptimizeProcessingResult
      end
    end
  end

  def test_retrieve
    response = @plaza.optimize.retrieve("job_id")

    assert_pattern do
      response => Plaza::OptimizeJobStatus
    end

    assert_pattern do
      response => {
        status: Plaza::OptimizeJobStatus::Status,
        result: Plaza::OptimizeCompletedResult | nil
      }
    end
  end
end
