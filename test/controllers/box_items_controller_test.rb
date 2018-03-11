test "should create box_item" do 
    assert_difference('BoxItem.count') do
    post box_items_url, params: { item_id: items(:ruby).id } 
    end
        follow_redirect!
    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'li', "1 \u00D7 Programming Ruby 1.9"
end