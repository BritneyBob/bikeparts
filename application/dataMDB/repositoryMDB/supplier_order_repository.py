


def low_index(store_id, product_number):
    return session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id).\
        filter(SparePartInStore.product_number == product_number).all()


def lowest_buy_price(product_number):
    return session.query(SparePartSupplier).filter(SparePartSupplier.product_number == product_number).all()


def create_auto_order(store_id, product_number, company_id):
    sphs_object = session.query(SparePartSupplier).filter(SparePartSupplier.supplier_id == supplier_id).\
        filter(SparePartSupplier.product_number == product_number).first()
    delivery_time = sphs_object.delivery_time
    arrival_date = date.today() + timedelta(days=delivery_time)
    price_each = sphs_object.buy_price
    spis_object = session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id).\
        filter(SparePartInStore.product_number == product_number).first()
    ordered_quantity = spis_object.quantity_to_order

    new_auto_order = AutoOrder(product_number=product_number, store_id=store_id, supplier_id=supplier_id,
                               arrival_date=arrival_date, ordered_quantity=ordered_quantity, price_each=price_each)
    session.add(new_auto_order)
    session.commit()
    store_controller.update_stock_in_store(store_id, product_number, ordered_quantity)


def get_auto_orders():
    auto_orders = session.query(AutoOrder).all()


def delete_auto_order():
    delete_q = AutoOrder.__table__.delete().where(AutoOrder.order_id > 0)
    db.session.execute(delete_q)
    db.session.commit()