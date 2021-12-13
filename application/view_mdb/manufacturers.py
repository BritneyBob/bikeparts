from application.controllers.manufacturer_controller import get_manufacturers


def view_manufacturers():
    print("List of our manufacturers: ")
    manufacturers = get_manufacturers()
    for manufacturer in manufacturers:
        print(f"Company id: {manufacturer.company_id}, Company name: {manufacturer.company.company_name}")

    _id = int(input("Please choose the company id for the manufacturer company you want to see information about: "))
    for manufacturer in manufacturers:
        if manufacturer.company_id == _id:
            print(f"\nCompany name: {manufacturer.company.company_name}")
            print(f"Company id: {manufacturer.company.company_id}")
            print(f"Manufacturer id: {manufacturer.manufacturer_id}")
            print(f"\nCompany contact mail: {manufacturer.company.contact_email}")
            print(f"Company contact phone number: {manufacturer.company.contact_phonenumber}\n")
            for address in manufacturer.company.addresses:
                if address.address_type_id == 1:
                    print(f"Delivery address: {address.address_line2}\t {address.zipcode} {address.city_name}\t "
                          f"{address.country_name}")
                elif address.address_type_id == 2:
                    print(f"Billing address: {address.address_line2}\t {address.zipcode} {address.city_name}\t "
                          f"{address.country_name}")
                elif address.address_type_id == 3:
                    print(f"Shipping address: {address.address_line2}\t {address.zipcode} {address.city_name}\t "
                          f"{address.country_name}")

