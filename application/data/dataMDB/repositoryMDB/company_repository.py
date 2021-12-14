import decimal
import random

from application.data.dataMDB.modelsMDB import Company


def create_company(company):
    Company(company).save()


def create_company_address(company, new_address):
    for address in company.addresses:
        if new_address["address_type"] == address["address_type"]:
            address = new_address
            company.save()


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
    print()
    return new_buy_prices


def get_all_companies():
    return Company.all()


def update_company_name(company, new_company_name):
    company.company_name = new_company_name
    company.save()


def update_contact_phone_number(company, new_phone_number):
    company.contact_phonenumber = new_phone_number
    company.save()


def get_company_by_id(company_id):
    return Company.find(_id=company_id).first_or_none()


def update_contact_name(company, new_contact_first_name, new_contact_last_name):
    company.contact_name = new_contact_last_name
    email_hosts = ["gmail.com", "hotmail.com", "outlook.com", "live.se", "yahoo.com"]
    company.contact_email = f"{new_contact_first_name.lower()}.{new_contact_last_name.lower()}@" \
                            f"{random.choice(email_hosts)}"
    company.save()
