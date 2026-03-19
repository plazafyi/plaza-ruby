# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::OptimizeTest < Plaza::Test::ResourceTest
  def test_create_required_params
    response = @plaza.optimize.create(waypoints: {coordinates: [0], type: :Point})

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
        error: String | nil,
        result: Plaza::Internal::Type::Unknown | nil
      }
    end
  end
end
