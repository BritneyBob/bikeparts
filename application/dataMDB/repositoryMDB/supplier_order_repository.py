from application.controllers import store_controller
from application.dataMDB.modelsMDB import SupplierOrder
from datetime import datetime, date, timedelta


def create_auto_order(store_id, product_number, supplier_id):
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
    # move row below to where the function create_auto_order is called?
    store_controller.update_stock_in_store(store_id, product_number, ordered_quantity)


def create_order(supplier_order):
    SupplierOrder(supplier_order).save()
