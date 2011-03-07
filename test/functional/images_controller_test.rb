require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image" do
    assert_difference('Image.count') do
      attr = @image.attributes
      attr.delete('id')
      fa = Tempfile.new('somerandomname')
      path = Rails.root.join('test', 'fixtures', "test.jpg")
      File.open(path) do |file|
        fa.write(file.read)
      end
      attr['file'] = fa # fixture_file_upload('test.jpg', 'image/jpeg')
      post :create, :image => attr
      thePath = Rails.root.join('public', 'images', 
                                assigns(:image).id.to_s + "_original.jpg")
      assert(File.file?(thePath))
      assert(File.size?(thePath))
      File.delete(thePath)

      thumbnailPath = thePath.sub(/original/, "thumbnail")
      assert(File.file?(thumbnailPath))
      File.delete(thumbnailPath)
    end
    assert_redirected_to image_path(assigns(:image))
  end

  # TODO: define behavior for attempted empty files uploaded.

  test "should show image" do
    get :show, :id => @image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @image.to_param
    assert_response :success
  end

  test "should update image" do
    put :update, :id => @image.to_param, :image => @image.attributes
    assert_redirected_to image_path(assigns(:image))
  end

  test "should destroy image" do
    assert_difference('Image.count', -1) do
      delete :destroy, :id => @image.to_param
    end

    assert_redirected_to images_path
  end
end
