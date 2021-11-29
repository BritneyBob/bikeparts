import datetime
import json
import random

# from application.controllers.customer_controller import create_customer

first_names = [line.strip() for line in open("data_files/first_names.txt", "r", encoding="utf-8")]
last_names = [line.strip() for line in open("data_files/lastnames.txt", "r", encoding="utf-8")]
phone_numbers = [line.strip() for line in open("data_files/20k_swedish_phonenumbers.txt", "r", encoding="utf-8")]
adjectives = [line.strip() for line in open("data_files/adjectives.txt", "r", encoding="utf-8")]
customer_second_parts = [line.strip() for line in open("data_files/company_customers.txt", "r", encoding="utf-8")]
supplier_second_parts = [line.strip() for line in open("data_files/suppliers_names.txt", "r", encoding="utf-8")]
swedish_cities = [line.strip() for line in open("data_files/swedish_cities.txt", "r", encoding="utf-8")]
danish_cities = [line.strip() for line in open("data_files/danish_cities.txt", "r", encoding="utf-8")]
norwegian_cities = [line.strip() for line in open("data_files/norwegian_cities.txt", "r", encoding="utf-8")]
finnish_cities = [line.strip() for line in open("data_files/finnish_cities.txt", "r", encoding="utf-8")]


with open("data_files/postcodes.json", "r", encoding="utf-8") as postcode_file:
    postcodes = json.load(postcode_file)
    postcodes_list = []
    for postcode_list in postcodes.values():
        for postcode_dict in postcode_list:
            postcodes_list.append(postcode_dict)


def random_first_name():
    return random.choice(first_names)


def random_last_name():
    return random.choice(last_names)


def random_adjective():
    return random.choice(adjectives)


def random_customer_second_part():
    return random.choice(customer_second_parts)


def random_supplier_second_part():
    return random.choice(supplier_second_parts)


def random_address():
    return random.choice(postcodes_list)


def random_phone_number():
    return random.choice(phone_numbers)


def random_swedish_cities():
    return random.choice(swedish_cities)


def random_danish_cities():
    return random.choice(danish_cities)


def random_norwegian_cities():
    return random.choice(norwegian_cities)


def random_finnish_cities():
    return random.choice(finnish_cities)


def random_model_year(start_date, end_date):
    """
    Generates a random date between start_date and end_date
    :param start_date: str in format YYYY-mm-dd
    :param end_date: str in format YYYY-mm-dd
    :return: datetime.date()
    """
    # Checking the data
    if len(start_date.split("-")) != 3 and len(end_date.split("-")) != 3:
        raise ValueError("Dates must be a str given in the format YYYY-mm-dd")

    start_year, start_month, start_day = start_date.split("-")
    end_year, end_month, end_day = end_date.split("-")
    for d in (start_year, start_month, start_day, end_year, end_month, end_day):
        if not d.isdigit():
            raise ValueError("Dates must be a str given in the format YYYY-mm-dd")

    start_date = datetime.date(int(start_year), int(start_month), int(start_day))
    end_date = datetime.date(int(end_year), int(end_month), int(end_day))

    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    return start_date + datetime.timedelta(days=random_number_of_days)


def generate_random_email(first_name, last_name):
    email_hosts = ["gmail.com", "hotmail.com", "outlook.com", "live.se", "yahoo.com"]
    return f"{first_name.lower()}.{last_name.lower()}@{random.choice(email_hosts)}"


def generate_random_customer():
    first_name = random_first_name()

    last_name = random_last_name()

    company_name = (random_adjective() + " " + random_customer_second_part()).capitalize()

    customer_name = random.choice([None, company_name])

    phone_number = random_phone_number()

    email = generate_random_email(first_name, last_name)

    return {
        "first_name": first_name,
        "last_name": last_name,
        "customer_name": customer_name,
        "email": email,
        "phone_number": phone_number,
    }


def generate_random_supplier():
    first_name = random_first_name()

    last_name = random_last_name()

    company_name = (random_adjective() + " " + random_supplier_second_part()).capitalize()

    phone_number = random_phone_number()

    email = generate_random_email(first_name, last_name)

    return {
        "company_name": company_name,
        "contact_last_name": last_name,
        "contact_phone_number": phone_number,
        "contact_email": email,
    }


def random_street_address_postcode():
    address = random_address()
    if "Street/Box No." not in address:
        street_no = ""
    else:
        street_no = address["Street/Box No."]
        if len(street_no) != 0:
            if len(street_no.split(" - ")) != 2:
                street_no = "1"
            else:
                start_no, end_no = street_no.split(" - ")
                street_no = str(random.choice(list(range(int(start_no), int(end_no) + 1))))

    return address["Street Name"] + " " + street_no, address["Postcode"]


def generate_random_address():
    address_line1, postcode = random_street_address_postcode()
    address_line2 = random.choice([None, random_street_address_postcode()[0]])

    country = random.choice(["Sweden", "Sweden", "Sweden", "Denmark", "Norway", "Finland"])
    city = ""

    match country:
        case "Sweden":
            city = random_swedish_cities()
        case "Denmark":
            city = random_danish_cities()
        case "Norway":
            city = random_norwegian_cities()
        case "Finland":
            city = random_finnish_cities()

    return {
        "address_line1": address_line1,
        "address_line2": address_line2,
        "zip_code": postcode,
        "city": city,
        "country": country,
    }


def main():
    customers = []
    suppliers = []
    addresses = []
    for _ in range(100):
        customers.append(generate_random_customer())
        suppliers.append(generate_random_supplier())
        # create_customer(customer)

    for _ in range(200):
        addresses.append(generate_random_address())

    for customer in customers:
        print(customer)
    for supplier in suppliers:
        print(supplier)
    for address in addresses:
        print(address)


if __name__ == "__main__":
    main()
