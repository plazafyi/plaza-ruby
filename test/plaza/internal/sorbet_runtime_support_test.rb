# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::SorbetRuntimeSupportTest < Minitest::Test
  extend Minitest::Serial

  i_suck_and_my_tests_are_order_dependent!

  module E
    extend Plaza::Internal::Type::Enum

    define_sorbet_constant!(:TaggedSymbol) { 1 }
  end

  module U
    extend Plaza::Internal::Type::Union

    define_sorbet_constant!(:Variants) { 2 }
  end

  class M < Plaza::Internal::Type::BaseModel
    define_sorbet_constant!(:OrHash) { 3 }
  end

  def test_nil_aliases
    err = Plaza::Internal::Util::SorbetRuntimeSupport::MissingSorbetRuntimeError

    assert_raises(err) { Plaza::Internal::AnyHash }
    assert_raises(err) { Plaza::Internal::FileInput }
    assert_raises(err) { Plaza::Internal::Type::Converter::Input }
    assert_raises(err) { Plaza::Internal::Type::Converter::CoerceState }
    assert_raises(err) { Plaza::Internal::Type::Converter::DumpState }
    assert_raises(err) { Plaza::Internal::Type::BaseModel::KnownField }
    assert_raises(err) { Plaza::Internal::Util::ParsedUri }
    assert_raises(err) { Plaza::Internal::Util::ServerSentEvent }
    assert_raises(err) { Plaza::Internal::Transport::BaseClient::RequestComponents }
    assert_raises(err) { Plaza::Internal::Transport::BaseClient::RequestInput }
    assert_raises(err) { Plaza::Internal::Transport::PooledNetRequester::Request }
    assert_raises(err) { E::TaggedSymbol }
    assert_raises(err) { U::Variants }
    assert_raises(err) { M::OrHash }
  end

  def test_stubbed_aliases
    Kernel.instance_eval { const_set(:T, nil) }

    assert_equal(1, E::TaggedSymbol)
    assert_equal(2, U::Variants)
    assert_equal(3, M::OrHash)
  end
end
