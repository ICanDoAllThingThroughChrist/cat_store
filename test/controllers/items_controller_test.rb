require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "can't delete item in box" do 
    assert_difference( 'Item.count', 0) do
    delete item_url (items(:two)) end
      assert_redirected_to items_url
    end
    
end
