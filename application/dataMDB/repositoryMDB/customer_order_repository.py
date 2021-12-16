from application.dataMDB.modelsMDB import CustomerOrder


def create_customer_order(customer_order):
    CustomerOrder(customer_order).save()


def get_customer_orders():
    return CustomerOrder.all()


def get_customer_orders_by_old_customer_id(customer_id):
    return CustomerOrder.find(customer_id=customer_id).first_or_none()


def get_customer_orders_by_customer_id(customer_id):
    return CustomerOrder.find(_id=customer_id).first_or_none()


def get_customer_orders_by_order_number(order_number):
    return CustomerOrder.find(customer_order_number=order_number).first_or_none()


def add_order_details(customer_order, order_details):
    customer_order.order_details(order_details)


def add_shipped_date(order, shipped_date):
    order.shipped_date = shipped_date
    order.save()


def update_status(order, new_status):
    order.status = new_status
    order.save()


def update_comments(order, comments):
    order.comments = comments
    order.save()


# def get_order_details_by_order_number(order_number):
#     return session.query(OrderDetail).filter(OrderDetail.customer_order_number == order_number).all()
