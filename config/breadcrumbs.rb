crumb :root do
  link "トップ", root_path
end

 crumb :items do |item|
   link "商品詳細", item_path(item)
   parent :root
 end

crumb :orders do |item|
  link "購入内容の確認", item_orders_path
  parent :items, item
end

#crumb :items do |item|
  #link "商品の編集", edit_item_path
  #parent :items, item
#end
