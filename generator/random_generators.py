import json
import random
import numpy as np
from decimal import Decimal

# from mysqlx import Error
# from sqlalchemy.exc import IntegrityError
#
# from application.controllers.spare_part_controller import create_spare_part_manufacturer

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
customer_adresse_ids = [
3,
5,
6,
7,
8,
11,
12,
16,
18,
19,
21,
22,
23,
27,
28,
32,
33,
34,
35,
36,
37,
39,
41,
42,
43,
44,
45,
46,
47,
48,
49,
50,
51,
52,
53,
54,
55,
56,
57,
58,
59,
60,
61,
62,
63,
65,
67,
69,
74,
75,
76,
78,
80,
83,
85,
87,
89,
90,
91,
92,
93,
94,
95,
97,
98,
99,
100,
102,
106,
107,
108,
109,
110,
111,
112,
113,
114,
115,
116,
117,
118,
119,
121,
123,
124,
126,
127,
128,
129,
130,
132,
134,
135,
137,
138,
141,
142,
145,
146,
147,
148,
149,
152,
153,
157,
158,
160,
161,
162,
164,
167,
170,
171,
172,
173,
174,
175,
179,
180,
181,
182,
183,
184,
185,
186,
187,
188,
189,
190,
191,
192,
193,
195,
196,
197,
198,
199,
200,
203,
204,
205,
207,
208,
212,
213,
215,
216,
217,
218,
219,
220,
221,
222,
223,
224,
226,
227,
229,
231,
233,
234,
237,
238,
241,
242,
243,
244,
245,
246,
247,
248,
255,
256,
257,
258,
261,
264,
265,
266,
267,
268,
270,
272,
273,
275,
276,
277,
278,
281,
282,
283,
285,
290,
292,
293,
294,
295,
296,
297,
298,
300,
302,
303,
304,
305,
306,
307,
309,
310,
312,
313,
314,
315,
316,
318,
319,
320,
321,
322,
324,
326,
327,
328,
330,
331,
333,
334,
335,
336,
337,
339,
340,
343,
344,
346,
347,
348,
349,
350,
352,
353,
354,
355,
356,
357,
358,
360,
361,
362,
365,
366,
367,
371,
373,
374,
375,
376,
377,
379,
380,
382,
383,
384,
385,
386,
387,
388,
390,
393,
394,
396,
398,
402,
403,
404,
405,
406,
408,
411,
413,
414,
415,
416,
419,
420,
421,
422,
423,
425,
426,
427,
428,
432,
433,
435,
436,
437,
438,
439,
441,
442,
445,
446,
447,
448,
450,
]

def generate_random_product():
    name = f"{random.choice(product_types)}, {random.choice(product_descriptions)}"
    description = random.choice(adjectives)
    if "Sticker" in name:
        sell_price = 20
    elif "Wunderbaum" in name:
        sell_price = 2
    elif "Sleeves" in name:
        sell_price = 15
    elif "Bumper" in name:
        sell_price = 80
    elif "Subwoofer" in name:
        sell_price = 250
    elif "Wheel cover" in name:
        sell_price = 50
    elif "Mug holder" in name:
        sell_price = 10
    elif "Seat cover" in name:
        sell_price = 200
    elif "Head rest" in name:
        sell_price = 75
    elif "Sun cover" in name:
        sell_price = 12
    else:
        sell_price = 500

    return {
        "name": name,
        "description": description,
        "sell_price": sell_price
    }


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


def generate_random_spare_part_supplier():
    product_number = random.choice(range(1, 167))
    supplier_id = random.choice(range(1, 82))
    buy_price = Decimal(random.choice(np.arange(1.99, 500, 0.75)).round(2))
    delivery_time = random.choice(range(1, 22))

    return {
        "product_number": product_number,
        "supplier_id": supplier_id,
        "buy_price": buy_price,
        "delivery_time": delivery_time
    }

def generate_random_spare_part_in_store():
    letters = "ABCDEFGHIJKLMNOPQRSTUVXYZ"
    numbers = "123456789"
    product_number = random.choice(range(1, 167))
    store_id = random.choice(range(1, 51))
    shelf_number = f"{random.choice(letters)}{random.choice(numbers)}"
    quantity_in_stock = random.choice(range(10, 201))
    lowest_index = random.choice(range(20, 51))
    quantity_to_order = lowest_index * 3

    return {
        "product_number": product_number,
        "store_id": store_id,
        "shelf_number": shelf_number,
        "quantity_in_stock": quantity_in_stock,
        "lowest_index": lowest_index,
        "quantity_to_order": quantity_to_order
    }


def generate_random_car_model_spare_part():
    car_model = random.choice(range(1, 211))
    spare_part = random.choice(range(1, 167))

    return car_model, spare_part

def generate_company_address():
    #company = random.choice(range(1, 101))
    address = random.choice(range(1, 451))

    return address


def main():
    pass
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

    #for _ in range(150):
    #    spare_part = generate_random_product()
    #    create_spare_part(spare_part)

    # for _ in range(200):
    #     try:
    #         spare_part_supplier = generate_random_spare_part_supplier()
    #         create_spare_part_supplier(spare_part_supplier)
    #     except IntegrityError:
    #         pass

    # for _ in range(71):
    #     spare_part_in_store = generate_random_spare_part_in_store()
    #     create_spare_part_in_store(spare_part_in_store)

    # for _ in range(8):
    #     car_model, spare_part = generate_random_car_model_spare_part()
    #     create_car_model_spare_part(car_model, spare_part)

    # for i in range(1, 101):
    #     company_id = i
    #     address_id = generate_company_address()
    #     create_company_address(company_id, address_id)

    # for _ in range(100):
    #     customer_id = random.choice(range(1,201))
    #     address_id = random.choice(customer_adresse_ids)
    #     create_customer_address(customer_id, address_id)

    # for _ in range(76):
    #     spare_part = random.choice(range(1, 167))
    #     manufacturer = random.choice(range(1, 40))
    #     create_spare_part_manufacturer(spare_part, manufacturer)


if __name__ == "__main__":
    main()
