from application.controllers.auto_order_controller import low_index, lowest_buy_price


def evaluate_auto_order(store_id, product_number):
    inquiry_low_index = low_index(store_id, product_number)
    for inquiry in inquiry_low_index:
        if inquiry.quantity_in_stock < inquiry.lowest_index:
            print(f'Product no {product_number} in store {store_id} are low in stock. Sending auto order.')
            send_auto_order(store_id, product_number)


def send_auto_order(store_id, product_number):
    check_lowest_buy_price = lowest_buy_price(product_number)
    price_id_delivery = {'buy_price': 10000, 'id': 0, 'delivery_time': 1000}
    for supplier in check_lowest_buy_price:
        if price_id_delivery['buy_price'] > supplier.buy_price:
            price_id_delivery['buy_price'] = supplier.buy_price
            price_id_delivery['id'] = supplier.supplier_id
            price_id_delivery['delivery_time'] = supplier.delivery_time
        elif supplier.buy_price == price_id_delivery['buy_price']:
            if price_id_delivery['delivery_time'] > supplier.delivery_time:
                price_id_delivery['buy_price'] = supplier.buy_price
                price_id_delivery['id'] = supplier.supplier_id
                price_id_delivery['delivery_time'] = supplier.delivery_time
    print()


