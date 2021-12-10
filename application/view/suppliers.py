from application.controllers.supplier_controller import get_suppliers, negotiation  # , show_products_from_company


def negotiate_supplier_prices():
    id_and_buy_price = []
    comp_and_supp_id = {"company_id": 0, "supplier_id": 0}
    print("List of our suppliers:")
    suppliers = get_suppliers()
    for supplier in suppliers:
        print(f"Company id: {supplier.company_id}, Company name: {supplier.company.company_name}")

    _id = int(input("Please choose the company id for the company you want to negotiate with: "))  # Validate company_id
    comp_and_supp_id["company_id"] = _id
    for supplier in suppliers:
        if supplier.company_id == _id:
            company_name = supplier.company.company_name
            comp_and_supp_id["supplier_id"] = supplier.supplier_id
            print(f"\nThese are the products that the company {company_name} sells to you: ")
            for spare_part in supplier.spare_parts:
                print(f"Product id: {spare_part.product_number}, Product name: {spare_part.spare_part.name}, "
                      f"Current buy price: {spare_part.buy_price}")
                id_and_buy_price.append({"product_number: ": spare_part.product_number,
                                         "name: ": spare_part.spare_part.name, "buy_price: ": spare_part.buy_price})
            break

    new_buy_prices = negotiation(id_and_buy_price, comp_and_supp_id)
    print("List with updated prices:")
    for i in range(len(id_and_buy_price)):
        print(f"Product id: {id_and_buy_price[i]['product_number: ']}, Product name: {id_and_buy_price[i]['name: ']}, "
              f"New buy price: {new_buy_prices[i]}")


def view_suppliers():
    print("List of our suppliers: ")
    suppliers = get_suppliers()
    for supplier in suppliers:
        print(f"Company id: {supplier.company_id}, Company name: {supplier.company.company_name}")

    _id = int(input("Please choose the company id for the supplier company you want to see information about: "))
    for supplier in suppliers:
        if supplier.company_id == _id:
            print(f"\nCompany name: {supplier.company.company_name}")
            print(f"Company id: {supplier.company.company_id}")
            print(f"Suppler id: {supplier.supplier_id}")
            print(f"\nCompany contact mail: {supplier.company.contact_email}")
            print(f"Company contact phone number: {supplier.company.contact_phonenumber}\n")
            for address in supplier.company.addresses:
                if address.address_type_id == 1:
                    print(f"Delivery address: {address.address_line2}\t {address.zipcode} {address.city_name}\t "
                          f"{address.country_name}")
                elif address.address_type_id == 2:
                    print(f"Billing address: {address.address_line2}\t {address.zipcode} {address.city_name}\t "
                          f"{address.country_name}")
                elif address.address_type_id == 3:
                    print(f"Shipping address: {address.address_line2}\t {address.zipcode} {address.city_name}\t "
                          f"{address.country_name}")


