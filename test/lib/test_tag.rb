# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_single_tag
    result = HexletCode::Tag.build('br')
    assert_equal '<br>', result

    result = HexletCode::Tag.build('hr')
    assert_equal '<hr>', result
  end

  def test_closed_tag
    result = HexletCode::Tag.build('span')
    assert_equal '<span></span>', result

    result = HexletCode::Tag.build('p')
    assert_equal '<p></p>', result
  end

  def test_tag_with_text
    result = HexletCode::Tag.build('span') { 'Hello!' }
    assert_equal '<span>Hello!</span>', result

    result = HexletCode::Tag.build('p') { 'world!' }
    assert_equal '<p>world!</p>', result
  end

  def test_single_tag_with_body_should_raise
    assert_raises(ArgumentError) { HexletCode::Tag.build('br') { 'Oops!' } }
    assert_raises(ArgumentError) { HexletCode::Tag.build('img') { 'Image text' } }
  end

  def test_tag_with_attrs
    result = HexletCode::Tag.build('input', type: 'password')
    assert_equal '<input type="password">', result
  end

  def test_tag_with_multiple_attrs
    result = HexletCode::Tag.build('input', type: 'text', name: 'email', disabled: 'true')
    assert_equal '<input type="text" name="email" disabled="true">', result
  end

  def test_with_empty_tag
    assert_raises(ArgumentError) { HexletCode::Tag.build('') }
  end

  def test_closed_tag_with_attrs_and_text
    result = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal '<label for="email">Email</label>', result
  end
end
