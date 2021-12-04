from application.controllers.supplier_controller import get_suppliers, show_products_from_company


def negotiate_supplier_prices():
    print('List of our suppliers:')
    suppliers = get_suppliers()
    for supplier in suppliers:
        print(f'Company id: {supplier.company_id}, Company name: {supplier.company.company_name}')
    _id = input('Please choose the company id for the company you want to negotiate with: ')  # Validate company number
    print(f'\nThese are the products that the company {supplier.company.company_name} sells to you: ')
    products = show_products_from_company(_id)
    print()
    # for product in products:
    #     print(f'Product number: {product['product_number']} ')


def adjust_sell_margins():
    pass
