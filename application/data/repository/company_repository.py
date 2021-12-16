import decimal
import random

from application.data.db import session
from application.data.models import Company, companies_has_addresses_table, SparePartSupplier, Supplier, Manufacturer


def create_company(company):
    company = Company(**company)
    session.add(company)
    session.commit()


def create_company_address(company, address):
    statement = companies_has_addresses_table.insert().values(company_id=company, address_id=address)
    session.execute(statement)
    session.commit()


def create_supplier(supplier):
    supplier = Supplier(**supplier)
    session.add(supplier)
    session.commit()


def get_suppliers():
    suppliers = session.query(Supplier).all()
    return suppliers


def create_manufacturer(manufacturer):
    manufacturer = Manufacturer(**manufacturer)
    session.add(manufacturer)
    session.commit()


def get_manufacturers():
    manufacturer = session.query(Manufacturer).all()
    return manufacturer


def negotiation(id_and_buy_price, comp_and_supp_id):
    id_and_buy_price = id_and_buy_price
    price_changes = [0.8, 0.9, 1.1, 1.2]
    # price_changes is float values but buy_price decimal values so price_changes has to be converted before operation
    new_change = round(decimal.Decimal(random.choice(price_changes)), 1)

    new_buy_prices = [i['buy_price: '] * new_change for i in id_and_buy_price]
    supplier_products = session.query(SparePartSupplier).filter(SparePartSupplier.supplier_id ==
                                                                comp_and_supp_id['supplier_id']).all()
    for i in range(len(id_and_buy_price)):
        supplier_products[i].buy_price = new_buy_prices[i]
    session.commit()
    return new_buy_prices


def get_all_companies():
    return session.query(Company).all()


def update_company_address(company_id, new_address_id, old_address_id):
    sql = f"UPDATE companies_has_addresses SET address_id = {new_address_id} WHERE  company_id={company_id} and " \
          f"address_id = {old_address_id};"
    session.execute(sql)
    session.commit()


def update_company_name(company, new_company_name):
    company.company_name = new_company_name
    session.commit()


def update_contact_phone_number(company, new_phone_number):
    company.contact_phonenumber = new_phone_number
    session.commit()


def get_company_by_id(company_id):
    return session.query(Company).filter(Company.company_id == company_id).first()


def update_contact_name(company, new_contact_first_name, new_contact_last_name):
    company.contact = new_contact_last_name
    email_hosts = ["gmail.com", "hotmail.com", "outlook.com", "live.se", "yahoo.com"]
    company.contact_email = f"{new_contact_first_name.lower()}.{new_contact_last_name.lower()}@" \
                            f"{random.choice(email_hosts)}"
    session.commit()
