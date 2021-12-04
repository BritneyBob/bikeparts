from application.controllers.supplier_controller import get_suppliers, show_products_from_company


def negotiate_supplier_prices():
    print('List of our suppliers:')
    suppliers = get_suppliers()
    for supplier in suppliers:
        print(f'Company id: {supplier.company_id}, Company name: {supplier.company.company_name}')
    _id = int(input('Please choose the company id for the company you want to negotiate with: '))  # Validate company number
    for supplier in suppliers:
        if supplier.company_id == _id:
            company_name = supplier.company.company_name
            print(f'\nThese are the products that the company {company_name} sells to you: ')
            break
    name_and_id = show_products_from_company(_id)
    for n in name_and_id:  # Why does PyCharm insert a new line before printing first time?
        print(n)



def adjust_sell_margins():
    pass
