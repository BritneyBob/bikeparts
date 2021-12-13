import datetime

from application.data.dataMDB import modelsMDB as mm
from application.data.db import session
from application.data.models import SparePart, Store


def convert_products():
    products = session.query(SparePart).all()
    for product in products:
        as_dict = product.__dict__
        del as_dict['_sa_instance_state']
        # stores = []
        # for store in product.stores:
        #     stores.append({
        #         "store_id": store.store_id,
        #         # "shelf_number": store.shelf_number,
        #         # "quantity_in_stock": store.quantity_in_stock
        #     })

        print()
        mongo_product = mm.Product(as_dict)
        mongo_product.save()


# def convert_stores():
#     stores = session.query(Store).all()
#     for store in stores:
#         as_dict = store.__dict__
#         del as_dict['_sa_instance_state']
#         employees = []
#         for employee in store.employees:
#             employees.append({
#                 'first_name': employee.first_name,
#                 'last_name': employee.last_name,
#                 'email': employee.email,
#             })
#         print()
#         mongo_office = mm.Store(as_dict)
#         mongo_office.save()
#
# def convert_employees():
#     employees = session.query(Employee).all()
#     for employee in employees:
#         as_dict = employee.__dict__
#         as_dict['office_id'] = mm.Office.find(officeCode=employee.officeCode).first_or_none()._id
#         del as_dict['officeCode']
#         del as_dict['_sa_instance_state']
#         if as_dict['reportsTo'] is None:
#             del as_dict['reportsTo']
#         mongo_employee = mm.Employee(as_dict)
#         mongo_employee.save()
#
#     employees = mm.Employee.all()
#     for employee in employees:
#         if hasattr(employee, 'reportsTo'):
#             employee.reportsTo = mm.Employee.find(employeeNumber=employee.reportsTo).first_or_none()._id
#             employee.save()
#
#
# def convert_customers():
#     customers = session.query(Customer).all()
#     for customer in customers:
#         as_dict = customer.__dict__
#         as_dict = {key: value for key, value in as_dict.items() if value is not None}
#         if 'salesRepEmployeeNumber' in as_dict:
#             as_dict['salesRepEmployeeNumber'] = mm.Employee.find(employeeNumber=customer.salesRepEmployeeNumber).first_or_none()._id
#         as_dict['creditLimit'] = float(as_dict['creditLimit'])
#         del as_dict['_sa_instance_state']
#
#         payments = []
#         for payment in customer.payments:
#             payments.append({
#                 'amount': float(payment.amount),
#                 'checkNumber': payment.checkNumber,
#                 'paymentDate': datetime.datetime(payment.paymentDate.year, payment.paymentDate.month, payment.paymentDate.day)
#             })
#         if len(payments) > 0:
#             as_dict['payments'] = payments
#         mongo_customer = mm.Customer(as_dict)
#         mongo_customer.save()
#
#
# def convert_orders():
#     orders = session.query(Order).all()
#     for order in orders:
#         as_dict = order.__dict__
#         as_dict['orderDate'] = datetime.datetime(order.orderDate.year, order.orderDate.month, order.orderDate.day)
#         as_dict['requiredDate'] = datetime.datetime(order.requiredDate.year, order.requiredDate.month, order.requiredDate.day)
#         if order.shippedDate is not None:
#             as_dict['shippedDate'] = datetime.datetime(order.shippedDate.year, order.shippedDate.month, order.shippedDate.day)
#         else:
#             del as_dict['shippedDate']
#         as_dict['customerId'] = mm.Customer.find(customerNumber=order.customerNumber).first_or_none()._id
#         if order.comments is None:
#             del as_dict['comments']
#         order_lines = []
#         for order_detail in order.orderdetail:
#             order_detail_dict = order_detail.__dict__
#
#             order_lines.append({
#                 'productId': mm.Product.find(productCode=order_detail.productCode).first_or_none()._id,
#                 'orderLineNumber': order_detail.orderLineNumber,
#                 'quantityOrdered': order_detail.quantityOrdered,
#                 'priceEach': float(order_detail.priceEach)
#             })
#         as_dict['orderLines'] = order_lines
#
#         del as_dict['orderdetail']
#         del as_dict['_sa_instance_state']
#
#         mongo_order = mm.Order(as_dict)
#         mongo_order.save()
#
# def fix_orders():
#     for order in mm.Order.all():
#         order.delete_field('customerNumber')
#
#
def main():
    convert_products()
    # convert_stores()
    #convert_employees()
    #convert_customers()
    #convert_orders()
    # fix_orders()


if __name__ == '__main__':
    main()
