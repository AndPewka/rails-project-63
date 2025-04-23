# frozen_string_literal: true

require 'test_helper'

Entity = Struct.new(:name, :job, keyword_init: true)

class FormBuilderTest < Minitest::Test
  def setup
    @entity = Entity.new(name: 'Andrey', job: 'unemployed')
  end

  def test_form_for_with_only_user
    result = HexletCode.form_for @entity
    expected = load_fixture('form_only_user.html')
    assert_equal expected, result
  end

  def test_form_for_with_class
    result = HexletCode.form_for @entity, class: 'hexlet_form'
    expected = load_fixture('form_with_class.html')
    assert_equal expected, result
  end

  def test_form_for_with_url
    result = HexletCode.form_for @entity, url: '/profile'
    expected = load_fixture('form_with_url.html')
    assert_equal expected, result
  end

  def test_form_for_with_class_and_url
    result = HexletCode.form_for @entity, url: '/profile', class: 'hexlet_form'
    expected = load_fixture('form_with_class_and_url.html')
    assert_equal expected, result
  end

  def test_form_for_with_single_input
    result = HexletCode.form_for @entity do |f|
      f.input :name
    end

    expected = load_fixture('form_single_input.html')
    assert_equal expected, result
  end

  def test_form_for_with_multy_input
    result = HexletCode.form_for @entity do |f|
      f.input :name
      f.input :job
    end

    expected = load_fixture('form_multiple_inputs.html')
    assert_equal expected, result
  end

  def test_form_for_with_custom_values
    result = HexletCode.form_for @entity, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected = load_fixture('form_custom_textarea.html')
    assert_equal expected, result
  end

  def test_form_with_user_no_object
    error = assert_raises(NoMethodError) do
      HexletCode.form_for @entity, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end

    assert_match "undefined method `age'", error.message
  end

  def test_form_with_submit
    result = HexletCode.form_for @entity, url: '#' do |f|
      f.input :job
      f.submit
    end

    expected = load_fixture('test_form_with_submit.html')
    assert_equal expected, result
  end

  def test_form_with_submit_custom_text
    result = HexletCode.form_for @entity, url: '#' do |f|
      f.input :job
      f.submit 'Test'
    end

    expected = load_fixture('test_form_with_submit_custom_text.html')
    assert_equal expected, result
  end

  def test_form_unsopported_as
    assert_raises(NameError) do
      HexletCode.form_for @entity, url: '/users' do |f|
        f.input :job, as: :unsopported
      end
    end
  end
end
