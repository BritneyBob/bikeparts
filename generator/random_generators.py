import datetime
import json
import random

from controllers.customer_controller import create_customer

first_names = [line.strip() for line in open("data_files/first_names.txt", "r", encoding="utf-8")]
last_names = [line.strip() for line in open("data_files/lastnames.txt", "r", encoding="utf-8")]
phone_numbers = [line.strip() for line in open("data_files/20k_swedish_phonenumbers.txt", "r", encoding="utf-8")]

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


def random_customer_name():
    # TODO: Fixa lista på typ adjektiv och substantiv, randomisera in None
    return None


def random_address():
    return random.choice(postcodes_list)


def random_phone_number():
    return random.choice(phone_numbers)


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

    customer_name = random_customer_name()

    phone_number = random_phone_number()

    email = generate_random_email(first_name, last_name)

    return {
        "first_name": first_name,
        "last_name": last_name,
        "customer_name": customer_name,
        "email": email,
        "phone_number": phone_number,
    }


def generate_random_address():
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

    address["Street Name"] += " " + street_no

    country = random.choice(["Sweden", "Denmark", "Norway", "Finland"])

    return {
        "street_address": address["Street Name"],
        "zip_code": address["Postcode"],
        "country": country,
    }


def main():
    for _ in range(100):
        customer = generate_random_customer()
        create_customer(customer)


if __name__ == "__main__":
    main()
