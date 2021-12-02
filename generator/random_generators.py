import json
import random

from application.controllers.employee_controller import create_employee

first_names = [line.strip() for line in open("data_files/first_names.txt", "r", encoding="utf-8")]
last_names = [line.strip() for line in open("data_files/lastnames.txt", "r", encoding="utf-8")]
phone_numbers = [line.strip() for line in open("data_files/20k_swedish_phonenumbers.txt", "r", encoding="utf-8")]
adjectives = [line.strip().capitalize() for line in open("data_files/adjectives.txt", "r", encoding="utf-8")]
customer_second_parts = [line.strip() for line in open("data_files/company_customers.txt", "r", encoding="utf-8")]
company_second_parts = [line.strip() for line in open("data_files/companies_names.txt", "r", encoding="utf-8")]
swedish_cities = [line.strip() for line in open("data_files/swedish_cities.txt", "r", encoding="utf-8")]
danish_cities = [line.strip() for line in open("data_files/danish_cities.txt", "r", encoding="utf-8")]
norwegian_cities = [line.strip() for line in open("data_files/norwegian_cities.txt", "r", encoding="utf-8")]
finnish_cities = [line.strip() for line in open("data_files/finnish_cities.txt", "r", encoding="utf-8")]
car_manufacturers = [
  "Abarth",
  "Alfa Romeo",
  "Aston Martin",
  "Audi",
  "Bentley",
  "BMW",
  "Bugatti",
  "Cadillac",
  "Chevrolet",
  "Chrysler",
  "Citroën",
  "Dacia",
  "Daewoo",
  "Daihatsu",
  "Dodge",
  "Donkervoort",
  "DS",
  "Ferrari",
  "Fiat",
  "Fisker",
  "Ford",
  "Honda",
  "Hummer",
  "Hyundai",
  "Infiniti",
  "Iveco",
  "Jaguar",
  "Jeep",
  "Kia",
  "KTM",
  "Lada",
  "Lamborghini",
  "Lancia",
  "Land Rover",
  "Landwind",
  "Lexus",
  "Lotus",
  "Maserati",
  "Maybach",
  "Mazda",
  "McLaren",
  "Mercedes-Benz",
  "MG",
  "Mini",
  "Mitsubishi",
  "Morgan",
  "Nissan",
  "Opel",
  "Peugeot",
  "Porsche",
  "Renault",
  "Rolls-Royce",
  "Rover",
  "Saab",
  "Seat",
  "Skoda",
  "Smart",
  "SsangYong",
  "Subaru",
  "Suzuki",
  "Tesla",
  "Toyota",
  "Volkswagen",
  "Volvo"
]
car_models = [line.strip() for line in open("data_files/car_model_names.txt", "r", encoding="utf-8")]
product_types = ["Sticker", "Wunderbaum", "Sleeves", "Bumper", "Subwoofer", "Wheel cover", "Mug holder", "Front door",
                 "Back door", "Seat cover", "Head rest", "Sun cover"]
product_descriptions = ["Flames", "Moose", "Green", "Pink", "Yellow", "Brown", "Leopard", "Zebra", "Tiger"]

""
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


def random_company_second_part():
    return random.choice(company_second_parts)


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


def random_license_number():
    letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    numbers = "0123456789"

    return random.choice(letters) + random.choice(letters) + random.choice(letters) + random.choice(numbers) + \
           random.choice(numbers) + random.choice(numbers)


def generate_random_email(first_name, last_name):
    email_hosts = ["gmail.com", "hotmail.com", "outlook.com", "live.se", "yahoo.com"]
    return f"{first_name.lower()}.{last_name.lower()}@{random.choice(email_hosts)}"


def generate_random_customer():
    first_name = random_first_name()

    last_name = random_last_name()

    company_name = (random_adjective() + " " + random_customer_second_part())

    customer_name = random.choice([None, company_name])

    phone_number = random_phone_number()

    is_company = True
    if customer_name is None:
        is_company = False

    # email = generate_random_email(first_name, last_name)

    return {
        "customer_name": customer_name,
        "contact_last_name": last_name,
        "contact_first_name": first_name,
        "phonenumber": phone_number,
        "is_company": is_company
    }


def generate_random_store():
    address_id = random.choice(range(1,451))

    return {"address_id": address_id}


def generate_random_employee():
    store_id = random.choice(range(1, 51))
    first_name = random_first_name()

    last_name = random_last_name()

    email = generate_random_email(first_name, last_name)

    return {
        "store_id": store_id,
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
    }


def generate_random_company():
    first_name = random_first_name()

    last_name = random_last_name()

    company_name = (random_adjective() + " " + random_company_second_part())

    phone_number = random_phone_number()

    email = generate_random_email(first_name, last_name)

    return {
        "company_name": company_name,
        "contact": last_name,
        "contact_phonenumber": phone_number,
        "contact_email": email
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
    _, postcode = random_street_address_postcode()
    address_line1 = None
    address_line2 = random_street_address_postcode()[0]

    address_type_id = random.choice([1, 2, 3])

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
        "address_type_id": address_type_id,
        "address_line1": address_line1,
        "address_line2": address_line2,
        "zipcode": postcode,
        "city_name": city,
        "country_name": country
    }


def generate_random_car_model():
    manufacturer = random.choice(car_manufacturers)
    model = random.choice(car_models)
    year = str(random.choice(range(1970, 2022)))

    return {
        "manufacturer": manufacturer,
        "model": model,
        "year": year
    }


def generate_random_car():
    license_number = random_license_number()
    customer_id = random.choice(range(1, 201))
    car_model_id = random.choice(range(1, 211))
    color = random.choice(["Blue", "Red", "Green", "Yellow", "Black", "White", "Gold", "Silver", "Orange", "Purple"])
    return {
        "license_number": license_number,
        "customer_id": customer_id,
        "car_model_id": car_model_id,
        "color": color
    }


def main():
    # for _ in range(100):
    #   customer = generate_random_customer()
    #   customers.append(customer)
    #   company = (generate_random_company())
    #   create_company(company)
    #
    #for _ in range(450):
    #    address = generate_random_address()
    #    create_address(address)
    #
    # for _ in range(10):
    #     car_model = generate_random_car_model()
    #     create_car_model(car_model)

    # for _ in range(300):
    #     car = generate_random_car()
    #     create_customer_car(car)

    #for i in range(1, 40):
    #    manufacturer = {"company_id": i}
    #    create_manufacturer(manufacturer)

    #for i in range(20, 101):
    #    supplier = {"company_id": i}
    #    create_supplier(supplier)

    #for _ in range(200):
    #    employee = generate_random_employee()
    #    create_employee(employee)



    #for _ in range(50):
    #    store = generate_random_store()
    #    create_store(store)


if __name__ == "__main__":
    main()
