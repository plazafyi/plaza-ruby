# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::OptimizeTest < PlazaSDK::Test::ResourceTest
  def test_create_required_params
    response = @plaza.optimize.create(waypoints: {coordinates: [0], type: :Point})

    assert_pattern do
      response => PlazaSDK::OptimizeResult
    end

    assert_pattern do
      case response
      in PlazaSDK::OptimizeCompletedResult
      in PlazaSDK::OptimizeProcessingResult
      end
    end
  end

  def test_retrieve
    response = @plaza.optimize.retrieve("job_id")

    assert_pattern do
      response => PlazaSDK::OptimizeJobStatus
    end

    assert_pattern do
      response => {
        status: PlazaSDK::OptimizeJobStatus::Status,
        error: String | nil,
        result: PlazaSDK::Internal::Type::Unknown | nil
      }
    end
  end
end
