crumb :root do
  link "トップ", root_path
end

 crumb :show_item do |item|
   link "商品詳細", item_path(item)
   parent :root
 end

crumb :orders do |item|
  link "購入内容の確認", item_orders_path
  parent :show_item, item
end

crumb :edit_item do |item|
  link "商品編集", edit_item_path(item)
  parent :show_item, item
end
