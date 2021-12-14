import datetime

from application.controllers import customer_order_controller
from application.data.dataMDB import modelsMDB as mm
from application.data.db import session
from application.data.models import SparePart, Store, Customer, CustomerOrder


def convert_products():
    products = session.query(SparePart).all()
    for product in products:
        as_dict = product.__dict__

        cars = []
        for car_model in product.car_models:
            cars.append({
                "model": car_model.model,
                "manufacturer": car_model.manufacturer,
                "year": car_model.year
            })
        if len(cars) > 0:
            as_dict["compatible_with_cars"] = cars

        stores = []
        for store in product.stores:
            stores.append({
                "store_id": store.store_id,
                "city": store.store.address.city_name
            })
        if len(stores) > 0:
            as_dict["available_in_stores"] = stores

        suppliers = []
        for supplier in product.suppliers:
            suppliers.append({
                "supplier_id": supplier.supplier_id,
                "supplier_name": supplier.supplier.company.company_name,
                "buy_price": float(supplier.buy_price)
            })
        if len(suppliers) > 0:
            as_dict["suppliers"] = suppliers

        manufacturers = []
        for manufacturer in product.manufacturers:
            manufacturers.append({
                "manufacturer_id": manufacturer.manufacturer_id,
                "manufacturer_name": manufacturer.company.company_name
            })
        if len(manufacturers) > 0:
            as_dict["manufacturers"] = manufacturers

        del as_dict["_sa_instance_state"]
        del as_dict["car_models"]
        del as_dict["stores"]

        mongo_product = mm.Product(as_dict)
        mongo_product.save()


def convert_stores():
    stores = session.query(Store).all()
    for store in stores:
        as_dict = store.__dict__
        as_dict["street_address"] = store.address.address_line2
        as_dict["zipcode"] = store.address.zipcode
        as_dict["city"] = store.address.city_name
        as_dict["country"] = store.address.country_name

        employees = []
        for employee in store.employees:
            employees.append({
                "name": f"{employee.first_name} {employee.last_name}",
                "email": employee.email
            })
        as_dict["employees"] = employees

        products = []
        for product in store.spare_parts:
            products.append({
                "product_number": product.product_number,
                "new_product_id": mm.Product.find(product_number=product.product_number).first_or_none(),
                "shelf_number": product.shelf_number,
                "quantity_in_stock": product.quantity_in_stock
            })
        if len(products) > 0:
            as_dict["products"] = products

        del as_dict["_sa_instance_state"]
        del as_dict["address"]
        del as_dict["address_id"]
        del as_dict["spare_parts"]
        mongo_office = mm.Store(as_dict)
        mongo_office.save()


# def convert_employees():
#     employees = session.query(Employee).all()
#     for employee in employees:
#         as_dict = employee.__dict__
#         as_dict["office_id"] = mm.Office.find(officeCode=employee.officeCode).first_or_none()._id
#         del as_dict["officeCode"]
#         del as_dict["_sa_instance_state"]
#         if as_dict["reportsTo"] is None:
#             del as_dict["reportsTo"]
#         mongo_employee = mm.Employee(as_dict)
#         mongo_employee.save()
#
#     employees = mm.Employee.all()
#     for employee in employees:
#         if hasattr(employee, "reportsTo"):
#             employee.reportsTo = mm.Employee.find(employeeNumber=employee.reportsTo).first_or_none()._id
#             employee.save()


def convert_customers():
    customers = session.query(Customer).all()
    for customer in customers:
        as_dict = customer.__dict__
        as_dict = {key: value for key, value in as_dict.items() if value is not None}
        if as_dict["is_company"]:
            as_dict["customer_type"] = "company"
        else:
            as_dict["customer_type"] = "private"
        del as_dict["is_company"]
        del as_dict["_sa_instance_state"]

        addresses = []
        for address in customer.addresses:
            addresses.append({
                "address_id": address.address_id,
                "address_type": address.address_type.address_type_name,
                "street_address": address.address_line2,
                "zipcode": address.zipcode,
                "city_name": address.city_name,
                "country_name": address.country_name
            })
        if len(addresses) > 0:
            as_dict["addresses"] = addresses

        cars = []
        for car in customer.car_models:
            cars.append({
                "license_number": car.license_number,
                "manufacturer": car.car_model.manufacturer,
                "model": car.car_model.model,
                "year": car.car_model.year,
                "color": car.color
            })
        if len(cars) > 0:
            as_dict["cars"] = cars

        orders = []
        customer_orders = customer_order_controller.get_customer_orders_by_customer_id(customer.customer_id)
        for order in customer_orders:
            orders.append(order.customer_order_number)
        if len(orders) > 0:
            as_dict["orders"] = orders

        mongo_customer = mm.Customer(as_dict)
        mongo_customer.save()


def convert_orders():
    orders = session.query(CustomerOrder).all()
    for order in orders:
        as_dict = order.__dict__
        as_dict["order_date"] = datetime.datetime(order.order_date.year, order.order_date.month, order.order_date.day)
        if order.shipped_date is not None:
            as_dict["shipped_date"] = datetime.datetime(order.shipped_date.year, order.shipped_date.month,
                                                        order.shipped_date.day)
        else:
            del as_dict["shipped_date"]
        as_dict["customer_id"] = mm.Customer.find(customer_id=order.customer_id).first_or_none()._id
        if order.comments is None:
            del as_dict["comments"]

        store = {
            "store_id": order.store_id,
            "city": order.store.address.city_name,
            "country": order.store.address.country_name
        }
        as_dict["store"] = store

        sales_contact = {
            "employee_id": order.employee_id,
            "first_name": order.employee.first_name,
            "last_name": order.employee.last_name,
            "email": order.employee.email
        }
        as_dict["sales_contact"] = sales_contact

        order_lines = []
        order_details = customer_order_controller.get_order_details_by_order_number(order.customer_order_number)
        for order_detail in order_details:
            order_lines.append({
                "product_id": mm.Product.find(product_number=order_detail.product_number).first_or_none()._id,
                "product_name": order_detail.spare_part.name,
                "quantity_ordered": order_detail.quantity_ordered,
                "price_each": float(order_detail.price_each)
            })
        if len(order_lines) > 0:
            as_dict["order_details"] = order_lines

        del as_dict["_sa_instance_state"]
        del as_dict["employee"]
        del as_dict["employee_id"]
        del as_dict["store_id"]

        mongo_order = mm.CustomerOrder(as_dict)
        mongo_order.save()


# def fix_orders():
#     for order in mm.Order.all():
#         order.delete_field('customerNumber')


def main():
    # convert_products()
    convert_stores()
    # convert_employees()
    # convert_customers()
    # convert_orders()
    # fix_orders()


if __name__ == "__main__":
    main()
