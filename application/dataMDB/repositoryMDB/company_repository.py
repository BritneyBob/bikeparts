import random

from application.dataMDB.modelsMDB import Company, SupplierOrder


def create_company(company):
    Company(company).save()


def get_all_companies():
    return Company.all()


def get_company_by_old_id(company_id):
    return Company.find(company_id=company_id).first_or_none()


def get_company_by_id(company_id):
    return Company.find(_id=company_id).first_or_none()


def get_companies_by_ids(company_ids):
    return [get_company_by_id(company_id) for company_id in company_ids]


def negotiation(prod_name_price, supplier_name):
    name_and_price = prod_name_price
    price_changes = [0.8, 0.9, 1.1, 1.2]
    # price_changes is float values but buy_price decimal values so price_changes has to be converted before operation
    new_change = round(random.choice(price_changes), 1)

    # TODO: Change supplier_id to something else, enums?
    new_buy_prices = [i["buy_price"] * new_change for i in name_and_price]
    for price in new_buy_prices:
        price = round(price, 1)  # Make round() work!
    supplier = Company.find(company_name=supplier_name).first_or_none()

    for i in range(len(prod_name_price)):
        supplier.supplies_products[i]["buy_price"] = new_buy_prices[i]
    supplier.save()
    return new_buy_prices


def update_company_name(company, new_company_name):
    company.company_name = new_company_name
    company.save()


# def update_company_supplies_products(company, supplied_product):
#     company.supplies_products.append(supplied_product)
#     company.save()
#

def update_company_address(company, new_address):
    for i, address in enumerate(company.addresses):
        if new_address["address_type"] == address["address_type"]:
            company.addresses[i] = new_address
            company.save()


def update_contact_phone_number(company, new_phone_number):
    company.contact["phone_number"] = new_phone_number
    company.save()


def update_contact_name(company, new_contact_first_name, new_contact_last_name):
    company.contact["last_name"] = new_contact_last_name
    email_hosts = ["gmail.com", "hotmail.com", "outlook.com", "live.se", "yahoo.com"]
    company.contact["email"] = f"{new_contact_first_name.lower()}.{new_contact_last_name.lower()}@" \
                               f"{random.choice(email_hosts)}"
    company.save()


def get_suppliers():
    companies = Company.all()
    suppliers = [company for company in companies if company.company_type != "Manufacturer"]
    return suppliers


def get_manufacturers():
    companies = Company.all()
    manufacturers = [company for company in companies if company.company_type != "Supplier"]
    return manufacturers


def create_order(supplier_order):
    SupplierOrder(supplier_order).save()
