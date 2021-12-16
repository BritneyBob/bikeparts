import datetime

from application.controllers import customer_order_controller
from application.dataMDB import modelsMDB as mm
from application.data.db import session
from application.data.models import SparePart, Store, Customer, CustomerOrder, Company


def convert_companies():
    companies = session.query(Company).all()
    for company in companies:
        as_dict = company.__dict__

        if company.supplier and company.manufacturer:
            as_dict['company_type'] = ["Supplier", "Manufacturer"]
        elif company.supplier:
            as_dict['company_type'] = "Supplier"
        else:
            as_dict['company_type'] = "Manufacturer"

        as_dict['contact'] = {
            'last_name': company.contact,
            'phone_number': company.contact_phonenumber,
            'email': company.contact_email
        }

        addresses = []
        for address in company.addresses:
            addresses.append({
                "address_type": address.address_type.address_type_name.capitalize(),
                "street_address": address.address_line2,
                "zipcode": address.zipcode,
                "city": address.city_name,
                "country": address.country_name
            })
        if len(addresses) > 0:
            as_dict["addresses"] = addresses

        # for address in company.addresses:
        #     if address.address_type_id == 1:
        #         as_dict['delivery_address'] = {
        #             'address_line': address.address_line2,
        #             'zip_code': address.zipcode,
        #             'city': address.city_name,
        #             'country': address.country_name
        #         }
        #     if address.address_type_id == 2:
        #         as_dict['billing_address'] = {
        #             'address_line': address.address_line2,
        #             'zip_code': address.zipcode,
        #             'city': address.city_name,
        #             'country': address.country_name
        #         }
        #     if address.address_type_id == 3:
        #         as_dict['visiting_address'] = {
        #             'address_line': address.address_line2,
        #             'zip_code': address.zipcode,
        #             'city': address.city_name,
        #             'country': address.country_name
        #         }

        sell_products = []
        if company.supplier:
            products = company.supplier.spare_parts
            for product in products:
                sell_products.append({
                    'product_number': mm.Product.find(product_number=product.product_number).first_or_none()._id,
                    'buy_price': float(product.buy_price),
                    'delivery_time': product.delivery_time
                })
        if len(sell_products) > 0:
            as_dict["supplies_products"] = sell_products

        manufacturer_products = []
        if company.manufacturer:
            products = company.manufacturer.spare_parts

            for product in products:
                manufacturer_products.append({
                    'product_number': mm.Product.find(product_number=product.product_number).first_or_none()._id
                })
        if len(manufacturer_products) > 0:
            as_dict["manufactures_products"] = manufacturer_products

        del as_dict["_sa_instance_state"]
        del as_dict["manufacturer"]
        del as_dict["contact_email"]
        del as_dict["contact_phonenumber"]
        del as_dict["supplier"]
        mongo_company = mm.Company(as_dict)
        mongo_company.save()


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
                "new_store_id": mm.Store.find(store_id=store.store_id).first_or_none()._id
            })
        if len(stores) > 0:
            as_dict["available_in_stores"] = stores

        suppliers = []
        for supplier in product.suppliers:
            suppliers.append({
                "company_id": None,
                "supplier_id": supplier.supplier_id,
            })
        if len(suppliers) > 0:
            as_dict["suppliers"] = suppliers

        manufacturers = []
        for manufacturer in product.manufacturers:
            manufacturers.append({
                "company_id": None,
                "manufacturer_id": manufacturer.manufacturer_id
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
                "new_product_id": None,
                # "new_product_id": mm.Product.find(product_number=product.product_number).first_or_none()._id,
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
                "address_type": address.address_type.address_type_name,
                "street_address": address.address_line2,
                "zipcode": address.zipcode,
                "city": address.city_name,
                "country": address.country_name
            })
        if len(addresses) > 0:
            as_dict["addresses"] = addresses

        cars = []
        compatible_with_products = []
        for car in customer.car_models:
            for product in car.car_model.spare_parts:
                product_id = mm.Product.find(product_number=product.product_number).first_or_none()._id
                compatible_with_products.append(product_id)
            cars.append({
                "license_number": car.license_number,
                "manufacturer": car.car_model.manufacturer,
                "model": car.car_model.model,
                "year": car.car_model.year,
                "color": car.color,
                "compatible_with_products": compatible_with_products
            })
        if len(cars) > 0:
            as_dict["cars"] = cars

        orders = []
        customer_orders = customer_order_controller.get_customer_orders_by_customer_id(customer.customer_id)
        for order in customer_orders:
            orders.append({
                "customer_order_number": order.customer_order_number,
                "new_customer_order_number": None
            })
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
            "name": f"{order.employee.first_name} {order.employee.last_name}",
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


def fix_customers():
    for customer in mm.Customer.all():
        if hasattr(customer, 'orders'):
            for order in customer.orders:
                order["customer_order_id"] = \
                    mm.CustomerOrder.find(customer_order_number=order['customer_order_number']).first_or_none()._id
                del order["customer_order_number"]
                del order["new_customer_order_number"]
        customer.save()


def fix_stores():
    for store in mm.Store.all():
        store.store_number = store.store_id
        del store.store_id
        for product in store.products:
            product["product_id"] = mm.Product.find(product_number=product["product_number"]).first_or_none()._id
            del product["product_number"]
            del product["new_product_id"]
        store.save()


def fix_products():
    for product in mm.Product.all():
        if hasattr(product, "available_in_stores"):
            for store in product.available_in_stores:
                store["store_number"] = store["store_id"]
                store["store_id"] = store["new_store_id"]
                del store["new_store_id"]
        if hasattr(product, "suppliers"):
            for supplier in product.suppliers:
                supplier["company_id"] = mm.Company.find(company_id=supplier["supplier_id"]).first_or_none()._id
                del supplier["supplier_id"]
        if hasattr(product, "manufacturers"):
            for manufacturer in product.manufacturers:
                manufacturer["company_id"] = \
                    mm.Company.find(company_id=manufacturer["manufacturer_id"]).first_or_none()._id
                del manufacturer["manufacturer_id"]
        product.save()


def fix_customer_orders():
    for order in mm.CustomerOrder.all():
        # del order.customer_order_number
        order.store["store_number"] = order.store["store_id"]
        del order.store["store_id"]
        order.save()


def main():
    # pass
    convert_stores()
    convert_products()
    convert_companies()
    convert_customers()
    convert_orders()

    fix_customers()
    fix_stores()
    fix_products()
    fix_customer_orders()


if __name__ == "__main__":
    main()
