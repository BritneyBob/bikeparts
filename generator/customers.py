import datetime

from application.controllers.customer_controller import create_customer


def main():
    customer = {
        "first_name": "Pelle",
        "last_name": "Svensson",
        "birthday": datetime.date(1975, 3, 19),
        "have_children": True,
        "street_address": "Smågatan 64",
        "zip_code": "543 21",
        "country": "Sweden",
        "email": "pelle@hotmail.com",
        "phone_number": "0736-654321",
    }

    create_customer(customer)


if __name__ == '__main__':
    main()
