require "test_helper"

class AnnotationTest < Minitest::Test

  def test_annotation_list
    annotations = Buildkite::Annotation.list(pipeline: "starter-buildkite-pipeline", build: 8)

    assert_equal Buildkite::Collection, annotations.class
    assert_equal Buildkite::Annotation, annotations.data.first.class
    assert_equal "success", annotations.data.first.style
  end

end
