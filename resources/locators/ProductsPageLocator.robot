*** Variables ***
${textHeaderProducts}=                   //XCUIElementTypeStaticText[@name="Marketplace"]
${screenProducts}=                       marketplace_screen
${productItems}=                         items_grid
${product_cards}=                        //XCUIElementTypeOther[@name="items_grid"]/XCUIElementTypeStaticText

# Product Item Detials
${product_image}=                        item_index_image_placeholder
${product_name}=                         item_index_name
${product_category}=                     item_index_category
${product_price}=                        item_index_price
${product_desc}=                         item_index_desc
${product_card}=                         item_index_image_placeholder-item_index_details-item_index_desc

# Product details
${detail_name}=                          detail_name
${detail_category}=                      detail_category
${detail_price}=                         detail_price
${detail_desc_label}=                    detail_desc_label
${detail_desc}=                          detail_desc
${detail_reviews_title}=                 detail_reviews_title
${product_detial_review}=                //XCUIElementTypeStaticText[@name="detail_reviews-detail_reviews-detail_reviews"]//XCUIElementTypeStaticText[@name="detail_reviews"]
